-- Revert ftlc:event_dates from pg

BEGIN;

DROP FUNCTION ftlc.make_date_interval(TIMESTAMP, TIMESTAMP, UUID);

DROP FUNCTION ftlc.remove_date_interval(TIMESTAMP, TIMESTAMP, UUID);

DROP TABLE ftlc.date_interval;

COMMIT;
