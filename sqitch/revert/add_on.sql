-- Revert ftlc:add_ons from pg

BEGIN;

DROP TABLE ftlc.add_on;

COMMIT;
