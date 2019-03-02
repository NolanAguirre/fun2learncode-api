-- Verify ftlc:newsletter on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'news_letter';

ROLLBACK;
