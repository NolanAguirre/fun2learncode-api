-- Verify ftlc:add_ons on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'add_on';

ROLLBACK;
