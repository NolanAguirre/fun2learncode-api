-- Verify ftlc:users_private on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc_private' AND tablename = 'users';


ROLLBACK;
