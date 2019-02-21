-- Revert ftlc:private_event_functions from pg

BEGIN;

DROP FUNCTION ftlc.event_by_hash(TEXT);

COMMIT;
