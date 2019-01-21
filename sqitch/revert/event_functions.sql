-- Revert ftlc:event_functions from pg

BEGIN;

DROP FUNCTION ftlc.check_registration(UUID, UUID);

DROP FUNCTION ftlc.check_time (UUID, UUID);

DROP FUNCTION ftlc.check_prerequisites(event_id UUID, student UUID);

COMMIT;
