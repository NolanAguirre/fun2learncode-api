-- Revert ftlc:event_dates from pg

BEGIN;

DROP TABLE ftlc.date_interval;

COMMIT;
