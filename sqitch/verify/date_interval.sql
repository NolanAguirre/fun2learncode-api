-- Verify ftlc:event_dates on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'date_interval';

ROLLBACK;
