-- Revert ftlc:event_prerequisites from pg

BEGIN;

DROP TABLE ftlc.activity_prerequisites;

COMMIT;
