-- Verify ftlc:transaction_state_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.store_transaction(UUID, JSONB)'::regprocedure);

ROLLBACK;
