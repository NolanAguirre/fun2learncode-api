--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP POLICY registered_by ON ftlc.event_registration;
DROP POLICY parent_of_student ON ftlc.registration_override;
DROP POLICY parent_of_student ON ftlc.student;
DROP POLICY parent_of_student ON ftlc.student_waiver;
DROP POLICY parent_log ON ftlc.event_log;
DROP POLICY parent_attendance ON ftlc.attendance;
DROP POLICY owner_all ON ftlc.users;
DROP POLICY owner_all ON ftlc.refund_request;
DROP POLICY is_user ON ftlc.users;
DROP POLICY is_user ON ftlc.refund_request;
DROP POLICY is_user ON ftlc.payment;
DROP POLICY employee_view ON ftlc.users;
DROP POLICY employee_view ON ftlc.event_registration;
DROP POLICY employee_all ON ftlc.student;
DROP POLICY employee_all ON ftlc.student_waiver;
DROP POLICY employee_all ON ftlc.event_log;
DROP POLICY employee_all ON ftlc.attendance;
DROP POLICY admin_view ON ftlc.refund_request;
DROP POLICY admin_all ON ftlc.registration_override;
DROP POLICY admin_all ON ftlc.payment;
DROP POLICY admin_all ON ftlc.event_registration;
ALTER TABLE ONLY sqitch.tags DROP CONSTRAINT tags_project_fkey;
ALTER TABLE ONLY sqitch.tags DROP CONSTRAINT tags_change_id_fkey;
ALTER TABLE ONLY sqitch.events DROP CONSTRAINT events_project_fkey;
ALTER TABLE ONLY sqitch.dependencies DROP CONSTRAINT dependencies_dependency_id_fkey;
ALTER TABLE ONLY sqitch.dependencies DROP CONSTRAINT dependencies_change_id_fkey;
ALTER TABLE ONLY sqitch.changes DROP CONSTRAINT changes_project_fkey;
ALTER TABLE ONLY ftlc_private.users DROP CONSTRAINT users_user_id_fkey;
ALTER TABLE ONLY ftlc.transaction_state DROP CONSTRAINT transaction_state_user_id_fkey;
ALTER TABLE ONLY ftlc.student_waiver DROP CONSTRAINT student_waiver_student_fkey;
ALTER TABLE ONLY ftlc.student DROP CONSTRAINT student_parent_fkey;
ALTER TABLE ONLY ftlc.registration_override DROP CONSTRAINT registration_override_student_fkey;
ALTER TABLE ONLY ftlc.registration_override DROP CONSTRAINT registration_override_event_fkey;
ALTER TABLE ONLY ftlc.refund_request DROP CONSTRAINT refund_request_user_id_fkey;
ALTER TABLE ONLY ftlc.refund_request DROP CONSTRAINT refund_request_payment_fkey;
ALTER TABLE ONLY ftlc.promo_code DROP CONSTRAINT promo_code_user_id_fkey;
ALTER TABLE ONLY ftlc.promo_code_use DROP CONSTRAINT promo_code_use_user_id_fkey;
ALTER TABLE ONLY ftlc.promo_code_use DROP CONSTRAINT promo_code_use_promo_code_fkey;
ALTER TABLE ONLY ftlc.promo_code DROP CONSTRAINT promo_code_generated_by_fkey;
ALTER TABLE ONLY ftlc.promo_code DROP CONSTRAINT promo_code_category_fkey;
ALTER TABLE ONLY ftlc.promo_code DROP CONSTRAINT promo_code_activity_fkey;
ALTER TABLE ONLY ftlc.payment DROP CONSTRAINT payment_user_id_fkey;
ALTER TABLE ONLY ftlc.event_request DROP CONSTRAINT event_request_user_id_fkey;
ALTER TABLE ONLY ftlc.event_request DROP CONSTRAINT event_request_event_fkey;
ALTER TABLE ONLY ftlc.event_registration DROP CONSTRAINT event_registration_student_fkey;
ALTER TABLE ONLY ftlc.event_registration DROP CONSTRAINT event_registration_registered_by_fkey;
ALTER TABLE ONLY ftlc.event_registration DROP CONSTRAINT event_registration_payment_fkey;
ALTER TABLE ONLY ftlc.event_registration DROP CONSTRAINT event_registration_event_fkey;
ALTER TABLE ONLY ftlc.event_log DROP CONSTRAINT event_log_student_fkey;
ALTER TABLE ONLY ftlc.event_log DROP CONSTRAINT event_log_instructor_fkey;
ALTER TABLE ONLY ftlc.event_log DROP CONSTRAINT event_log_event_fkey;
ALTER TABLE ONLY ftlc.event_log DROP CONSTRAINT event_log_date_interval_fkey;
ALTER TABLE ONLY ftlc.event DROP CONSTRAINT event_address_fkey;
ALTER TABLE ONLY ftlc.event DROP CONSTRAINT event_activity_fkey;
ALTER TABLE ONLY ftlc.date_join DROP CONSTRAINT date_join_event_fkey;
ALTER TABLE ONLY ftlc.date_join DROP CONSTRAINT date_join_date_interval_fkey;
ALTER TABLE ONLY ftlc.attendance DROP CONSTRAINT attendance_student_fkey;
ALTER TABLE ONLY ftlc.attendance DROP CONSTRAINT attendance_event_fkey;
ALTER TABLE ONLY ftlc.attendance DROP CONSTRAINT attendance_date_interval_fkey;
ALTER TABLE ONLY ftlc.add_on_join DROP CONSTRAINT add_on_join_event_fkey;
ALTER TABLE ONLY ftlc.add_on_join DROP CONSTRAINT add_on_join_add_on_fkey;
ALTER TABLE ONLY ftlc.activity_prerequisite DROP CONSTRAINT activity_prerequisite_prerequisite_fkey;
ALTER TABLE ONLY ftlc.activity_prerequisite DROP CONSTRAINT activity_prerequisite_activity_fkey;
ALTER TABLE ONLY ftlc.activity DROP CONSTRAINT activity_category_fkey;
ALTER TABLE ONLY sqitch.tags DROP CONSTRAINT tags_project_tag_key;
ALTER TABLE ONLY sqitch.tags DROP CONSTRAINT tags_pkey;
ALTER TABLE ONLY sqitch.releases DROP CONSTRAINT releases_pkey;
ALTER TABLE ONLY sqitch.projects DROP CONSTRAINT projects_uri_key;
ALTER TABLE ONLY sqitch.projects DROP CONSTRAINT projects_pkey;
ALTER TABLE ONLY sqitch.events DROP CONSTRAINT events_pkey;
ALTER TABLE ONLY sqitch.dependencies DROP CONSTRAINT dependencies_pkey;
ALTER TABLE ONLY sqitch.changes DROP CONSTRAINT changes_project_script_hash_key;
ALTER TABLE ONLY sqitch.changes DROP CONSTRAINT changes_pkey;
ALTER TABLE ONLY ftlc_private.users DROP CONSTRAINT users_user_id_key;
ALTER TABLE ONLY ftlc_private.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY ftlc.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY ftlc.users DROP CONSTRAINT users_email_key;
ALTER TABLE ONLY ftlc.event_registration DROP CONSTRAINT unqiue_registration;
ALTER TABLE ONLY ftlc.activity_prerequisite DROP CONSTRAINT unique_prerequisite;
ALTER TABLE ONLY ftlc.registration_override DROP CONSTRAINT unique_override;
ALTER TABLE ONLY ftlc.date_join DROP CONSTRAINT unique_date_join;
ALTER TABLE ONLY ftlc.date_interval DROP CONSTRAINT unique_date;
ALTER TABLE ONLY ftlc.attendance DROP CONSTRAINT unique_attendance;
ALTER TABLE ONLY ftlc.add_on_join DROP CONSTRAINT unique_add_on_join;
ALTER TABLE ONLY ftlc.transaction_state DROP CONSTRAINT transaction_state_pkey;
ALTER TABLE ONLY ftlc.student_waiver DROP CONSTRAINT student_waiver_pkey;
ALTER TABLE ONLY ftlc.student DROP CONSTRAINT student_pkey;
ALTER TABLE ONLY ftlc.promo_code_use DROP CONSTRAINT sigle_use;
ALTER TABLE ONLY ftlc.registration_override DROP CONSTRAINT registration_override_pkey;
ALTER TABLE ONLY ftlc.refund_request DROP CONSTRAINT refund_request_pkey;
ALTER TABLE ONLY ftlc.promo_code_use DROP CONSTRAINT promo_code_use_pkey;
ALTER TABLE ONLY ftlc.promo_code DROP CONSTRAINT promo_code_pkey;
ALTER TABLE ONLY ftlc.promo_code DROP CONSTRAINT promo_code_code_key;
ALTER TABLE ONLY ftlc.payment DROP CONSTRAINT payment_pkey;
ALTER TABLE ONLY ftlc.refund_request DROP CONSTRAINT one_refund_request;
ALTER TABLE ONLY ftlc.news_letter DROP CONSTRAINT news_letter_pkey;
ALTER TABLE ONLY ftlc.news_letter DROP CONSTRAINT news_letter_email_key;
ALTER TABLE ONLY ftlc.event_request DROP CONSTRAINT event_request_pkey;
ALTER TABLE ONLY ftlc.event_request DROP CONSTRAINT event_request_access_token_key;
ALTER TABLE ONLY ftlc.event_registration DROP CONSTRAINT event_registration_pkey;
ALTER TABLE ONLY ftlc.event DROP CONSTRAINT event_pkey;
ALTER TABLE ONLY ftlc.event_log DROP CONSTRAINT event_log_pkey;
ALTER TABLE ONLY ftlc.date_join DROP CONSTRAINT date_join_pkey;
ALTER TABLE ONLY ftlc.date_interval DROP CONSTRAINT date_interval_pkey;
ALTER TABLE ONLY ftlc.category DROP CONSTRAINT category_pkey;
ALTER TABLE ONLY ftlc.category DROP CONSTRAINT category_name_key;
ALTER TABLE ONLY ftlc.announcement DROP CONSTRAINT announcement_pkey;
ALTER TABLE ONLY ftlc.address DROP CONSTRAINT address_pkey;
ALTER TABLE ONLY ftlc.add_on DROP CONSTRAINT add_on_pkey;
ALTER TABLE ONLY ftlc.add_on_join DROP CONSTRAINT add_on_join_pkey;
ALTER TABLE ONLY ftlc.activity_prerequisite DROP CONSTRAINT activity_prerequisite_pkey;
ALTER TABLE ONLY ftlc.activity DROP CONSTRAINT activity_pkey;
ALTER TABLE ftlc.announcement ALTER COLUMN id DROP DEFAULT;
DROP TABLE sqitch.tags;
DROP TABLE sqitch.releases;
DROP TABLE sqitch.projects;
DROP TABLE sqitch.events;
DROP TABLE sqitch.dependencies;
DROP TABLE sqitch.changes;
DROP TABLE ftlc_private.users;
DROP TABLE ftlc.transaction_state;
DROP TABLE ftlc.student_waiver;
DROP TABLE ftlc.student;
DROP TABLE ftlc.registration_override;
DROP TABLE ftlc.refund_request;
DROP TABLE ftlc.promo_code_use;
DROP TABLE ftlc.promo_code;
DROP TABLE ftlc.payment;
DROP TABLE ftlc.news_letter;
DROP TABLE ftlc.event_request;
DROP TABLE ftlc.event_registration;
DROP TABLE ftlc.event_log;
DROP TABLE ftlc.date_interval;
DROP TABLE ftlc.category;
DROP TABLE ftlc.attendance;
DROP SEQUENCE ftlc.announcement_id_seq;
DROP TABLE ftlc.announcement;
DROP TABLE ftlc.address;
DROP TABLE ftlc.add_on_join;
DROP TABLE ftlc.add_on;
DROP TABLE ftlc.activity_prerequisite;
DROP TABLE ftlc.activity;
DROP FUNCTION ftlc.store_transaction(uuid, jsonb);
DROP FUNCTION ftlc.reset_password(text, text);
DROP FUNCTION ftlc.remove_news_letter(uuid);
DROP FUNCTION ftlc.remove_date_interval(timestamp with time zone, timestamp with time zone, uuid);
DROP FUNCTION ftlc.register_user(first_name public.citext, last_name public.citext, email public.citext, password text);
DROP FUNCTION ftlc.register_other(first_name public.citext, last_name public.citext, email public.citext, password text, role ftlc.role_type);
DROP FUNCTION ftlc.make_news_letter(public.citext);
DROP FUNCTION ftlc.make_date_interval(timestamp with time zone, timestamp with time zone, uuid);
DROP TABLE ftlc.date_join;
DROP FUNCTION ftlc.get_user_data();
DROP TABLE ftlc.users;
DROP FUNCTION ftlc.get_id();
DROP FUNCTION ftlc.generate_password_token(public.citext);
DROP FUNCTION ftlc.event_in_dates(timestamp with time zone, timestamp with time zone);
DROP FUNCTION ftlc.event_by_token(text);
DROP TABLE ftlc.event;
DROP FUNCTION ftlc.check_waiver(uuid);
DROP FUNCTION ftlc.check_time(uuid, uuid);
DROP FUNCTION ftlc.check_registration(uuid, uuid);
DROP FUNCTION ftlc.check_prerequisite(uuid, uuid);
DROP FUNCTION ftlc.check_email(email public.citext);
DROP FUNCTION ftlc.authenticate(public.citext, password text);
DROP TYPE ftlc.request_type;
DROP TYPE ftlc.payment_status_type;
DROP TYPE ftlc.jwt_token;
DROP TYPE ftlc.role_type;
DROP EXTENSION "uuid-ossp";
DROP EXTENSION pgcrypto;
DROP EXTENSION citext;
DROP EXTENSION plpgsql;
DROP SCHEMA sqitch;
DROP SCHEMA public;
DROP SCHEMA ftlc_private;
DROP SCHEMA ftlc;
--
-- Name: ftlc; Type: SCHEMA; Schema: -; Owner: nolan
--

CREATE SCHEMA ftlc;


ALTER SCHEMA ftlc OWNER TO nolan;

--
-- Name: ftlc_private; Type: SCHEMA; Schema: -; Owner: nolan
--

CREATE SCHEMA ftlc_private;


ALTER SCHEMA ftlc_private OWNER TO nolan;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: sqitch; Type: SCHEMA; Schema: -; Owner: nolan
--

