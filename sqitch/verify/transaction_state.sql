-- Verify ftlc:transaction_state on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'transaction_state';

ROLLBACK;
