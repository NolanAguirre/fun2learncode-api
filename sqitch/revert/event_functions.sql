-- Revert ftlc:event_functions from pg

BEGIN;

DROP FUNCTION ftlc.check_registration(UUID, UUID);

DROP FUNCTION ftlc.check_time (UUID, UUID);

DROP FUNCTION ftlc.check_prerequisite(UUID, UUID);

DROP FUNCTION ftlc.event_in_dates(TIMESTAMP, TIMESTAMP);

COMMIT;
