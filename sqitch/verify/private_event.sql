-- Verify ftlc:private_event on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'private_event';

ROLLBACK;
