-- Verify ftlc:date_group_join_date_interval on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'dates_join';

ROLLBACK;
