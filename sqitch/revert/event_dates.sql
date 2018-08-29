-- Revert ftlc:event_dates from pg

BEGIN;

DROP TABLE ftlc.event_dates;

COMMIT;
