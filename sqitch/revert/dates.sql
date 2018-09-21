-- Revert ftlc:date_group_join_date_interval from pg

BEGIN;

DROP TABLE ftlc.dates;

COMMIT;
