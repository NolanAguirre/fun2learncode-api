-- Verify ftlc:refund_request on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'refund_request';

ROLLBACK;
