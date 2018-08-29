-- Revert ftlc:users from pg

BEGIN;

DROP TABLE ftlc.users;

COMMIT;
