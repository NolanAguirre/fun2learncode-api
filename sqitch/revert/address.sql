-- Revert ftlc:address from pg

BEGIN;

DROP TABLE ftlc.address;

COMMIT;
