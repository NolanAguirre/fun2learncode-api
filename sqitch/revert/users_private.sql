-- Revert ftlc:users_private from pg

BEGIN;

DROP TABLE ftlc_private.users;

COMMIT;
