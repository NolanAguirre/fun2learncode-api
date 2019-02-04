-- Revert ftlc:date_group from pg

BEGIN;

DROP TABLE ftlc.event;

COMMIT;
