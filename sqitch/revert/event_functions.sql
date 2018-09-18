-- Revert ftlc:event_functions from pg

BEGIN;

DROP FUNCTION ftlc.events_by_student(UUID);

DROP FUNCTION ftlc.months_by_student(UUID);

COMMIT;
