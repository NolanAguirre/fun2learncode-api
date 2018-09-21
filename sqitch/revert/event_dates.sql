-- Revert ftlc:events_join_date_group from pg

BEGIN;

DROP TABLE ftlc.event_dates;

COMMIT;
