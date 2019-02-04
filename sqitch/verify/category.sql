-- Verify ftlc:activity_catagories on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'category';

ROLLBACK;
