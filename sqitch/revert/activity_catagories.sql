-- Revert ftlc:activity_catagories from pg

BEGIN;

DROP TABLE ftlc.activity_catagories;

COMMIT;
