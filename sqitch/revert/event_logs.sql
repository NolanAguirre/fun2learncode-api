-- Revert ftlc:event_logs from pg

BEGIN;

DROP TABLE ftlc.event_logs;

COMMIT;
