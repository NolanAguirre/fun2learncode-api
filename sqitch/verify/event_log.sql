-- Verify ftlc:event_logs on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'event_log';

ROLLBACK;
