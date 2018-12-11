-- Revert ftlc:event_functions from pg

BEGIN;

DROP FUNCTION ftlc.check_prerequisites(event_id UUID, student UUID);

DROP FUNCTION ftlc.months_by_student(UUID);

COMMIT;
