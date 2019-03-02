-- Revert ftlc:attendance from pg

BEGIN;

DROP TABLE ftlc.attendance;

COMMIT;
