-- Revert ftlc:users_functions from pg

BEGIN;

DROP FUNCTION ftlc.register_user(CITEXT, CITEXT, CITEXT, TEXT);;

DROP FUNCTION ftlc.register_student(CITEXT, CITEXT, CITEXT, TEXT);;

DROP FUNCTION ftlc.authenticate(CITEXT, TEXT);;

COMMIT;
