-- Verify ftlc:event_registration on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'event_registration';

ROLLBACK;
