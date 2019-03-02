-- Revert ftlc:add_on_join from pg

BEGIN;

DROP TABLE ftlc.add_on_join;

COMMIT;
