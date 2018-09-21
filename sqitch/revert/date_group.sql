-- Revert ftlc:date_group from pg

BEGIN;

DROP TABLE ftlc.date_group;

COMMIT;
