-- Verify ftlc:events_join_date_group on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'event_dates';

ROLLBACK;
