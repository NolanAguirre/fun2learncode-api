-- Verify ftlc:add_on_join on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'add_on_join';

ROLLBACK;
