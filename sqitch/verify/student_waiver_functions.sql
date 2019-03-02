-- Verify ftlc:student_waiver_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.check_waiver(UUID)'::regprocedure);

ROLLBACK;
