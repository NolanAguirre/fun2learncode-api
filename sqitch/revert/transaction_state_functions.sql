-- Revert ftlc:transaction_state_functions from pg

BEGIN;

DROP FUNCTION ftlc.store_transaction(UUID, JSONB);

COMMIT;