CREATE SCHEMA sqitch;


ALTER SCHEMA sqitch OWNER TO nolan;

--
-- Name: SCHEMA sqitch; Type: COMMENT; Schema: -; Owner: nolan
--

COMMENT ON SCHEMA sqitch IS 'Sqitch database deployment metadata v1.0.';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: role_type; Type: TYPE; Schema: ftlc; Owner: nolan
--

CREATE TYPE ftlc.role_type AS ENUM (
    'ftlc_owner',
    'ftlc_admin',
    'ftlc_instructor',
    'ftlc_attendant',
    'ftlc_user',
    'ftlc_student',
    'ftlc_anonymous'
);


ALTER TYPE ftlc.role_type OWNER TO nolan;

--
-- Name: jwt_token; Type: TYPE; Schema: ftlc; Owner: nolan
--

CREATE TYPE ftlc.jwt_token AS (
	role ftlc.role_type,
	expires_at integer,
	id uuid
);


ALTER TYPE ftlc.jwt_token OWNER TO nolan;

--
-- Name: payment_status_type; Type: TYPE; Schema: ftlc; Owner: nolan
--

CREATE TYPE ftlc.payment_status_type AS ENUM (
    'paid',
    'refund'
);


ALTER TYPE ftlc.payment_status_type OWNER TO nolan;

--
-- Name: request_type; Type: TYPE; Schema: ftlc; Owner: nolan
--

CREATE TYPE ftlc.request_type AS ENUM (
    'accepted',
    'declined',
    'pending',
    'cancled'
);


ALTER TYPE ftlc.request_type OWNER TO nolan;

--
-- Name: authenticate(public.citext, text); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.authenticate(public.citext, password text) RETURNS ftlc.jwt_token
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $_$
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
$_$;


ALTER FUNCTION ftlc.authenticate(public.citext, password text) OWNER TO nolan;

--
-- Name: check_email(public.citext); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.check_email(email public.citext) RETURNS boolean
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $_$
    SELECT EXISTS(SELECT email FROM ftlc.users WHERE email = $1);
$_$;


ALTER FUNCTION ftlc.check_email(email public.citext) OWNER TO nolan;

