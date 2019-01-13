-- Revert ftlc:payment from pg

BEGIN;

DROP TABLE ftlc.payment;

COMMIT;
