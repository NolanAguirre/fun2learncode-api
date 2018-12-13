-- Revert ftlc:add_ons from pg

BEGIN;

DROP TABLE ftlc.add_ons;

COMMIT;
