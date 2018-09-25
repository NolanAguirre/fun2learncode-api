-- Revert ftlc:activities_functions from pg

BEGIN;

DROP FUNCTION ftlc.make_activity(UUID, CITEXT, CITEXT, UUID);

COMMIT;
