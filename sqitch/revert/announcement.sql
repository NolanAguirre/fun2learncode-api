-- Revert ftlc:announcement from pg

BEGIN;

DROP TABLE ftlc.announcement;

COMMIT;
