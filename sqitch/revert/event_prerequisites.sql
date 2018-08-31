-- Revert ftlc:event_prerequisites from pg

BEGIN;

DROP TABLE ftlc.event_prerequisites;

COMMIT;
