-- Verify ftlc:date_group on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'event';

ROLLBACK;
