-- Verify ftlc:student_waiver on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'student_waiver';

ROLLBACK;
