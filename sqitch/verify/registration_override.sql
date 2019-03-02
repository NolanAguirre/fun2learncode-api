-- Verify ftlc:registration_override on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'registration_override';

ROLLBACK;
