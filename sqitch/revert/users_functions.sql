-- Revert ftlc:users_functions from pg

BEGIN;

DROP FUNCTION ftlc.get_user_data();

DROP FUNCTION ftlc.get_id();

DROP FUNCTION ftlc.check_email(email CITEXT);

DROP FUNCTION ftlc.register_user(CITEXT, CITEXT, CITEXT, TEXT);

DROP FUNCTION ftlc.register_other(CITEXT, CITEXT, CITEXT, TEXT, ftlc.role_type);

DROP FUNCTION ftlc.authenticate(CITEXT, TEXT);

DROP FUNCTION ftlc.generate_temporary_password(CITEXT);

COMMIT;
