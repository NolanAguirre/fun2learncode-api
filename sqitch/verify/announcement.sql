-- Verify ftlc:announcement on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'announcement';

ROLLBACK;
