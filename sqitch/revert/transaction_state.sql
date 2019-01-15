-- Revert ftlc:transaction_state from pg

BEGIN;

DROP TABLE ftlc.transaction_state;

COMMIT;
