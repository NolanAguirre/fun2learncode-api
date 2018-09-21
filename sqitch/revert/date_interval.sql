-- Revert ftlc:event_dates from pg

BEGIN;

-- DROP TRIGGER update_event_month ON ftlc.event_dates;

DROP TABLE ftlc.date_interval;

COMMIT;
