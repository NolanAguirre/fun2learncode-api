-- Verify ftlc:student_waiver_functions on pg

BEGIN;

DROP FUNCTION ftlc.check_waiver(UUID);

ROLLBACK;