--
-- Name: check_prerequisite(uuid, uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.check_prerequisite(uuid, uuid) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $_$
    DECLARE
        prerequisites UUID[];
        student_events UUID[];
    BEGIN
        IF (SELECT EXISTS(SELECT * FROM ftlc.registration_override WHERE event = $1 AND student = $2 AND valid_end > NOW())) THEN
            RETURN TRUE;
        END IF;
        SELECT array(
            SELECT prerequisite FROM ftlc.activity_prerequisite WHERE activity =
                (SELECT activity FROM ftlc.event WHERE id = $1)) INTO prerequisites;
        SELECT array(
            SELECT DISTINCT activity FROM ftlc.event WHERE close_registration < (SELECT close_registration FROM ftlc.event WHERE id = $1) and id IN
                (SELECT event from ftlc.event_registration WHERE student = $2)) INTO student_events;
        RETURN student_events @> prerequisites;
    END;
$_$;


ALTER FUNCTION ftlc.check_prerequisite(uuid, uuid) OWNER TO nolan;

--
-- Name: check_registration(uuid, uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.check_registration(uuid, uuid) RETURNS boolean
    LANGUAGE sql STABLE
    AS $_$
    SELECT NOT EXISTS(SELECT 1 FROM ftlc.event_registration WHERE event = $1 AND student = $2);
$_$;


ALTER FUNCTION ftlc.check_registration(uuid, uuid) OWNER TO nolan;

--
-- Name: check_time(uuid, uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.check_time(uuid, uuid) RETURNS boolean
    LANGUAGE plpgsql STABLE
    AS $_$
    DECLARE
        dates UUID[];
    BEGIN
        SELECT array(
            SELECT DISTINCT date_interval FROM ftlc.date_join WHERE event IN (
                SELECT event FROM ftlc.event_registration WHERE student = $2)) INTO dates;
        RETURN NOT EXISTS(SELECT 1 FROM ftlc.date_interval WHERE id IN (SELECT date_interval FROM ftlc.date_join WHERE event = $1) AND id = ANY(dates));
    END;
$_$;


ALTER FUNCTION ftlc.check_time(uuid, uuid) OWNER TO nolan;

--
-- Name: check_waiver(uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.check_waiver(uuid) RETURNS boolean
    LANGUAGE sql STABLE
    AS $_$
    SELECT EXISTS(SELECT 1 FROM ftlc.student_waiver WHERE student = $1 AND created_on > (NOW() - interval '1 years'));
$_$;


ALTER FUNCTION ftlc.check_waiver(uuid) OWNER TO nolan;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: event; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.event (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    activity uuid NOT NULL,
    address uuid NOT NULL,
    open_registration timestamp with time zone NOT NULL,
    close_registration timestamp with time zone NOT NULL,
    capacity integer NOT NULL,
    seats_left integer NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    show_calendar boolean DEFAULT true,
    archive boolean DEFAULT false,
    public_display boolean DEFAULT true
);


ALTER TABLE ftlc.event OWNER TO nolan;

--
-- Name: event_by_token(text); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.event_by_token(text) RETURNS ftlc.event
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $_$
    SELECT * FROM ftlc.event WHERE id =
        (SELECT event FROM ftlc.event_request WHERE access_token = $1 AND
            ((status = 'accepted' AND user_id = ftlc.get_id())
            OR
            (SELECT EXISTS (SELECT * FROM ftlc.payment WHERE user_id = (SELECT user_id FROM ftlc.event_request WHERE access_token = $1) AND id IN (SELECT DISTINCT payment FROM ftlc.event_registration WHERE event = (SELECT event FROM ftlc.event_request WHERE access_token = $1) AND registered_by = (SELECT user_id FROM ftlc.event_request WHERE access_token = $1))))));
$_$;


ALTER FUNCTION ftlc.event_by_token(text) OWNER TO nolan;

--
-- Name: event_in_dates(timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.event_in_dates(timestamp with time zone, timestamp with time zone) RETURNS SETOF ftlc.event
    LANGUAGE plpgsql STABLE
    AS $_$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.event WHERE id IN
            (SELECT DISTINCT event FROM ftlc.date_join WHERE date_interval IN
                (SELECT id FROM ftlc.date_interval WHERE start > $1 AND start < $2));
    END;
$_$;


ALTER FUNCTION ftlc.event_in_dates(timestamp with time zone, timestamp with time zone) OWNER TO nolan;

--
-- Name: generate_password_token(public.citext); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.generate_password_token(public.citext) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
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
$_$;


ALTER FUNCTION ftlc.generate_password_token(public.citext) OWNER TO nolan;

--
-- Name: get_id(); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.get_id() RETURNS uuid
    LANGUAGE plpgsql
    AS $$
    DECLARE
        user_id TEXT;
    BEGIN
        user_id := current_setting('jwt.claims.id', true);
        IF(user_id = '') THEN
            RETURN NULL;
        END IF;
        RETURN uuid(user_id);
    END;
$$;


ALTER FUNCTION ftlc.get_id() OWNER TO nolan;

--
-- Name: users; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    first_name public.citext NOT NULL,
    last_name public.citext NOT NULL,
    email public.citext NOT NULL,
    created_on timestamp with time zone DEFAULT now() NOT NULL,
    role ftlc.role_type NOT NULL,
    CONSTRAINT users_email_check CHECK ((email OPERATOR(public.~*) '^.+@.+\..+$'::public.citext)),
    CONSTRAINT users_first_name_check CHECK ((first_name OPERATOR(public.<>) ''::public.citext)),
    CONSTRAINT users_last_name_check CHECK ((last_name OPERATOR(public.<>) ''::public.citext))
);


ALTER TABLE ftlc.users OWNER TO nolan;

--
-- Name: get_user_data(); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.get_user_data() RETURNS ftlc.users
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
    DECLARE
        person ftlc.users;
    BEGIN
        IF(ftlc.get_id() IS NULL) THEN
            RETURN NULL;
        END IF;
        select a.* into person from ftlc.users as a where a.id = ftlc.get_id();
        RETURN person;
    END;
$$;


ALTER FUNCTION ftlc.get_user_data() OWNER TO nolan;

--
-- Name: date_join; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.date_join (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event uuid NOT NULL,
    date_interval uuid NOT NULL
);


ALTER TABLE ftlc.date_join OWNER TO nolan;

--
-- Name: make_date_interval(timestamp with time zone, timestamp with time zone, uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.make_date_interval(timestamp with time zone, timestamp with time zone, uuid) RETURNS ftlc.date_join
    LANGUAGE plpgsql STRICT
    AS $_$
    DECLARE
       dateInterval UUID;
       date_join ftlc.date_join;
   BEGIN
   SELECT id INTO dateInterval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF(dateInterval IS NULL) THEN
       INSERT INTO ftlc.date_interval (start, "end") VALUES ($1, $2) RETURNING id INTO dateInterval;
   END IF;
   SELECT * INTO date_join FROM ftlc.date_join WHERE date_interval = dateInterval AND event = $3;
   IF(date_join IS NULL) THEN
      INSERT INTO ftlc.date_join (event, date_interval) VALUES ($3, dateInterval) RETURNING * INTO date_join;
   END IF;
   RETURN date_join;
   END;
$_$;


ALTER FUNCTION ftlc.make_date_interval(timestamp with time zone, timestamp with time zone, uuid) OWNER TO nolan;

--
-- Name: make_news_letter(public.citext); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.make_news_letter(public.citext) RETURNS void
    LANGUAGE sql STRICT
    AS $_$
    INSERT INTO ftlc.news_letter (email) VALUES ($1);
$_$;


ALTER FUNCTION ftlc.make_news_letter(public.citext) OWNER TO nolan;

--
-- Name: register_other(public.citext, public.citext, public.citext, text, ftlc.role_type); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.register_other(first_name public.citext, last_name public.citext, email public.citext, password text, role ftlc.role_type) RETURNS ftlc.users
    LANGUAGE plpgsql STRICT SECURITY DEFINER
    AS $_$
    DECLARE
        person ftlc.users;
    BEGIN
        INSERT INTO ftlc.users (first_name, last_name, email, role) VALUES ($1, $2, $3, role) returning * into person;
        INSERT INTO ftlc_private.users(user_id, password_hash) VALUES ((person).id, crypt($4, gen_salt('bf')));
        RETURN person;
    END;
$_$;


ALTER FUNCTION ftlc.register_other(first_name public.citext, last_name public.citext, email public.citext, password text, role ftlc.role_type) OWNER TO nolan;

--
-- Name: register_user(public.citext, public.citext, public.citext, text); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.register_user(first_name public.citext, last_name public.citext, email public.citext, password text) RETURNS ftlc.users
    LANGUAGE plpgsql STRICT SECURITY DEFINER
    AS $_$
    DECLARE
        person ftlc.users;
    BEGIN
        IF(LENGTH(password) < 5 OR  LENGTH(password) >71) THEN
            RAISE EXCEPTION 'Password must be between 6 and 72 characters.';
        END IF;
        INSERT INTO ftlc.users (first_name, last_name, email, role) VALUES ($1, $2, $3, 'ftlc_user') returning * into person;
        INSERT INTO ftlc_private.users(user_id, password_hash) VALUES ((person).id, crypt($4, gen_salt('bf')));
        RETURN person;
    END;
$_$;


ALTER FUNCTION ftlc.register_user(first_name public.citext, last_name public.citext, email public.citext, password text) OWNER TO nolan;

--
-- Name: remove_date_interval(timestamp with time zone, timestamp with time zone, uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.remove_date_interval(timestamp with time zone, timestamp with time zone, uuid) RETURNS ftlc.date_join
    LANGUAGE plpgsql STRICT
    AS $_$
   DECLARE -- THIS MIGHT HAVE ISSUES, NEEDS MORE TESTING
      dateInterval UUID;
      date_join ftlc.date_join;
   BEGIN
   SELECT id INTO dateInterval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF( dateInterval IS NOT NULL) THEN
       DELETE FROM ftlc.date_join WHERE date_interval = dateInterval AND event = $3 RETURNING * INTO date_join;
       IF(SELECT NOT EXISTS(SELECT * from ftlc.date_join WHERE date_interval =  dateInterval)) THEN
           DELETE FROM ftlc.date_interval WHERE id = dateInterval;
       END IF;
   END IF;
   RETURN date_join;
   END;
$_$;


ALTER FUNCTION ftlc.remove_date_interval(timestamp with time zone, timestamp with time zone, uuid) OWNER TO nolan;

--
-- Name: remove_news_letter(uuid); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.remove_news_letter(uuid) RETURNS void
    LANGUAGE sql STRICT SECURITY DEFINER
    AS $_$
    DELETE FROM ftlc.news_letter WHERE id = $1;
$_$;


ALTER FUNCTION ftlc.remove_news_letter(uuid) OWNER TO nolan;

--
-- Name: reset_password(text, text); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.reset_password(text, text) RETURNS void
    LANGUAGE plpgsql STRICT SECURITY DEFINER
    AS $_$
    BEGIN
        IF $2 = 'BY USER' THEN
            UPDATE ftlc_private.users SET password_hash = crypt($1, gen_salt('bf')) WHERE user_id = ftlc.get_id();
        ELSIF ($2 IS NOT NULL) THEN
            UPDATE ftlc_private.users SET password_hash = crypt($1, gen_salt('bf')), password_reset = NULL WHERE password_reset = $2 AND password_reset_expiration > current_timestamp;
        END IF;
    END;
$_$;


ALTER FUNCTION ftlc.reset_password(text, text) OWNER TO nolan;

--
-- Name: store_transaction(uuid, jsonb); Type: FUNCTION; Schema: ftlc; Owner: nolan
--

CREATE FUNCTION ftlc.store_transaction(uuid, jsonb) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
    DECLARE
        temp ftlc.transaction_state;
    BEGIN
        SELECT * INTO temp FROM ftlc.transaction_state WHERE user_id = $1;
        IF(temp IS NULL) THEN
            INSERT INTO ftlc.transaction_state (user_id, transaction, processing) VALUES ($1, $2, false);
        ELSIF(temp.processing = true) THEN
            RAISE EXCEPTION 'transaction is already being processed';
        ELSE
            UPDATE ftlc.transaction_state SET transaction = $2 WHERE user_id = $1;
        END IF;
    END;
$_$;


ALTER FUNCTION ftlc.store_transaction(uuid, jsonb) OWNER TO nolan;

--
-- Name: activity; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.activity (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    category uuid NOT NULL,
    url public.citext NOT NULL,
    name public.citext NOT NULL,
    description public.citext NOT NULL,
    public_display boolean DEFAULT true,
    archive boolean DEFAULT false
);


ALTER TABLE ftlc.activity OWNER TO nolan;

--
-- Name: activity_prerequisite; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.activity_prerequisite (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    activity uuid NOT NULL,
    prerequisite uuid NOT NULL,
    CONSTRAINT not_self CHECK ((activity <> prerequisite))
);


ALTER TABLE ftlc.activity_prerequisite OWNER TO nolan;

--
-- Name: add_on; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.add_on (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name public.citext NOT NULL,
    description public.citext NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE ftlc.add_on OWNER TO nolan;

--
-- Name: add_on_join; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.add_on_join (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event uuid NOT NULL,
    add_on uuid NOT NULL
);


ALTER TABLE ftlc.add_on_join OWNER TO nolan;

--
-- Name: address; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.address (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    street public.citext NOT NULL,
    city public.citext NOT NULL,
    zipcode character varying(5) NOT NULL,
    state public.citext NOT NULL,
    country public.citext NOT NULL,
    alias public.citext NOT NULL,
    archive boolean DEFAULT false
);


ALTER TABLE ftlc.address OWNER TO nolan;

--
-- Name: announcement; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.announcement (
    id integer NOT NULL,
    title public.citext NOT NULL,
    message public.citext NOT NULL,
    created_on timestamp with time zone DEFAULT now()
);


ALTER TABLE ftlc.announcement OWNER TO nolan;

--
-- Name: announcement_id_seq; Type: SEQUENCE; Schema: ftlc; Owner: nolan
--

CREATE SEQUENCE ftlc.announcement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ftlc.announcement_id_seq OWNER TO nolan;

--
-- Name: announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: ftlc; Owner: nolan
--

ALTER SEQUENCE ftlc.announcement_id_seq OWNED BY ftlc.announcement.id;


--
-- Name: attendance; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.attendance (
    id uuid DEFAULT public.uuid_generate_v4(),
    student uuid NOT NULL,
    date_interval uuid NOT NULL,
    event uuid NOT NULL,
    present boolean NOT NULL,
    check_in_time timestamp with time zone DEFAULT now()
);


ALTER TABLE ftlc.attendance OWNER TO nolan;

--
-- Name: category; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.category (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name public.citext NOT NULL,
    description public.citext NOT NULL
);


ALTER TABLE ftlc.category OWNER TO nolan;

--
-- Name: date_interval; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.date_interval (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    archive boolean DEFAULT false,
    CONSTRAINT date_interval_check CHECK (("end" > start))
);


ALTER TABLE ftlc.date_interval OWNER TO nolan;

--
-- Name: event_log; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.event_log (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event uuid NOT NULL,
    date_interval uuid NOT NULL,
    student uuid NOT NULL,
    instructor uuid,
    comment public.citext
);


ALTER TABLE ftlc.event_log OWNER TO nolan;

--
-- Name: event_registration; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.event_registration (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    registered_by uuid NOT NULL,
    student uuid NOT NULL,
    event uuid NOT NULL,
    payment uuid NOT NULL,
    registered_on timestamp with time zone DEFAULT now()
);


ALTER TABLE ftlc.event_registration OWNER TO nolan;

--
-- Name: event_request; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.event_request (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid DEFAULT ftlc.get_id() NOT NULL,
    event uuid,
    created_on timestamp with time zone DEFAULT now(),
    information public.citext NOT NULL,
    access_token text,
    status ftlc.request_type DEFAULT 'pending'::ftlc.request_type
);


ALTER TABLE ftlc.event_request OWNER TO nolan;

--
-- Name: news_letter; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.news_letter (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email public.citext NOT NULL,
    CONSTRAINT news_letter_email_check CHECK ((email OPERATOR(public.~*) '^.+@.+\..+$'::public.citext))
);


ALTER TABLE ftlc.news_letter OWNER TO nolan;

--
-- Name: payment; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.payment (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    status ftlc.payment_status_type DEFAULT 'paid'::ftlc.payment_status_type NOT NULL,
    create_on timestamp with time zone DEFAULT now() NOT NULL,
    snapshot jsonb NOT NULL,
    charge jsonb NOT NULL,
    refund jsonb
);


ALTER TABLE ftlc.payment OWNER TO nolan;

--
-- Name: promo_code; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.promo_code (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code text NOT NULL,
    for_category boolean NOT NULL,
    for_activity boolean NOT NULL,
    for_user boolean NOT NULL,
    percent boolean NOT NULL,
    category uuid,
    generated_by uuid,
    activity uuid,
    user_id uuid,
    effect integer NOT NULL,
    uses integer NOT NULL,
    created_on timestamp with time zone DEFAULT now(),
    valid_start timestamp with time zone DEFAULT now(),
    valid_end timestamp with time zone NOT NULL,
    archive boolean DEFAULT false,
    disabled boolean DEFAULT false
);


ALTER TABLE ftlc.promo_code OWNER TO nolan;

--
-- Name: promo_code_use; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.promo_code_use (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    promo_code uuid NOT NULL
);


ALTER TABLE ftlc.promo_code_use OWNER TO nolan;

--
-- Name: refund_request; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.refund_request (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    payment uuid NOT NULL,
    user_id uuid DEFAULT ftlc.get_id() NOT NULL,
    created_on timestamp with time zone DEFAULT now(),
    reason public.citext NOT NULL,
    granted_reason public.citext,
    amount_refunded double precision,
    status ftlc.request_type DEFAULT 'pending'::ftlc.request_type
);


ALTER TABLE ftlc.refund_request OWNER TO nolan;

--
-- Name: registration_override; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.registration_override (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    student uuid NOT NULL,
    event uuid NOT NULL,
    modified_price double precision NOT NULL,
    valid_end timestamp with time zone NOT NULL
);


ALTER TABLE ftlc.registration_override OWNER TO nolan;

--
-- Name: student; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.student (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    parent uuid DEFAULT ftlc.get_id() NOT NULL,
    first_name public.citext NOT NULL,
    last_name public.citext NOT NULL,
    date_of_birth timestamp with time zone NOT NULL,
    CONSTRAINT student_first_name_check CHECK ((first_name OPERATOR(public.<>) ''::public.citext)),
    CONSTRAINT student_last_name_check CHECK ((last_name OPERATOR(public.<>) ''::public.citext))
);


ALTER TABLE ftlc.student OWNER TO nolan;

--
-- Name: student_waiver; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.student_waiver (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    student uuid,
    primary_care public.citext,
    primary_care_phone character varying(14),
    emergency_phone character varying(14),
    pickup_one public.citext,
    pickup_two public.citext,
    other public.citext,
    created_on timestamp with time zone DEFAULT now()
);


ALTER TABLE ftlc.student_waiver OWNER TO nolan;

--
-- Name: transaction_state; Type: TABLE; Schema: ftlc; Owner: nolan
--

CREATE TABLE ftlc.transaction_state (
    user_id uuid NOT NULL,
    transaction jsonb NOT NULL,
    processing boolean NOT NULL
);


ALTER TABLE ftlc.transaction_state OWNER TO nolan;

--
-- Name: users; Type: TABLE; Schema: ftlc_private; Owner: nolan
--

CREATE TABLE ftlc_private.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    password_hash text NOT NULL,
    password_reset text,
    password_reset_expiration timestamp with time zone
);


ALTER TABLE ftlc_private.users OWNER TO nolan;

--
-- Name: changes; Type: TABLE; Schema: sqitch; Owner: nolan
--

CREATE TABLE sqitch.changes (
    change_id text NOT NULL,
    script_hash text,
    change text NOT NULL,
    project text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    committed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    committer_name text NOT NULL,
    committer_email text NOT NULL,
    planned_at timestamp with time zone NOT NULL,
    planner_name text NOT NULL,
    planner_email text NOT NULL
);


ALTER TABLE sqitch.changes OWNER TO nolan;

--
-- Name: TABLE changes; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON TABLE sqitch.changes IS 'Tracks the changes currently deployed to the database.';


--
-- Name: COLUMN changes.change_id; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.change_id IS 'Change primary key.';


--
-- Name: COLUMN changes.script_hash; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.script_hash IS 'Deploy script SHA-1 hash.';


--
-- Name: COLUMN changes.change; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.change IS 'Name of a deployed change.';


--
-- Name: COLUMN changes.project; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.project IS 'Name of the Sqitch project to which the change belongs.';


--
-- Name: COLUMN changes.note; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.note IS 'Description of the change.';


--
-- Name: COLUMN changes.committed_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.committed_at IS 'Date the change was deployed.';


--
-- Name: COLUMN changes.committer_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.committer_name IS 'Name of the user who deployed the change.';


--
-- Name: COLUMN changes.committer_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.committer_email IS 'Email address of the user who deployed the change.';


--
-- Name: COLUMN changes.planned_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.planned_at IS 'Date the change was added to the plan.';


--
-- Name: COLUMN changes.planner_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.planner_name IS 'Name of the user who planed the change.';


--
-- Name: COLUMN changes.planner_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.changes.planner_email IS 'Email address of the user who planned the change.';


--
-- Name: dependencies; Type: TABLE; Schema: sqitch; Owner: nolan
--

CREATE TABLE sqitch.dependencies (
    change_id text NOT NULL,
    type text NOT NULL,
    dependency text NOT NULL,
    dependency_id text,
    CONSTRAINT dependencies_check CHECK ((((type = 'require'::text) AND (dependency_id IS NOT NULL)) OR ((type = 'conflict'::text) AND (dependency_id IS NULL))))
);


ALTER TABLE sqitch.dependencies OWNER TO nolan;

--
-- Name: TABLE dependencies; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON TABLE sqitch.dependencies IS 'Tracks the currently satisfied dependencies.';


--
-- Name: COLUMN dependencies.change_id; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.dependencies.change_id IS 'ID of the depending change.';


--
-- Name: COLUMN dependencies.type; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.dependencies.type IS 'Type of dependency.';


--
-- Name: COLUMN dependencies.dependency; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.dependencies.dependency IS 'Dependency name.';


--
-- Name: COLUMN dependencies.dependency_id; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.dependencies.dependency_id IS 'Change ID the dependency resolves to.';


--
-- Name: events; Type: TABLE; Schema: sqitch; Owner: nolan
--

CREATE TABLE sqitch.events (
    event text NOT NULL,
    change_id text NOT NULL,
    change text NOT NULL,
    project text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    requires text[] DEFAULT '{}'::text[] NOT NULL,
    conflicts text[] DEFAULT '{}'::text[] NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    committed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    committer_name text NOT NULL,
    committer_email text NOT NULL,
    planned_at timestamp with time zone NOT NULL,
    planner_name text NOT NULL,
    planner_email text NOT NULL,
    CONSTRAINT events_event_check CHECK ((event = ANY (ARRAY['deploy'::text, 'revert'::text, 'fail'::text, 'merge'::text])))
);


ALTER TABLE sqitch.events OWNER TO nolan;

--
-- Name: TABLE events; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON TABLE sqitch.events IS 'Contains full history of all deployment events.';


--
-- Name: COLUMN events.event; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.event IS 'Type of event.';


--
-- Name: COLUMN events.change_id; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.change_id IS 'Change ID.';


--
-- Name: COLUMN events.change; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.change IS 'Change name.';


--
-- Name: COLUMN events.project; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.project IS 'Name of the Sqitch project to which the change belongs.';


--
-- Name: COLUMN events.note; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.note IS 'Description of the change.';


--
-- Name: COLUMN events.requires; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.requires IS 'Array of the names of required changes.';


--
-- Name: COLUMN events.conflicts; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.conflicts IS 'Array of the names of conflicting changes.';


--
-- Name: COLUMN events.tags; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.tags IS 'Tags associated with the change.';


--
-- Name: COLUMN events.committed_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.committed_at IS 'Date the event was committed.';


--
-- Name: COLUMN events.committer_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.committer_name IS 'Name of the user who committed the event.';


--
-- Name: COLUMN events.committer_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.committer_email IS 'Email address of the user who committed the event.';


--
-- Name: COLUMN events.planned_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.planned_at IS 'Date the event was added to the plan.';


--
-- Name: COLUMN events.planner_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.planner_name IS 'Name of the user who planed the change.';


--
-- Name: COLUMN events.planner_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.events.planner_email IS 'Email address of the user who plan planned the change.';


--
-- Name: projects; Type: TABLE; Schema: sqitch; Owner: nolan
--

CREATE TABLE sqitch.projects (
    project text NOT NULL,
    uri text,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    creator_name text NOT NULL,
    creator_email text NOT NULL
);


ALTER TABLE sqitch.projects OWNER TO nolan;

--
-- Name: TABLE projects; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON TABLE sqitch.projects IS 'Sqitch projects deployed to this database.';


--
-- Name: COLUMN projects.project; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.projects.project IS 'Unique Name of a project.';


--
-- Name: COLUMN projects.uri; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.projects.uri IS 'Optional project URI';


--
-- Name: COLUMN projects.created_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.projects.created_at IS 'Date the project was added to the database.';


--
-- Name: COLUMN projects.creator_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.projects.creator_name IS 'Name of the user who added the project.';


--
-- Name: COLUMN projects.creator_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.projects.creator_email IS 'Email address of the user who added the project.';


--
-- Name: releases; Type: TABLE; Schema: sqitch; Owner: nolan
--

CREATE TABLE sqitch.releases (
    version real NOT NULL,
    installed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    installer_name text NOT NULL,
    installer_email text NOT NULL
);


ALTER TABLE sqitch.releases OWNER TO nolan;

--
-- Name: TABLE releases; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON TABLE sqitch.releases IS 'Sqitch registry releases.';


--
-- Name: COLUMN releases.version; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.releases.version IS 'Version of the Sqitch registry.';


--
-- Name: COLUMN releases.installed_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.releases.installed_at IS 'Date the registry release was installed.';


--
-- Name: COLUMN releases.installer_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.releases.installer_name IS 'Name of the user who installed the registry release.';


--
-- Name: COLUMN releases.installer_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.releases.installer_email IS 'Email address of the user who installed the registry release.';


--
-- Name: tags; Type: TABLE; Schema: sqitch; Owner: nolan
--

CREATE TABLE sqitch.tags (
    tag_id text NOT NULL,
    tag text NOT NULL,
    project text NOT NULL,
    change_id text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    committed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    committer_name text NOT NULL,
    committer_email text NOT NULL,
    planned_at timestamp with time zone NOT NULL,
    planner_name text NOT NULL,
    planner_email text NOT NULL
);


ALTER TABLE sqitch.tags OWNER TO nolan;

--
-- Name: TABLE tags; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON TABLE sqitch.tags IS 'Tracks the tags currently applied to the database.';


--
-- Name: COLUMN tags.tag_id; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.tag_id IS 'Tag primary key.';


--
-- Name: COLUMN tags.tag; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.tag IS 'Project-unique tag name.';


--
-- Name: COLUMN tags.project; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.project IS 'Name of the Sqitch project to which the tag belongs.';


--
-- Name: COLUMN tags.change_id; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.change_id IS 'ID of last change deployed before the tag was applied.';


--
-- Name: COLUMN tags.note; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.note IS 'Description of the tag.';


--
-- Name: COLUMN tags.committed_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.committed_at IS 'Date the tag was applied to the database.';


--
-- Name: COLUMN tags.committer_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.committer_name IS 'Name of the user who applied the tag.';


--
-- Name: COLUMN tags.committer_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.committer_email IS 'Email address of the user who applied the tag.';


--
-- Name: COLUMN tags.planned_at; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.planned_at IS 'Date the tag was added to the plan.';


--
-- Name: COLUMN tags.planner_name; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.planner_name IS 'Name of the user who planed the tag.';


--
-- Name: COLUMN tags.planner_email; Type: COMMENT; Schema: sqitch; Owner: nolan
--

COMMENT ON COLUMN sqitch.tags.planner_email IS 'Email address of the user who planned the tag.';


--
-- Name: announcement id; Type: DEFAULT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.announcement ALTER COLUMN id SET DEFAULT nextval('ftlc.announcement_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activity (id, category, url, name, description, public_display, archive) FROM stdin;
0e207141-c0c9-402d-98dc-fb17c4602d6c	4c3e0f49-48c6-43dd-b13b-13a28e1afd91	https://imag.malavida.com/mvimgbig/download-fs/kodu-7181-5.jpg	Video Game Design	Kodu video game design. Meant for kids 7+	t	f
203c4e20-48c7-4137-825e-4118443917fe	4c3e0f49-48c6-43dd-b13b-13a28e1afd91	https://imag.malavida.com/mvimgbig/download-fs/kodu-7181-5.jpg	Advanced video game design	Meant for kids 8+	t	f
8986c827-d5dc-4cb3-9e46-b6000b602cef	990abea3-1dd1-49a0-8529-d16d6f9c53c1	https://www.insurancejournal.com/app/uploads/2014/01/Private-580x389.jpg	Private Event	This is our private event category.	f	f
\.


--
-- Data for Name: activity_prerequisite; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activity_prerequisite (id, activity, prerequisite) FROM stdin;
ababbcc9-e99e-4815-a098-6cf3419f8065	203c4e20-48c7-4137-825e-4118443917fe	0e207141-c0c9-402d-98dc-fb17c4602d6c
\.


--
-- Data for Name: add_on; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_on (id, name, description, price) FROM stdin;
4933050d-0dc3-43fc-b81d-439a54d49cd1	Early Drop Off	Drop students off up to 1 hour before event start.	20
20fa8f5c-d218-4b30-8e83-7bd2fbab148a	Late Pickup	Pick up students up to 1 hour after the event ends	20
7a3b7f4b-51cc-4216-a2c4-18f92923eb98	Test addon	Only for testing	30
\.


--
-- Data for Name: add_on_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_on_join (id, event, add_on) FROM stdin;
fc7f6deb-22e8-455f-8526-8c25b22a45d7	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	4933050d-0dc3-43fc-b81d-439a54d49cd1
09ab1793-d559-4f69-b3c9-0a5de0e6b797	587c5573-2998-4843-b915-f5438a008534	20fa8f5c-d218-4b30-8e83-7bd2fbab148a
4a44e3f4-4285-4bee-868a-121ec4ed1b39	418d2479-88b6-4495-ad22-bf7e51f90115	20fa8f5c-d218-4b30-8e83-7bd2fbab148a
5946b47d-23df-4ff9-9670-7005d5dcf741	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	4933050d-0dc3-43fc-b81d-439a54d49cd1
1147a476-9317-42af-beef-2da9b7a50b27	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	7a3b7f4b-51cc-4216-a2c4-18f92923eb98
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.address (id, street, city, zipcode, state, country, alias, archive) FROM stdin;
c8959d18-c811-4572-aef0-dcc4475a7ec0	420 Chisholm Vally Dr	Round Rock	78664	Texas	United States	Fun 2 Learn Code	f
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.announcement (id, title, message, created_on) FROM stdin;
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.attendance (id, student, date_interval, event, present, check_in_time) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.category (id, name, description) FROM stdin;
de12a050-5072-4510-b61a-894ab0eed820	Labs	Labs
a5c33112-d8e1-42f0-85e8-aa69c6d5a87e	Classes	classes
990abea3-1dd1-49a0-8529-d16d6f9c53c1	Workshops	Workshop
4c3e0f49-48c6-43dd-b13b-13a28e1afd91	Summer Camps	Summer Camps
\.


--
-- Data for Name: date_interval; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_interval (id, start, "end", archive) FROM stdin;
6c7e0021-d09d-4390-9419-6689473738f5	2019-05-07 09:00:00-05	2019-05-07 12:00:00-05	f
a5ac27f4-3c6d-445b-8955-304e37b16e80	2019-05-08 09:00:00-05	2019-05-08 12:00:00-05	f
f21646e2-2879-4fd9-bee4-c332e76b2914	2019-05-09 09:00:00-05	2019-05-09 12:00:00-05	f
6a0cf612-fce7-4381-9544-951ce551e5c2	2019-05-10 09:00:00-05	2019-05-10 12:00:00-05	f
9490ba95-d18c-4c20-b5d0-a3083f239586	2019-08-05 09:00:00-05	2019-08-05 12:00:00-05	f
4ebfb117-27a8-4ca8-8625-aa64f450cdc2	2019-08-06 09:00:00-05	2019-08-06 12:00:00-05	f
35099fa5-b1a4-494a-bc96-55ab3a5546be	2019-08-07 09:00:00-05	2019-08-07 12:00:00-05	f
36d6a691-c8bd-4098-8d8c-3da8c1ee4c21	2019-08-08 09:00:00-05	2019-08-08 12:00:00-05	f
bf356f6f-db84-41e9-a237-6b47fc9155c0	2019-08-09 09:00:00-05	2019-08-09 12:00:00-05	f
c00c2c1d-02be-4655-bf0e-61819605b768	2019-07-24 13:00:00-05	2019-07-24 16:00:00-05	f
dcf9c460-d021-4ed1-bb63-7b0317bf3d9d	2019-07-25 13:00:00-05	2019-07-25 16:00:00-05	f
a84437b6-076d-4c08-9d77-d1bd71f4c49a	2019-07-26 13:00:00-05	2019-07-26 16:00:00-05	f
d1df63b3-9e53-4483-b273-5a820301f14d	2019-06-24 13:00:00-05	2019-06-24 16:00:00-05	f
7049baf4-4c3a-46c1-86f6-75821b371736	2019-06-25 13:00:00-05	2019-06-25 16:00:00-05	f
4ca9277a-693d-47b0-83ed-4171e6dae57b	2019-06-26 13:00:00-05	2019-06-26 16:00:00-05	f
8f51aa7a-bffb-40f9-96f7-abb598d304c5	2019-06-27 13:00:00-05	2019-06-27 16:00:00-05	f
184ed254-2b41-4b7c-9cb3-743302920f0a	2019-06-28 13:00:00-05	2019-06-28 16:00:00-05	f
d5f74eb4-44b6-49cf-a841-9f2dd94714d9	2019-06-03 13:00:00-05	2019-06-03 16:00:00-05	f
ab52ff6b-181d-4a1a-b3e9-224f4e4a74b0	2019-06-04 13:00:00-05	2019-06-04 16:00:00-05	f
bc8fdd6c-9858-44d9-872c-3c228ba04ecb	2019-06-05 13:00:00-05	2019-06-05 16:00:00-05	f
55dbc888-f2de-4452-9641-1b94a7fc3d5d	2019-06-06 13:00:00-05	2019-06-06 16:00:00-05	f
cda5d4bc-2c84-41b8-a71e-ec41c42af802	2019-06-07 13:00:00-05	2019-06-07 16:00:00-05	f
f8028f46-2b4f-488a-a5c5-3174b37f5b2d	2019-06-14 09:00:00-05	2019-06-14 17:00:00-05	f
\.


--
-- Data for Name: date_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_join (id, event, date_interval) FROM stdin;
61abc265-ab42-4d7d-b426-f520c593cbec	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	6c7e0021-d09d-4390-9419-6689473738f5
ddba1117-a52c-414b-9491-3a23235e679a	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	a5ac27f4-3c6d-445b-8955-304e37b16e80
c7fc6099-0e12-46a8-8c5d-a346e52bae85	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	f21646e2-2879-4fd9-bee4-c332e76b2914
b3a6409d-e360-4107-aa6c-3b194a9af59e	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	6a0cf612-fce7-4381-9544-951ce551e5c2
ec41c714-2bfc-48d4-8861-d6c68d66f1a1	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	9490ba95-d18c-4c20-b5d0-a3083f239586
c4896b8e-b997-4397-a49d-a4a1915a7653	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	4ebfb117-27a8-4ca8-8625-aa64f450cdc2
49e5ca73-8e83-4f4d-95e0-c364ed2bf20e	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	35099fa5-b1a4-494a-bc96-55ab3a5546be
acce4aec-33f6-4b4d-8d78-558dd1637d35	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	36d6a691-c8bd-4098-8d8c-3da8c1ee4c21
ca853523-66bf-4ac5-8630-a8ef8b6ea916	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	bf356f6f-db84-41e9-a237-6b47fc9155c0
5b0dc250-f4c8-4cc8-bb9f-8aa57383c08c	418d2479-88b6-4495-ad22-bf7e51f90115	c00c2c1d-02be-4655-bf0e-61819605b768
73a4a8fc-83f1-47e6-8669-5ac233c79ff2	418d2479-88b6-4495-ad22-bf7e51f90115	dcf9c460-d021-4ed1-bb63-7b0317bf3d9d
bd3e2379-7d0c-431e-8e39-4fee2f7c0070	418d2479-88b6-4495-ad22-bf7e51f90115	a84437b6-076d-4c08-9d77-d1bd71f4c49a
f9163188-6ebe-40e8-a917-7c05d1c5d3a6	587c5573-2998-4843-b915-f5438a008534	d1df63b3-9e53-4483-b273-5a820301f14d
287bdaed-da3c-4c60-a3c1-8fabc9befe1a	587c5573-2998-4843-b915-f5438a008534	7049baf4-4c3a-46c1-86f6-75821b371736
e11e929a-bcea-4371-b01a-8ac9f583973c	587c5573-2998-4843-b915-f5438a008534	4ca9277a-693d-47b0-83ed-4171e6dae57b
ea44aa7a-735f-4868-9856-9e7093c3ed77	587c5573-2998-4843-b915-f5438a008534	8f51aa7a-bffb-40f9-96f7-abb598d304c5
e60c6bd8-933d-4c7f-b4f0-9f42d6623b83	587c5573-2998-4843-b915-f5438a008534	184ed254-2b41-4b7c-9cb3-743302920f0a
ddcc5a4b-397d-42b2-8771-6192b2de5a81	55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	d5f74eb4-44b6-49cf-a841-9f2dd94714d9
8c2a7108-03ac-427d-99c9-e134da409a39	55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	ab52ff6b-181d-4a1a-b3e9-224f4e4a74b0
0ee08f06-1e88-457f-94a1-c871e1228c50	55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	bc8fdd6c-9858-44d9-872c-3c228ba04ecb
de6ea98e-8bf3-4753-b73e-85bbd9b1e090	55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	55dbc888-f2de-4452-9641-1b94a7fc3d5d
d59c4c2e-1cbb-4d0b-a973-700fbc80d59e	55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	cda5d4bc-2c84-41b8-a71e-ec41c42af802
4deba2b2-e281-4c2e-bf0c-4fb07df73fc5	e0023bf0-22d9-4816-affb-df1016f52f12	f8028f46-2b4f-488a-a5c5-3174b37f5b2d
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event (id, activity, address, open_registration, close_registration, capacity, seats_left, name, price, show_calendar, archive, public_display) FROM stdin;
587c5573-2998-4843-b915-f5438a008534	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-06-23 23:59:59-05	8	8	June PM	200	t	f	t
418d2479-88b6-4495-ad22-bf7e51f90115	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-07-21 23:59:59-05	8	8	July PM	200	t	f	t
7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-08-04 23:59:59-05	8	8	August AM	200	t	f	t
2bbe0924-0ef3-444f-bbcc-16a247d74abf	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2018-12-01 23:59:59-06	2019-01-13 23:59:59-06	8	8	Jaunary AM	200	t	f	t
55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	203c4e20-48c7-4137-825e-4118443917fe	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-03-01 23:59:59-06	2019-06-02 23:59:59-05	8	8	June PM	200	t	f	t
1c7441e7-56d1-4cf2-87c7-a0477a76d45f	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-05-27 23:59:59-05	8	7	May AM	200	t	f	t
e0023bf0-22d9-4816-affb-df1016f52f12	8986c827-d5dc-4cb3-9e46-b6000b602cef	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-06-13 23:59:59-05	8	8	June private event	450	t	f	f
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_log (id, event, date_interval, student, instructor, comment) FROM stdin;
\.


--
-- Data for Name: event_registration; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_registration (id, registered_by, student, event, payment, registered_on) FROM stdin;
58a92d96-d263-4fe4-bf54-241943f97531	702651ae-0036-448e-bd7c-b9e6489bf822	9cd5aa5d-74c3-462d-b80d-6bb5a1efa117	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	2bd7f591-f0c9-41a6-bef7-181516f49a85	2019-03-05 13:53:18.039494-06
\.


--
-- Data for Name: event_request; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_request (id, user_id, event, created_on, information, access_token, status) FROM stdin;
f1b4c896-a711-476e-ab1b-46097b832fbd	702651ae-0036-448e-bd7c-b9e6489bf822	e0023bf0-22d9-4816-affb-df1016f52f12	2019-03-05 14:27:32.850664-06		TestEventasdfghjklqwertyuiop	accepted
\.


--
-- Data for Name: news_letter; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.news_letter (id, email) FROM stdin;
f1b26305-99b0-4228-bb9b-28ec15ac6956	nolanaguirre08@gmail.com
fae6e9e1-0a3c-4302-a4d4-798e1a959992	bobby7083@gmail.com
8057cdfb-3019-4800-a874-0d8582e9955d	potato@doesnotexists.com
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.payment (id, user_id, status, create_on, snapshot, charge, refund) FROM stdin;
2bd7f591-f0c9-41a6-bef7-181516f49a85	702651ae-0036-448e-bd7c-b9e6489bf822	paid	2019-03-05 13:53:18.025081-06	{"total": "200.00", "_event": {"id": "1c7441e7-56d1-4cf2-87c7-a0477a76d45f", "name": "May AM", "price": 200, "address": "c8959d18-c811-4572-aef0-dcc4475a7ec0", "archive": false, "activity": "0e207141-c0c9-402d-98dc-fb17c4602d6c", "capacity": 8, "seats_left": 8, "show_calendar": true, "public_display": true, "open_registration": "2019-02-02T05:59:59.000Z", "close_registration": "2019-05-28T04:59:59.000Z"}, "_addons": [], "_activity": {"name": "Video Game Design"}, "_students": [{"id": "9cd5aa5d-74c3-462d-b80d-6bb5a1efa117", "last_name": "A", "first_name": "6"}], "_overrides": []}	{"id": "ch_1EAjKDJvNjqUYflTVyvfl2nq", "paid": true, "order": null, "amount": 20000, "object": "charge", "review": null, "source": {"id": "card_1EAjKCJvNjqUYflTnym1eCh0", "name": "john doe", "brand": "Visa", "last4": "4242", "object": "card", "country": "US", "funding": "credit", "customer": null, "exp_year": 2022, "metadata": {}, "cvc_check": "pass", "exp_month": 2, "address_zip": "22222", "fingerprint": "kBXmY64PfhJVSbCa", "address_city": "Round Rock", "address_line1": "405 West Bowman Road", "address_line2": null, "address_state": "TX", "dynamic_last4": null, "address_country": "US", "address_zip_check": "pass", "address_line1_check": "pass", "tokenization_method": null}, "status": "succeeded", "created": 1551815597, "dispute": null, "invoice": null, "outcome": {"type": "authorized", "reason": null, "risk_level": "normal", "risk_score": 36, "network_status": "approved_by_network", "seller_message": "Payment complete."}, "refunds": {"url": "/v1/charges/ch_1EAjKDJvNjqUYflTVyvfl2nq/refunds", "data": [], "object": "list", "has_more": false, "total_count": 0}, "captured": true, "currency": "usd", "customer": null, "livemode": false, "metadata": {}, "refunded": false, "shipping": null, "application": null, "description": "fun2learncode Event charge", "destination": null, "receipt_url": "https://pay.stripe.com/receipts/acct_1DqX6WJvNjqUYflT/ch_1EAjKDJvNjqUYflTVyvfl2nq/rcpt_Ee1MPUVLR7jrEYOBOjgWGBjQoez8KYc", "failure_code": null, "on_behalf_of": null, "fraud_details": {}, "receipt_email": null, "transfer_data": null, "payment_intent": null, "receipt_number": null, "transfer_group": null, "amount_refunded": 0, "application_fee": null, "failure_message": null, "source_transfer": null, "balance_transaction": "txn_1EAjKDJvNjqUYflTNYfsqN1o", "statement_descriptor": "Fun2LearnCode Event", "application_fee_amount": null}	\N
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.promo_code (id, code, for_category, for_activity, for_user, percent, category, generated_by, activity, user_id, effect, uses, created_on, valid_start, valid_end, archive, disabled) FROM stdin;
08a1e807-845f-4def-a078-7de30c4acc55	ben13810f	f	f	f	f	\N	\N	\N	\N	10	10	2019-03-05 16:21:52.260434-06	2019-03-01 16:21:18.205-06	2019-04-30 16:21:18.205-05	f	f
1ea39312-314d-4965-8762-4373e55b7c85	z5ftqw85i	f	f	f	f	\N	\N	\N	\N	10	10	2019-03-05 16:22:35.749089-06	2019-01-01 16:21:52.295-06	2019-02-01 16:21:52.295-06	f	f
2b526b58-99bc-4e39-a080-35d68d71d8be	px6ixa4ho	f	f	f	t	\N	\N	\N	\N	10	10	2019-03-05 16:25:14.092202-06	2019-03-04 16:22:35.804-06	2019-04-05 16:22:35.804-05	f	f
94cca34d-9fa5-4d94-af48-f02a78aca336	4ccn8xi7b	t	f	f	f	4c3e0f49-48c6-43dd-b13b-13a28e1afd91	\N	\N	\N	10	1	2019-03-05 16:25:52.515828-06	2019-03-04 16:25:14.134-06	2019-04-05 16:25:14.134-05	f	f
2036bd19-f982-4d5c-8959-2df1b5675055	1ynzhjaec	t	f	f	f	de12a050-5072-4510-b61a-894ab0eed820	\N	\N	\N	10	1	2019-03-05 16:26:11.771845-06	2019-03-04 16:25:52.574-06	2019-04-05 16:25:52.574-05	f	f
867ac5c8-6a53-4062-bc57-c60c8f1b4504	x25nyw5xo	f	t	f	f	\N	\N	0e207141-c0c9-402d-98dc-fb17c4602d6c	\N	10	1	2019-03-05 16:26:34.841898-06	2019-03-04 16:26:11.821-06	2019-04-05 16:26:11.821-05	f	f
c6da9a44-7585-43f5-8bbd-f5bf6ea143c6	mne71837p	f	f	t	f	\N	\N	\N	702651ae-0036-448e-bd7c-b9e6489bf822	10	1	2019-03-05 16:27:32.630846-06	2019-03-04 16:26:34.933-06	2019-04-05 16:26:34.933-05	f	f
c3b5ffc6-2c8e-476d-b61b-b2046aa97072	dm0p4g2ml	f	f	t	f	\N	\N	\N	c417e4c3-e766-46fe-8158-74784dc3d76a	10	1	2019-03-05 16:27:51.095485-06	2019-03-04 16:27:32.69-06	2019-04-05 16:27:32.69-05	f	f
1cc4a5a9-a99c-4509-9348-073f0f83092e	39u99rvgc	f	f	f	f	\N	\N	\N	\N	10	0	2019-03-05 16:28:32.454414-06	2019-03-04 16:27:51.177-06	2019-04-05 16:27:51.177-05	f	f
3b9114f2-7c18-41d1-b3fe-71e3641fb32b	p7oqg3wag	f	f	f	f	\N	\N	\N	\N	10	1	2019-03-05 16:29:35.429661-06	2019-03-04 16:28:32.512-06	2019-04-05 16:28:32.512-05	t	t
90d664da-a277-46a0-86d5-01ec255a94af	nvznr72t6	f	f	f	f	\N	\N	\N	\N	300	1	2019-03-05 16:48:52.464458-06	2019-03-04 16:33:36.211-06	2019-04-05 16:33:36.211-05	f	f
\.


--
-- Data for Name: promo_code_use; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.promo_code_use (id, user_id, promo_code) FROM stdin;
\.


--
-- Data for Name: refund_request; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.refund_request (id, payment, user_id, created_on, reason, granted_reason, amount_refunded, status) FROM stdin;
\.


--
-- Data for Name: registration_override; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.registration_override (id, student, event, modified_price, valid_end) FROM stdin;
5657e71f-9dbc-4ea8-903e-ef43db29d1ea	988ba3c8-6ee0-46ec-bf58-a57d930b7373	2bbe0924-0ef3-444f-bbcc-16a247d74abf	100	2019-04-30 13:41:43.943-05
459ffc20-276a-43f4-827d-b0a091ca51d3	94637b1b-3299-4f33-9714-c427a0bb5aa6	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	10	2019-05-01 13:43:22.423-05
486f0c7a-df13-4751-9c14-12e73abfcb2b	11c275d9-0e77-4aa3-aea9-6131b5c218ea	55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f	200	2019-04-30 13:51:50.694-05
3d87b5d2-de38-476a-915f-be0af995dd35	94637b1b-3299-4f33-9714-c427a0bb5aa6	418d2479-88b6-4495-ad22-bf7e51f90115	10	2019-02-01 17:13:44.714-06
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.student (id, parent, first_name, last_name, date_of_birth) FROM stdin;
1645309a-369e-49f2-889f-8df137197ca7	702651ae-0036-448e-bd7c-b9e6489bf822	1	A	2009-06-09 13:26:57.394-05
988ba3c8-6ee0-46ec-bf58-a57d930b7373	702651ae-0036-448e-bd7c-b9e6489bf822	2	A	2019-03-05 13:27:22.53-06
94637b1b-3299-4f33-9714-c427a0bb5aa6	702651ae-0036-448e-bd7c-b9e6489bf822	3	A	2019-03-05 13:27:31.443-06
11c275d9-0e77-4aa3-aea9-6131b5c218ea	702651ae-0036-448e-bd7c-b9e6489bf822	4	A	2019-03-05 13:27:35.487-06
2b4c7a88-1b82-4166-8909-2462a0038f40	702651ae-0036-448e-bd7c-b9e6489bf822	5	A	2019-03-05 13:27:38.272-06
9cd5aa5d-74c3-462d-b80d-6bb5a1efa117	702651ae-0036-448e-bd7c-b9e6489bf822	6	A	2019-03-05 13:27:46.282-06
2c52956c-d165-49d6-b7dd-4c7fa2ec39ac	702651ae-0036-448e-bd7c-b9e6489bf822	7	A	2019-03-05 13:28:33.563-06
6e2add24-bc61-4c2d-9c31-eead851c0ded	c417e4c3-e766-46fe-8158-74784dc3d76a	1	B	2019-03-05 13:54:21.941-06
\.


--
-- Data for Name: student_waiver; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.student_waiver (id, student, primary_care, primary_care_phone, emergency_phone, pickup_one, pickup_two, other, created_on) FROM stdin;
bb0e0574-f2b9-45be-87de-789e93842544	2b4c7a88-1b82-4166-8909-2462a0038f40	Dr Brown	(123)-123-1231	(512)-698-1584	Nolan Aguirre	Vicky Aguirre	none	2019-03-05 13:33:52.673286-06
9a1a4244-59c2-4c05-91f9-9375716c175b	2c52956c-d165-49d6-b7dd-4c7fa2ec39ac	Dr Brown	(123)-123-1231	(512)-698-1584	Nolan Aguirre	nolan	none	2019-03-05 13:34:03.848027-06
e27367c8-259d-476e-ad73-946d727d824c	9cd5aa5d-74c3-462d-b80d-6bb5a1efa117	Dr Brown	(123)-123-1231	(512)-698-1584	Nolan Aguirre	Vicky Aguirre	noe	2019-03-05 13:34:17.137304-06
bbd00b42-a7ac-4338-a830-6bab7decbf11	988ba3c8-6ee0-46ec-bf58-a57d930b7373	Dr Brown	(123)-123-1231	(512)-698-1584	Nolan Aguirre	Vicky Aguirre	none	2019-03-05 13:34:33.026667-06
924415ba-5ccd-4725-a62c-0e8e3c67a948	94637b1b-3299-4f33-9714-c427a0bb5aa6	Dr Brown	(123)-123-1231	(512)-698-1584	Nolan Aguirre	Vicky Aguirre	none	2019-03-05 13:34:43.636924-06
adaa3677-8dcc-4e34-8a7b-e59aee854dbe	11c275d9-0e77-4aa3-aea9-6131b5c218ea	Dr Brown	(123)-123-1231	(512)-698-1584	Nolan Aguirre	Vicky Aguirre	none	2019-03-05 13:34:55.114611-06
\.


--
-- Data for Name: transaction_state; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.transaction_state (user_id, transaction, processing) FROM stdin;
702651ae-0036-448e-bd7c-b9e6489bf822	{"total": "450.00", "_event": {"id": "e0023bf0-22d9-4816-affb-df1016f52f12", "name": "June private event", "price": 450, "address": "c8959d18-c811-4572-aef0-dcc4475a7ec0", "archive": false, "activity": "8986c827-d5dc-4cb3-9e46-b6000b602cef", "capacity": 8, "seats_left": 8, "show_calendar": true, "public_display": false, "open_registration": "2019-02-02T05:59:59.000Z", "close_registration": "2019-06-14T04:59:59.000Z"}, "_addons": [], "_activity": {"name": "Private Event"}, "_students": [{"id": "2b4c7a88-1b82-4166-8909-2462a0038f40", "last_name": "A", "first_name": "5"}], "_overrides": []}	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.users (id, first_name, last_name, email, created_on, role) FROM stdin;
007458de-2329-4f0f-9572-eae8f8459208	Nolan	Aguirre	nolanaguirre08@gmail.com	2019-02-22 20:27:27.681601-06	ftlc_owner
702651ae-0036-448e-bd7c-b9e6489bf822	Test	A	bobby7083@gmail.com	2019-03-05 13:25:53.626184-06	ftlc_user
c417e4c3-e766-46fe-8158-74784dc3d76a	Nolan	Aguirre	aguirrefammusic@gmail.com	2019-03-05 13:54:12.411805-06	ftlc_user
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc_private; Owner: nolan
--

COPY ftlc_private.users (id, user_id, password_hash, password_reset, password_reset_expiration) FROM stdin;
157eb4c7-83d1-4a09-9963-96642b9e7405	007458de-2329-4f0f-9572-eae8f8459208	$2a$06$Azo2g4m6xRD9/ZXCh90Yj.1gh7ExMm6cAZudz4VolyC1q3b6LZqvi	\N	\N
45dd054d-919c-462c-a7a7-2403289f9f8f	702651ae-0036-448e-bd7c-b9e6489bf822	$2a$06$BG8RfcuF5HkqwtTA6whmkukCBt.7Ef7C.JbMA5N3/7VO3xSQvTR6W	\N	\N
d065409a-ac1d-4cc1-8549-773ebe62ab8f	c417e4c3-e766-46fe-8158-74784dc3d76a	$2a$06$3eYEnpbi6KYYKZgj.AXAue5qf1uFKz8jITYJf.V4HvRdrdZb2oSte	\N	\N
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.changes (change_id, script_hash, change, project, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
7decbba512c319112815608f66d381cf987d32e9	1afd8802d010fddc77dc7d42b2fc76f5ec6533b5	appschema	ftlc	Add appschema migration	2019-03-06 19:49:30.53882-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
d29edad4f6b478766505320a6cf1697082283939	83b4636ce6022ffda83e66a38a29e6e6be17f8ea	roles	ftlc	Add roles migration	2019-03-06 19:49:30.583568-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	ce6c847b195fd015f117cd9156ddae574f7d8d14	extensions	ftlc	Add extensions migration	2019-03-06 19:49:30.639672-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
673830cd7cbaf27cd0570d313771c7439c81a909	7e5991785d26503f8ce3646614ee2e71cef3bd2e	types	ftlc	Add types migration	2019-03-06 19:49:30.697406-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
c8088d19b46572f24040ab2a661939c9da2db293	223df9f855fc29d94e7a991489d5a6823ca87957	address	ftlc	Add address migration	2019-03-06 19:49:30.799951-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
0033c1184d1690315527b58ddfaae1cb8f3f3597	cc84bbcfa59078f9b61a524d07d9d397f738b88b	date_interval	ftlc	add event dates migration	2019-03-06 19:49:30.891209-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
a08943ea78548567ee631bb5d2ae09625dd3fc59	149ca4f97969614108399bc477cfd0dbd36b6ea2	category	ftlc	Add activity catagories migration	2019-03-06 19:49:30.960671-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
314894997c05d2d0225e97feb41651cd0e5f3cd5	ff52ac56f59ac4adda6714d6e70fa2ae730d7d20	add_on	ftlc	Add add ons migration	2019-03-06 19:49:31.050621-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
49e76e2ddd47e51219f49622a767487dd5b4f125	0d4f1579abd7a1e663f8630dbd9ed8e5c1937519	news_letter	ftlc	Add newsletter migration	2019-03-06 19:49:31.121582-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 16:57:54-06	Nolan Aguirre	nolanaguirre08@gmail.com
90b2b712f18fca63471ea7e4ad1da24c74594686	8b083344606473ffaf1605ce1f3c6933203c390c	news_letter_functions	ftlc	Add news letter function migration	2019-03-06 19:49:31.203623-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-31 22:45:49-06	Nolan Aguirre	nolanaguirre08@gmail.com
fb8f0276e9f95f0e157c0839dd428589cec10e10	b66107d25f4f55115904f10e24596afe4c1eaad9	announcement	ftlc	Add announcement migration	2019-03-06 19:49:31.25826-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 17:02:42-06	Nolan Aguirre	nolanaguirre08@gmail.com
26d301d8dbab322e1d5be80fd79032c409b8bf7d	16a1c84dd03e491ba565a0992e90b5d407a9afd3	users	ftlc	add users migration	2019-03-06 19:49:31.328335-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
fd0530b417a1865aefc7ff3437933b68c9a77ea2	b186a9f387f4d73071d7a9ec8b347eda92dbc932	activity	ftlc	add activity migration	2019-03-06 19:49:31.422875-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
048538dae2bfee1087cb38f2ec94d88b4e19df0f	2b486d6a403db1ac154d5b9a35f3f5cfb1ff1650	users_private	ftlc	add users private migration	2019-03-06 19:49:31.501835-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
f69bc1bcf84ec82868e67803cba3f2bd1e6da4eb	cc484981367c0bafffb8c4b97abaf957e1d4d8a7	users_functions	ftlc	Add users functions migration	2019-03-06 19:49:31.549377-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
501ea6c40cfa81b6f22070ff7239443c3ca23b0d	f54ce23b1fe801e2ebcfeb01c8e8564e8179492d	student	ftlc	add student join migration	2019-03-06 19:49:31.602506-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
c6b7f6504b0c6b497398dfe548056d8bc033ff4d	9f28fe8b0bd3a14f5a17b5f356ee2e78d6f41ead	transaction_state	ftlc	add transaction state migration	2019-03-06 19:49:31.68951-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
feef24674d70cfea2db327105f5725b8f73e84b0	bf44baa30afeda9c00fb523103926ad11e03277a	transaction_state_functions	ftlc	Add transaction state function migration	2019-03-06 19:49:31.737009-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-31 22:47:16-06	Nolan Aguirre	nolanaguirre08@gmail.com
9e38727e685cafee3e5a3903475dec0f70458d92	6088e3cfcdb93998f5b496fde86a5998e0385eec	payment	ftlc	Add payment migration	2019-03-06 19:49:31.811402-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
978b86804e8267b8cd4f0e8ab9a7ca6f2837af5a	80d6c2865309b0c5d7ed543f859d0d7e38f62203	activity_prerequisite	ftlc	Add prerequisites join migration	2019-03-06 19:49:31.910347-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
90c1a2fac0371e6a12e72e3ced35f7342c236170	3c074317e21aef9497c695fee1508b6ddb772326	event	ftlc	Add date group migration	2019-03-06 19:49:31.978291-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
4f158740daad5a839cf57f91905f0d88a8b7baac	ada52814b5594765ef7ea2e93f33f302a0c83b06	student_waiver	ftlc	Add student waiver migration	2019-03-06 19:49:32.061189-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-06 20:21:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
fa6b2581d422748ac9f1fc98a333215d4d29ea52	2e97751166f13c3af4b32f9a4e88a815cf1834bf	event_registration	ftlc	add event registration migration	2019-03-06 19:49:32.115982-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
d27730d6b8a2bb69bb12813c7b8a9209b4faaae8	08882cd21320f08b92c348761e86407561746409	event_log	ftlc	add event logs migration	2019-03-06 19:49:32.187106-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
4971a9f8187d2738c43631161e8330e3497da673	5f7820ae3982dbfa5dd132af6768b674c266a295	refund_request	ftlc	Add refun request migration	2019-03-06 19:49:32.269054-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 15:39:17-06	Nolan Aguirre	nolanaguirre08@gmail.com
1b4349fc2a4a8d2ceb83095e262fca87c94232cb	1e93651a749fc2f049feacf4705c2e18e763d6eb	event_request	ftlc	Add activity request migration	2019-03-06 19:49:32.342009-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 17:39:44-06	Nolan Aguirre	nolanaguirre08@gmail.com
43eaa7511926d35050e58e54a1acf7a009870731	acd5cd9becb8d0af9c1559808ede18316a662070	event_request_functions	ftlc	Add event request function migration	2019-03-06 19:49:32.417827-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-22 17:18:10-06	Nolan Aguirre	nolanaguirre08@gmail.com
60252675e95c0e7d856b2c86df3189be5d3e48ea	af25de3db712e35296df3118b5138186b1ab01ff	student_waiver_functions	ftlc	Add student waiver functions migration	2019-03-06 19:49:32.461276-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-11 20:58:01-06	Nolan Aguirre	nolanaguirre08@gmail.com
8bfccdc982bafe8b310f68b5083a47287bee3003	a3969e859f884813dceb7b56ca325ae38e917f58	date_join	ftlc	Add join between event and date_inverval	2019-03-06 19:49:32.525979-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
fdd1e43e7dcc8b1918b6bae5f3a6d6ffb50dd6e1	2e731dd6ba29eb2506c97b4e145166ddfdad95ca	date_interval_functions	ftlc	Add date interval functions migration	2019-03-06 19:49:32.614513-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
2d23c3565844a782aec1456cc7a6c5e8dca46226	d14c026c3ae2d8bc77114eb62bd8eb2d6b592fa7	event_functions	ftlc	Add event functions migration	2019-03-06 19:49:32.684054-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
a58ea9959ccc51104baf7851a9183deaf10fbad4	131c11cc1bef7e91d0e1c8c011861586d507c305	add_on_join	ftlc	Add add on join	2019-03-06 19:49:32.755504-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
e9dd80989ce9600c3fb93119fc8557f9b5d8336d	a7c01344b9826305723ddd8728c628a4ef386450	attendance	ftlc	Add attendance migration	2019-03-06 19:49:32.82029-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
0b0df5d03322f99f61f5294e8ea07a97865ed74a	f8cc62f7e615166cc131cd923403e45c6b4f4916	promo_code	ftlc	add promo code migration	2019-03-06 19:49:32.918132-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
24e9099a51fc0a28a9aef93a35397a9ec5fa92bc	fc270096f46758bf0bc9e0993949a8d7bbd356c1	registration_override	ftlc	Add registration override migration	2019-03-06 19:49:33.014432-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 14:32:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
55de351e09207828c1232cacc07d0b74d74b10fe	1d643e47b49e02948de0a7f87997565685556094	promo_code_use	ftlc	Add promo code use join table	2019-03-06 19:49:33.087146-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-01 23:58:08-06	Nolan Aguirre	nolanaguirre08@gmail.com
0dc10b1cf8d0ac2f990b325799ae6b68905c50c3	5c1edcc90e70def9e4df1204a45e8438cae3b326	privileges	ftlc	Add priviliges migration	2019-03-06 19:49:33.144004-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
3917fd07b982885e51bba8d928268e9cbafeea6b	f84c5073d556302a3746be07d60b2670b68a8c9d	RLS	ftlc	Row level security migration	2019-03-06 19:49:33.227172-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: dependencies; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.dependencies (change_id, type, dependency, dependency_id) FROM stdin;
673830cd7cbaf27cd0570d313771c7439c81a909	require	appschema	7decbba512c319112815608f66d381cf987d32e9
673830cd7cbaf27cd0570d313771c7439c81a909	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
c8088d19b46572f24040ab2a661939c9da2db293	require	appschema	7decbba512c319112815608f66d381cf987d32e9
c8088d19b46572f24040ab2a661939c9da2db293	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
0033c1184d1690315527b58ddfaae1cb8f3f3597	require	appschema	7decbba512c319112815608f66d381cf987d32e9
0033c1184d1690315527b58ddfaae1cb8f3f3597	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
a08943ea78548567ee631bb5d2ae09625dd3fc59	require	appschema	7decbba512c319112815608f66d381cf987d32e9
a08943ea78548567ee631bb5d2ae09625dd3fc59	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
314894997c05d2d0225e97feb41651cd0e5f3cd5	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
49e76e2ddd47e51219f49622a767487dd5b4f125	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
90b2b712f18fca63471ea7e4ad1da24c74594686	require	news_letter	49e76e2ddd47e51219f49622a767487dd5b4f125
fb8f0276e9f95f0e157c0839dd428589cec10e10	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
26d301d8dbab322e1d5be80fd79032c409b8bf7d	require	types	673830cd7cbaf27cd0570d313771c7439c81a909
fd0530b417a1865aefc7ff3437933b68c9a77ea2	require	category	a08943ea78548567ee631bb5d2ae09625dd3fc59
048538dae2bfee1087cb38f2ec94d88b4e19df0f	require	users	26d301d8dbab322e1d5be80fd79032c409b8bf7d
f69bc1bcf84ec82868e67803cba3f2bd1e6da4eb	require	users_private	048538dae2bfee1087cb38f2ec94d88b4e19df0f
501ea6c40cfa81b6f22070ff7239443c3ca23b0d	require	users_functions	f69bc1bcf84ec82868e67803cba3f2bd1e6da4eb
c6b7f6504b0c6b497398dfe548056d8bc033ff4d	require	users	26d301d8dbab322e1d5be80fd79032c409b8bf7d
feef24674d70cfea2db327105f5725b8f73e84b0	require	transaction_state	c6b7f6504b0c6b497398dfe548056d8bc033ff4d
9e38727e685cafee3e5a3903475dec0f70458d92	require	users	26d301d8dbab322e1d5be80fd79032c409b8bf7d
978b86804e8267b8cd4f0e8ab9a7ca6f2837af5a	require	activity	fd0530b417a1865aefc7ff3437933b68c9a77ea2
90c1a2fac0371e6a12e72e3ced35f7342c236170	require	activity	fd0530b417a1865aefc7ff3437933b68c9a77ea2
4f158740daad5a839cf57f91905f0d88a8b7baac	require	student	501ea6c40cfa81b6f22070ff7239443c3ca23b0d
fa6b2581d422748ac9f1fc98a333215d4d29ea52	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
fa6b2581d422748ac9f1fc98a333215d4d29ea52	require	student	501ea6c40cfa81b6f22070ff7239443c3ca23b0d
fa6b2581d422748ac9f1fc98a333215d4d29ea52	require	payment	9e38727e685cafee3e5a3903475dec0f70458d92
d27730d6b8a2bb69bb12813c7b8a9209b4faaae8	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
d27730d6b8a2bb69bb12813c7b8a9209b4faaae8	require	student	501ea6c40cfa81b6f22070ff7239443c3ca23b0d
4971a9f8187d2738c43631161e8330e3497da673	require	payment	9e38727e685cafee3e5a3903475dec0f70458d92
1b4349fc2a4a8d2ceb83095e262fca87c94232cb	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
1b4349fc2a4a8d2ceb83095e262fca87c94232cb	require	users	26d301d8dbab322e1d5be80fd79032c409b8bf7d
43eaa7511926d35050e58e54a1acf7a009870731	require	event_request	1b4349fc2a4a8d2ceb83095e262fca87c94232cb
43eaa7511926d35050e58e54a1acf7a009870731	require	users_functions	f69bc1bcf84ec82868e67803cba3f2bd1e6da4eb
60252675e95c0e7d856b2c86df3189be5d3e48ea	require	student_waiver	4f158740daad5a839cf57f91905f0d88a8b7baac
8bfccdc982bafe8b310f68b5083a47287bee3003	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
8bfccdc982bafe8b310f68b5083a47287bee3003	require	date_interval	0033c1184d1690315527b58ddfaae1cb8f3f3597
fdd1e43e7dcc8b1918b6bae5f3a6d6ffb50dd6e1	require	date_interval	0033c1184d1690315527b58ddfaae1cb8f3f3597
fdd1e43e7dcc8b1918b6bae5f3a6d6ffb50dd6e1	require	date_join	8bfccdc982bafe8b310f68b5083a47287bee3003
2d23c3565844a782aec1456cc7a6c5e8dca46226	require	student	501ea6c40cfa81b6f22070ff7239443c3ca23b0d
2d23c3565844a782aec1456cc7a6c5e8dca46226	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
a58ea9959ccc51104baf7851a9183deaf10fbad4	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
a58ea9959ccc51104baf7851a9183deaf10fbad4	require	add_on	314894997c05d2d0225e97feb41651cd0e5f3cd5
e9dd80989ce9600c3fb93119fc8557f9b5d8336d	require	date_interval	0033c1184d1690315527b58ddfaae1cb8f3f3597
e9dd80989ce9600c3fb93119fc8557f9b5d8336d	require	users	26d301d8dbab322e1d5be80fd79032c409b8bf7d
0b0df5d03322f99f61f5294e8ea07a97865ed74a	require	event	90c1a2fac0371e6a12e72e3ced35f7342c236170
0b0df5d03322f99f61f5294e8ea07a97865ed74a	require	users	26d301d8dbab322e1d5be80fd79032c409b8bf7d
24e9099a51fc0a28a9aef93a35397a9ec5fa92bc	require	activity	fd0530b417a1865aefc7ff3437933b68c9a77ea2
24e9099a51fc0a28a9aef93a35397a9ec5fa92bc	require	student	501ea6c40cfa81b6f22070ff7239443c3ca23b0d
55de351e09207828c1232cacc07d0b74d74b10fe	require	promo_code	0b0df5d03322f99f61f5294e8ea07a97865ed74a
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.events (event, change_id, change, project, note, requires, conflicts, tags, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-03-06 19:49:30.539797-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-03-06 19:49:30.584171-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-03-06 19:49:30.640358-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-03-06 19:49:30.704742-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-03-06 19:49:30.805965-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-03-06 19:49:30.89241-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a08943ea78548567ee631bb5d2ae09625dd3fc59	category	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-03-06 19:49:30.966499-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	314894997c05d2d0225e97feb41651cd0e5f3cd5	add_on	ftlc	Add add ons migration	{extensions}	{}	{}	2019-03-06 19:49:31.051724-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	49e76e2ddd47e51219f49622a767487dd5b4f125	news_letter	ftlc	Add newsletter migration	{extensions}	{}	{}	2019-03-06 19:49:31.126142-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 16:57:54-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	90b2b712f18fca63471ea7e4ad1da24c74594686	news_letter_functions	ftlc	Add news letter function migration	{news_letter}	{}	{}	2019-03-06 19:49:31.204621-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-31 22:45:49-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	fb8f0276e9f95f0e157c0839dd428589cec10e10	announcement	ftlc	Add announcement migration	{extensions}	{}	{}	2019-03-06 19:49:31.259276-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 17:02:42-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	26d301d8dbab322e1d5be80fd79032c409b8bf7d	users	ftlc	add users migration	{types}	{}	{}	2019-03-06 19:49:31.331025-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	fd0530b417a1865aefc7ff3437933b68c9a77ea2	activity	ftlc	add activity migration	{category}	{}	{}	2019-03-06 19:49:31.427676-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	048538dae2bfee1087cb38f2ec94d88b4e19df0f	users_private	ftlc	add users private migration	{users}	{}	{}	2019-03-06 19:49:31.502646-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	f69bc1bcf84ec82868e67803cba3f2bd1e6da4eb	users_functions	ftlc	Add users functions migration	{users_private}	{}	{}	2019-03-06 19:49:31.55019-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	501ea6c40cfa81b6f22070ff7239443c3ca23b0d	student	ftlc	add student join migration	{users_functions}	{}	{}	2019-03-06 19:49:31.603315-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c6b7f6504b0c6b497398dfe548056d8bc033ff4d	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-03-06 19:49:31.690343-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	feef24674d70cfea2db327105f5725b8f73e84b0	transaction_state_functions	ftlc	Add transaction state function migration	{transaction_state}	{}	{}	2019-03-06 19:49:31.737978-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-31 22:47:16-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	9e38727e685cafee3e5a3903475dec0f70458d92	payment	ftlc	Add payment migration	{users}	{}	{}	2019-03-06 19:49:31.815938-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	978b86804e8267b8cd4f0e8ab9a7ca6f2837af5a	activity_prerequisite	ftlc	Add prerequisites join migration	{activity}	{}	{}	2019-03-06 19:49:31.911349-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	90c1a2fac0371e6a12e72e3ced35f7342c236170	event	ftlc	Add date group migration	{activity}	{}	{}	2019-03-06 19:49:31.982769-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	4f158740daad5a839cf57f91905f0d88a8b7baac	student_waiver	ftlc	Add student waiver migration	{student}	{}	{}	2019-03-06 19:49:32.062195-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-06 20:21:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	fa6b2581d422748ac9f1fc98a333215d4d29ea52	event_registration	ftlc	add event registration migration	{event,student,payment}	{}	{}	2019-03-06 19:49:32.117061-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d27730d6b8a2bb69bb12813c7b8a9209b4faaae8	event_log	ftlc	add event logs migration	{event,student}	{}	{}	2019-03-06 19:49:32.191687-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	4971a9f8187d2738c43631161e8330e3497da673	refund_request	ftlc	Add refun request migration	{payment}	{}	{}	2019-03-06 19:49:32.269937-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 15:39:17-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	1b4349fc2a4a8d2ceb83095e262fca87c94232cb	event_request	ftlc	Add activity request migration	{event,users}	{}	{}	2019-03-06 19:49:32.346825-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 17:39:44-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	43eaa7511926d35050e58e54a1acf7a009870731	event_request_functions	ftlc	Add event request function migration	{event_request,users_functions}	{}	{}	2019-03-06 19:49:32.418672-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-22 17:18:10-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	60252675e95c0e7d856b2c86df3189be5d3e48ea	student_waiver_functions	ftlc	Add student waiver functions migration	{student_waiver}	{}	{}	2019-03-06 19:49:32.462226-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-11 20:58:01-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8bfccdc982bafe8b310f68b5083a47287bee3003	date_join	ftlc	Add join between event and date_inverval	{event,date_interval}	{}	{}	2019-03-06 19:49:32.530441-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	fdd1e43e7dcc8b1918b6bae5f3a6d6ffb50dd6e1	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,date_join}	{}	{}	2019-03-06 19:49:32.619651-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2d23c3565844a782aec1456cc7a6c5e8dca46226	event_functions	ftlc	Add event functions migration	{student,event}	{}	{}	2019-03-06 19:49:32.685097-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a58ea9959ccc51104baf7851a9183deaf10fbad4	add_on_join	ftlc	Add add on join	{event,add_on}	{}	{}	2019-03-06 19:49:32.756513-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e9dd80989ce9600c3fb93119fc8557f9b5d8336d	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-03-06 19:49:32.824772-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0b0df5d03322f99f61f5294e8ea07a97865ed74a	promo_code	ftlc	add promo code migration	{event,users}	{}	{}	2019-03-06 19:49:32.921715-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	24e9099a51fc0a28a9aef93a35397a9ec5fa92bc	registration_override	ftlc	Add registration override migration	{activity,student}	{}	{}	2019-03-06 19:49:33.017682-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-24 14:32:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	55de351e09207828c1232cacc07d0b74d74b10fe	promo_code_use	ftlc	Add promo code use join table	{promo_code}	{}	{}	2019-03-06 19:49:33.088124-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-01 23:58:08-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0dc10b1cf8d0ac2f990b325799ae6b68905c50c3	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-03-06 19:49:33.147584-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	3917fd07b982885e51bba8d928268e9cbafeea6b	RLS	ftlc	Row level security migration	{}	{}	{@v1.0.0}	2019-03-06 19:49:33.228684-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.projects (project, uri, created_at, creator_name, creator_email) FROM stdin;
ftlc	\N	2019-03-06 19:49:30.474819-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: releases; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.releases (version, installed_at, installer_name, installer_email) FROM stdin;
1.10000002	2019-03-06 19:49:30.47087-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.tags (tag_id, tag, project, change_id, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
c6dc5dd1a3927ee873cbf229c836670b131c5061	@v1.0.0	ftlc	3917fd07b982885e51bba8d928268e9cbafeea6b	Tag v1.0.0/	2019-03-06 19:49:33.227905-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-02-22 20:35:35-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: ftlc; Owner: nolan
--

SELECT pg_catalog.setval('ftlc.announcement_id_seq', 1, false);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: activity_prerequisite activity_prerequisite_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.activity_prerequisite
    ADD CONSTRAINT activity_prerequisite_pkey PRIMARY KEY (id);


--
-- Name: add_on_join add_on_join_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.add_on_join
    ADD CONSTRAINT add_on_join_pkey PRIMARY KEY (id);


--
-- Name: add_on add_on_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.add_on
    ADD CONSTRAINT add_on_pkey PRIMARY KEY (id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: announcement announcement_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.announcement
    ADD CONSTRAINT announcement_pkey PRIMARY KEY (id);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: date_interval date_interval_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.date_interval
    ADD CONSTRAINT date_interval_pkey PRIMARY KEY (id);


--
-- Name: date_join date_join_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.date_join
    ADD CONSTRAINT date_join_pkey PRIMARY KEY (id);


--
-- Name: event_log event_log_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_log
    ADD CONSTRAINT event_log_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_registration event_registration_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_registration
    ADD CONSTRAINT event_registration_pkey PRIMARY KEY (id);


--
-- Name: event_request event_request_access_token_key; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_request
    ADD CONSTRAINT event_request_access_token_key UNIQUE (access_token);


--
-- Name: event_request event_request_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_request
    ADD CONSTRAINT event_request_pkey PRIMARY KEY (id);


--
-- Name: news_letter news_letter_email_key; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.news_letter
    ADD CONSTRAINT news_letter_email_key UNIQUE (email);


--
-- Name: news_letter news_letter_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.news_letter
    ADD CONSTRAINT news_letter_pkey PRIMARY KEY (id);


--
-- Name: refund_request one_refund_request; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.refund_request
    ADD CONSTRAINT one_refund_request UNIQUE (payment, user_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: promo_code promo_code_code_key; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code
    ADD CONSTRAINT promo_code_code_key UNIQUE (code);


--
-- Name: promo_code promo_code_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code
    ADD CONSTRAINT promo_code_pkey PRIMARY KEY (id);


--
-- Name: promo_code_use promo_code_use_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code_use
    ADD CONSTRAINT promo_code_use_pkey PRIMARY KEY (id);


--
-- Name: refund_request refund_request_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.refund_request
    ADD CONSTRAINT refund_request_pkey PRIMARY KEY (id);


--
-- Name: registration_override registration_override_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.registration_override
    ADD CONSTRAINT registration_override_pkey PRIMARY KEY (id);


--
-- Name: promo_code_use sigle_use; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code_use
    ADD CONSTRAINT sigle_use UNIQUE (user_id, promo_code);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student_waiver student_waiver_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.student_waiver
    ADD CONSTRAINT student_waiver_pkey PRIMARY KEY (id);


--
-- Name: transaction_state transaction_state_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.transaction_state
    ADD CONSTRAINT transaction_state_pkey PRIMARY KEY (user_id);


--
-- Name: add_on_join unique_add_on_join; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.add_on_join
    ADD CONSTRAINT unique_add_on_join UNIQUE (event, add_on);


--
-- Name: attendance unique_attendance; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.attendance
    ADD CONSTRAINT unique_attendance PRIMARY KEY (student, date_interval);


--
-- Name: date_interval unique_date; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.date_interval
    ADD CONSTRAINT unique_date UNIQUE (start, "end");


--
-- Name: date_join unique_date_join; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.date_join
    ADD CONSTRAINT unique_date_join UNIQUE (event, date_interval);


--
-- Name: registration_override unique_override; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.registration_override
    ADD CONSTRAINT unique_override UNIQUE (student, event);


--
-- Name: activity_prerequisite unique_prerequisite; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.activity_prerequisite
    ADD CONSTRAINT unique_prerequisite UNIQUE (activity, prerequisite);


--
-- Name: event_registration unqiue_registration; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_registration
    ADD CONSTRAINT unqiue_registration UNIQUE (student, event);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: ftlc_private; Owner: nolan
--

ALTER TABLE ONLY ftlc_private.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_user_id_key; Type: CONSTRAINT; Schema: ftlc_private; Owner: nolan
--

ALTER TABLE ONLY ftlc_private.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (change_id);


--
-- Name: changes changes_project_script_hash_key; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.changes
    ADD CONSTRAINT changes_project_script_hash_key UNIQUE (project, script_hash);


--
-- Name: dependencies dependencies_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.dependencies
    ADD CONSTRAINT dependencies_pkey PRIMARY KEY (change_id, dependency);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (change_id, committed_at);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project);


--
-- Name: projects projects_uri_key; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.projects
    ADD CONSTRAINT projects_uri_key UNIQUE (uri);


--
-- Name: releases releases_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.releases
    ADD CONSTRAINT releases_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: tags tags_project_tag_key; Type: CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_project_tag_key UNIQUE (project, tag);


--
-- Name: activity activity_category_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.activity
    ADD CONSTRAINT activity_category_fkey FOREIGN KEY (category) REFERENCES ftlc.category(id);


--
-- Name: activity_prerequisite activity_prerequisite_activity_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.activity_prerequisite
    ADD CONSTRAINT activity_prerequisite_activity_fkey FOREIGN KEY (activity) REFERENCES ftlc.activity(id);


--
-- Name: activity_prerequisite activity_prerequisite_prerequisite_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.activity_prerequisite
    ADD CONSTRAINT activity_prerequisite_prerequisite_fkey FOREIGN KEY (prerequisite) REFERENCES ftlc.activity(id);


--
-- Name: add_on_join add_on_join_add_on_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.add_on_join
    ADD CONSTRAINT add_on_join_add_on_fkey FOREIGN KEY (add_on) REFERENCES ftlc.add_on(id);


--
-- Name: add_on_join add_on_join_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.add_on_join
    ADD CONSTRAINT add_on_join_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: attendance attendance_date_interval_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.attendance
    ADD CONSTRAINT attendance_date_interval_fkey FOREIGN KEY (date_interval) REFERENCES ftlc.date_interval(id);


--
-- Name: attendance attendance_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.attendance
    ADD CONSTRAINT attendance_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: attendance attendance_student_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.attendance
    ADD CONSTRAINT attendance_student_fkey FOREIGN KEY (student) REFERENCES ftlc.student(id);


--
-- Name: date_join date_join_date_interval_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.date_join
    ADD CONSTRAINT date_join_date_interval_fkey FOREIGN KEY (date_interval) REFERENCES ftlc.date_interval(id);


--
-- Name: date_join date_join_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.date_join
    ADD CONSTRAINT date_join_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: event event_activity_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event
    ADD CONSTRAINT event_activity_fkey FOREIGN KEY (activity) REFERENCES ftlc.activity(id);


--
-- Name: event event_address_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event
    ADD CONSTRAINT event_address_fkey FOREIGN KEY (address) REFERENCES ftlc.address(id);


--
-- Name: event_log event_log_date_interval_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_log
    ADD CONSTRAINT event_log_date_interval_fkey FOREIGN KEY (date_interval) REFERENCES ftlc.date_interval(id);


--
-- Name: event_log event_log_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_log
    ADD CONSTRAINT event_log_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: event_log event_log_instructor_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_log
    ADD CONSTRAINT event_log_instructor_fkey FOREIGN KEY (instructor) REFERENCES ftlc.users(id);


--
-- Name: event_log event_log_student_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_log
    ADD CONSTRAINT event_log_student_fkey FOREIGN KEY (student) REFERENCES ftlc.student(id);


--
-- Name: event_registration event_registration_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_registration
    ADD CONSTRAINT event_registration_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: event_registration event_registration_payment_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_registration
    ADD CONSTRAINT event_registration_payment_fkey FOREIGN KEY (payment) REFERENCES ftlc.payment(id);


--
-- Name: event_registration event_registration_registered_by_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_registration
    ADD CONSTRAINT event_registration_registered_by_fkey FOREIGN KEY (registered_by) REFERENCES ftlc.users(id);


--
-- Name: event_registration event_registration_student_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_registration
    ADD CONSTRAINT event_registration_student_fkey FOREIGN KEY (student) REFERENCES ftlc.student(id);


--
-- Name: event_request event_request_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_request
    ADD CONSTRAINT event_request_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: event_request event_request_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.event_request
    ADD CONSTRAINT event_request_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id);


--
-- Name: payment payment_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.payment
    ADD CONSTRAINT payment_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id);


--
-- Name: promo_code promo_code_activity_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code
    ADD CONSTRAINT promo_code_activity_fkey FOREIGN KEY (activity) REFERENCES ftlc.activity(id);


--
-- Name: promo_code promo_code_category_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code
    ADD CONSTRAINT promo_code_category_fkey FOREIGN KEY (category) REFERENCES ftlc.category(id);


--
-- Name: promo_code promo_code_generated_by_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code
    ADD CONSTRAINT promo_code_generated_by_fkey FOREIGN KEY (generated_by) REFERENCES ftlc.payment(id);


--
-- Name: promo_code_use promo_code_use_promo_code_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code_use
    ADD CONSTRAINT promo_code_use_promo_code_fkey FOREIGN KEY (promo_code) REFERENCES ftlc.promo_code(id);


--
-- Name: promo_code_use promo_code_use_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code_use
    ADD CONSTRAINT promo_code_use_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id);


--
-- Name: promo_code promo_code_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.promo_code
    ADD CONSTRAINT promo_code_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id);


--
-- Name: refund_request refund_request_payment_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.refund_request
    ADD CONSTRAINT refund_request_payment_fkey FOREIGN KEY (payment) REFERENCES ftlc.payment(id);


--
-- Name: refund_request refund_request_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.refund_request
    ADD CONSTRAINT refund_request_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id);


--
-- Name: registration_override registration_override_event_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.registration_override
    ADD CONSTRAINT registration_override_event_fkey FOREIGN KEY (event) REFERENCES ftlc.event(id);


--
-- Name: registration_override registration_override_student_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.registration_override
    ADD CONSTRAINT registration_override_student_fkey FOREIGN KEY (student) REFERENCES ftlc.student(id);


--
-- Name: student student_parent_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.student
    ADD CONSTRAINT student_parent_fkey FOREIGN KEY (parent) REFERENCES ftlc.users(id);


--
-- Name: student_waiver student_waiver_student_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.student_waiver
    ADD CONSTRAINT student_waiver_student_fkey FOREIGN KEY (student) REFERENCES ftlc.student(id);


--
-- Name: transaction_state transaction_state_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc; Owner: nolan
--

ALTER TABLE ONLY ftlc.transaction_state
    ADD CONSTRAINT transaction_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id);


--
-- Name: users users_user_id_fkey; Type: FK CONSTRAINT; Schema: ftlc_private; Owner: nolan
--

ALTER TABLE ONLY ftlc_private.users
    ADD CONSTRAINT users_user_id_fkey FOREIGN KEY (user_id) REFERENCES ftlc.users(id) ON DELETE CASCADE;


--
-- Name: changes changes_project_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.changes
    ADD CONSTRAINT changes_project_fkey FOREIGN KEY (project) REFERENCES sqitch.projects(project) ON UPDATE CASCADE;


--
-- Name: dependencies dependencies_change_id_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.dependencies
    ADD CONSTRAINT dependencies_change_id_fkey FOREIGN KEY (change_id) REFERENCES sqitch.changes(change_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dependencies dependencies_dependency_id_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.dependencies
    ADD CONSTRAINT dependencies_dependency_id_fkey FOREIGN KEY (dependency_id) REFERENCES sqitch.changes(change_id) ON UPDATE CASCADE;


--
-- Name: events events_project_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.events
    ADD CONSTRAINT events_project_fkey FOREIGN KEY (project) REFERENCES sqitch.projects(project) ON UPDATE CASCADE;


--
-- Name: tags tags_change_id_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_change_id_fkey FOREIGN KEY (change_id) REFERENCES sqitch.changes(change_id) ON UPDATE CASCADE;


--
-- Name: tags tags_project_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: nolan
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_project_fkey FOREIGN KEY (project) REFERENCES sqitch.projects(project) ON UPDATE CASCADE;


--
-- Name: event_registration admin_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY admin_all ON ftlc.event_registration TO ftlc_admin_group USING (true);


--
-- Name: payment admin_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY admin_all ON ftlc.payment TO ftlc_admin_group USING (true);


--
-- Name: registration_override admin_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY admin_all ON ftlc.registration_override TO ftlc_admin_group USING (true);


--
-- Name: refund_request admin_view; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY admin_view ON ftlc.refund_request FOR SELECT TO ftlc_admin USING (true);


--
-- Name: attendance; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.attendance ENABLE ROW LEVEL SECURITY;

--
-- Name: attendance employee_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY employee_all ON ftlc.attendance TO ftlc_employee, ftlc_attendant USING (true);


--
-- Name: event_log employee_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY employee_all ON ftlc.event_log TO ftlc_employee, ftlc_attendant USING (true) WITH CHECK ((instructor = ftlc.get_id()));


--
-- Name: student_waiver employee_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY employee_all ON ftlc.student_waiver TO ftlc_employee USING (true);


--
-- Name: student employee_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY employee_all ON ftlc.student TO ftlc_employee, ftlc_attendant USING (true);


--
-- Name: event_registration employee_view; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY employee_view ON ftlc.event_registration FOR SELECT TO ftlc_instructor, ftlc_attendant USING (true);


--
-- Name: users employee_view; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY employee_view ON ftlc.users FOR SELECT TO ftlc_employee USING (true);


--
-- Name: event_log; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.event_log ENABLE ROW LEVEL SECURITY;

--
-- Name: event_registration; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.event_registration ENABLE ROW LEVEL SECURITY;

--
-- Name: payment is_user; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY is_user ON ftlc.payment TO ftlc_user USING ((user_id = ftlc.get_id()));


--
-- Name: refund_request is_user; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY is_user ON ftlc.refund_request TO ftlc_user USING ((user_id = ftlc.get_id()));


--
-- Name: users is_user; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY is_user ON ftlc.users TO ftlc_user USING (((id = ftlc.get_id()) OR (role <> 'ftlc_user'::ftlc.role_type)));


--
-- Name: refund_request owner_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY owner_all ON ftlc.refund_request FOR SELECT TO ftlc_owner USING (true);


--
-- Name: users owner_all; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY owner_all ON ftlc.users TO ftlc_owner USING (true);


--
-- Name: attendance parent_attendance; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY parent_attendance ON ftlc.attendance TO ftlc_user USING ((student IN ( SELECT student.id
   FROM ftlc.student
  WHERE (student.parent = ftlc.get_id()))));


--
-- Name: event_log parent_log; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY parent_log ON ftlc.event_log TO ftlc_user USING ((student IN ( SELECT student.id
   FROM ftlc.student
  WHERE (student.parent = ftlc.get_id()))));


--
-- Name: student_waiver parent_of_student; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY parent_of_student ON ftlc.student_waiver TO ftlc_user USING ((student IN ( SELECT student.id
   FROM ftlc.student
  WHERE (student.parent = ftlc.get_id()))));


--
-- Name: student parent_of_student; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY parent_of_student ON ftlc.student TO ftlc_user USING ((parent = ftlc.get_id()));


--
-- Name: registration_override parent_of_student; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY parent_of_student ON ftlc.registration_override FOR SELECT TO ftlc_user USING ((student IN ( SELECT student.id
   FROM ftlc.student
  WHERE (student.parent = ftlc.get_id()))));


--
-- Name: payment; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.payment ENABLE ROW LEVEL SECURITY;

--
-- Name: refund_request; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.refund_request ENABLE ROW LEVEL SECURITY;

--
-- Name: event_registration registered_by; Type: POLICY; Schema: ftlc; Owner: nolan
--

CREATE POLICY registered_by ON ftlc.event_registration TO ftlc_user USING ((registered_by = ftlc.get_id()));


--
-- Name: registration_override; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.registration_override ENABLE ROW LEVEL SECURITY;

--
-- Name: student; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.student ENABLE ROW LEVEL SECURITY;

--
-- Name: student_waiver; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.student_waiver ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: ftlc; Owner: nolan
--

ALTER TABLE ftlc.users ENABLE ROW LEVEL SECURITY;

--
-- Name: SCHEMA ftlc; Type: ACL; Schema: -; Owner: nolan
--

GRANT USAGE ON SCHEMA ftlc TO ftlc_roles;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE event; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.event TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.event TO ftlc_roles;


--
-- Name: TABLE users; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.users TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.users TO ftlc_instructor;
GRANT SELECT ON TABLE ftlc.users TO ftlc_user;


--
-- Name: COLUMN users.email; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT UPDATE(email) ON TABLE ftlc.users TO ftlc_user;


--
-- Name: TABLE date_join; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.date_join TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.date_join TO ftlc_roles;


--
-- Name: TABLE activity; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.activity TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.activity TO ftlc_roles;


--
-- Name: TABLE activity_prerequisite; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.activity_prerequisite TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.activity_prerequisite TO ftlc_roles;


--
-- Name: TABLE add_on; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.add_on TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.add_on TO ftlc_roles;


--
-- Name: TABLE add_on_join; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.add_on_join TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.add_on_join TO ftlc_roles;


--
-- Name: TABLE address; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.address TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.address TO ftlc_roles;


--
-- Name: TABLE announcement; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.announcement TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.announcement TO ftlc_roles;


--
-- Name: SEQUENCE announcement_id_seq; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT SELECT,USAGE ON SEQUENCE ftlc.announcement_id_seq TO ftlc_roles;


--
-- Name: TABLE attendance; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.attendance TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.attendance TO ftlc_instructor;
GRANT SELECT,INSERT ON TABLE ftlc.attendance TO ftlc_attendant;
GRANT SELECT ON TABLE ftlc.attendance TO ftlc_user;


--
-- Name: TABLE category; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.category TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.category TO ftlc_roles;


--
-- Name: TABLE date_interval; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.date_interval TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.date_interval TO ftlc_roles;


--
-- Name: TABLE event_log; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.event_log TO ftlc_admin_group;
GRANT SELECT,INSERT ON TABLE ftlc.event_log TO ftlc_instructor;
GRANT SELECT ON TABLE ftlc.event_log TO ftlc_user;
GRANT SELECT,INSERT ON TABLE ftlc.event_log TO ftlc_attendant;


--
-- Name: TABLE event_registration; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.event_registration TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.event_registration TO ftlc_instructor;
GRANT SELECT ON TABLE ftlc.event_registration TO ftlc_attendant;
GRANT SELECT ON TABLE ftlc.event_registration TO ftlc_user;


--
-- Name: TABLE event_request; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.event_request TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.event_request TO ftlc_user;


--
-- Name: COLUMN event_request.information; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT INSERT(information) ON TABLE ftlc.event_request TO ftlc_user;


--
-- Name: TABLE news_letter; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.news_letter TO ftlc_admin_group;
GRANT INSERT ON TABLE ftlc.news_letter TO ftlc_roles;


--
-- Name: TABLE payment; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.payment TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.payment TO ftlc_user;


--
-- Name: TABLE promo_code; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.promo_code TO ftlc_admin_group;


--
-- Name: TABLE promo_code_use; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.promo_code_use TO ftlc_admin_group;


--
-- Name: TABLE refund_request; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.refund_request TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.refund_request TO ftlc_user;


--
-- Name: COLUMN refund_request.payment; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT INSERT(payment) ON TABLE ftlc.refund_request TO ftlc_user;


--
-- Name: COLUMN refund_request.reason; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT INSERT(reason) ON TABLE ftlc.refund_request TO ftlc_user;


--
-- Name: TABLE registration_override; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.registration_override TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.registration_override TO ftlc_user;


--
-- Name: TABLE student; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.student TO ftlc_admin_group;
GRANT SELECT ON TABLE ftlc.student TO ftlc_instructor;
GRANT SELECT ON TABLE ftlc.student TO ftlc_attendant;
GRANT SELECT ON TABLE ftlc.student TO ftlc_user;


--
-- Name: COLUMN student.first_name; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT INSERT(first_name) ON TABLE ftlc.student TO ftlc_user;


--
-- Name: COLUMN student.last_name; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT INSERT(last_name) ON TABLE ftlc.student TO ftlc_user;


--
-- Name: COLUMN student.date_of_birth; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT INSERT(date_of_birth) ON TABLE ftlc.student TO ftlc_user;


--
-- Name: TABLE student_waiver; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.student_waiver TO ftlc_admin_group;
GRANT SELECT,INSERT ON TABLE ftlc.student_waiver TO ftlc_user;
GRANT SELECT ON TABLE ftlc.student_waiver TO ftlc_instructor;


--
-- Name: TABLE transaction_state; Type: ACL; Schema: ftlc; Owner: nolan
--

GRANT ALL ON TABLE ftlc.transaction_state TO ftlc_admin_group;


--
-- PostgreSQL database dump complete
--
