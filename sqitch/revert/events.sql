-- Revert ftlc:events from pg

BEGIN;

DROP TABLE ftlc.events;

COMMIT;
