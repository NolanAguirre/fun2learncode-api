-- Verify ftlc:activity_request on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'event_request';

ROLLBACK;
