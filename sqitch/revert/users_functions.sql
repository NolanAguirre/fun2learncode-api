-- Revert ftlc:users_functions from pg

BEGIN;

DROP FUNCTION ftlc.get_user_data();

DROP FUNCTION ftlc.get_id();

DROP FUNCTION ftlc.register_user(CITEXT, CITEXT, CITEXT, TEXT);

DROP FUNCTION ftlc.register_student(CITEXT, CITEXT, CITEXT, TEXT);

DROP FUNCTION ftlc.register_instructor(CITEXT, CITEXT, CITEXT, TEXT);

DROP FUNCTION ftlc.authenticate(CITEXT, TEXT);

COMMIT;
