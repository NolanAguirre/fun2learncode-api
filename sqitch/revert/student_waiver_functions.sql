-- Revert ftlc:student_waiver_functions from pg

BEGIN;

DROP FUNCTION ftlc.check_waiver(UUID);

COMMIT;
