-- Deploy ftlc:users_functions to pg
-- requires: users
-- requires users_private

BEGIN;

CREATE FUNCTION ftlc.register_user(
    first_name citext,
    last_name citext,
    email citext,
    password text) RETURNS ftlc.users AS $$
    DECLARE
        person ftlc.users;
    BEGIN
        IF(password = '') THEN
            RAISE EXCEPTION 'No password was provided.';
        END IF;
        INSERT INTO ftlc.users (first_name, last_name, email, role) VALUES ($1, $2, $3, 'ftlc_user') returning * into person;
        INSERT INTO ftlc_private.users(user_id, password_hash) VALUES ((person).id, crypt($4, gen_salt('bf')));
        RETURN person;
    END;
$$ LANGUAGE PLPGSQL STRICT SECURITY DEFINER;

CREATE FUNCTION ftlc.register_other(
    first_name citext,
    last_name citext,
    email citext,
    password text,
    role ftlc.role_type) RETURNS ftlc.users AS $$
    DECLARE
        person ftlc.users;
    BEGIN
        INSERT INTO ftlc.users (first_name, last_name, email, role) VALUES ($1, $2, $3, role) returning * into person;
        INSERT INTO ftlc_private.users(user_id, password_hash) VALUES ((person).id, crypt($4, gen_salt('bf')));
        RETURN person;
    END;
$$ LANGUAGE PLPGSQL STRICT SECURITY DEFINER;

CREATE FUNCTION ftlc.check_email(email CITEXT) RETURNS BOOLEAN AS $$
    SELECT EXISTS(SELECT email FROM ftlc.users WHERE email = $1);
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

CREATE FUNCTION ftlc.generate_password_token(CITEXT) RETURNS TEXT AS $$
    DECLARE
        users_id UUID;
        token TEXT;
    BEGIN
        SELECT id INTO users_id FROM ftlc.users WHERE email = $1;
        IF (users_id IS NULL) THEN
            RETURN 'no user';
        ELSE
            token := crypt(uuid_generate_v4()::TEXT, gen_salt('bf'));
            UPDATE ftlc_private.users SET password_reset = token, password_reset_expiration = NOW() + interval '1 hour' WHERE user_id = users_id;
            RETURN token;
        END IF;
    END;
$$ LANGUAGE PLPGSQL SECURITY DEFINER;

CREATE FUNCTION ftlc.authenticate(CITEXT, password text) RETURNS ftlc.jwt_token AS $$
  DECLARE
    person ftlc_private.users;
    public_person ftlc.users;
    BEGIN
        select a.* into public_person
        from ftlc.users as a
        where a.email = $1;
        select a.* into person
        from ftlc_private.users as a
        where a.user_id = public_person.id;
        IF (person).password_hash = crypt(password, (person).password_hash) THEN
            RETURN((public_person).role, (SELECT (extract(epoch from (now()+'14 day'::interval)))::integer), (public_person).id)::ftlc.jwt_token;
        ELSE
            RETURN null;
        END IF;
    END;
$$ LANGUAGE PLPGSQL STABLE SECURITY DEFINER;

CREATE FUNCTION ftlc.reset_password(TEXT, TEXT) RETURNS VOID AS $$
    BEGIN
        IF $2 = 'BY USER' THEN
            UPDATE ftlc_private.users SET password_hash = crypt($1, gen_salt('bf')) WHERE user_id = ftlc.get_id();
        ELSIF ($2 IS NOT NULL) THEN
            UPDATE ftlc_private.users SET password_hash = crypt($1, gen_salt('bf')), password_reset = NULL WHERE password_reset = $2 AND password_reset_expiration > current_timestamp;
        END IF;
    END;
$$ LANGUAGE PLPGSQL STRICT SECURITY DEFINER;

CREATE FUNCTION ftlc.get_user_data() RETURNS ftlc.users AS $$
    DECLARE
        person ftlc.users;
    BEGIN
        IF(ftlc.get_id() IS NULL) THEN
            RETURN NULL;
        END IF;
        select a.* into person from ftlc.users as a where a.id = ftlc.get_id();
        RETURN person;
    END;
$$ LANGUAGE PLPGSQL STABLE SECURITY DEFINER;

CREATE FUNCTION ftlc.get_id() RETURNS UUID AS $$
    DECLARE
        user_id TEXT;
    BEGIN
        user_id := current_setting('jwt.claims.id', true);
        IF(user_id = '') THEN
            RETURN NULL;
        END IF;
        RETURN uuid(user_id);
    END;
$$ LANGUAGE PLPGSQL;

COMMIT;
