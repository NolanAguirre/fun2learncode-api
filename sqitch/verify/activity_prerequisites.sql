-- Verify ftlc:event_prerequisites on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'activity_prerequisites';

ROLLBACK;
