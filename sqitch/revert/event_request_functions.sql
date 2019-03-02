-- Revert ftlc:event_request_functions from pg

BEGIN;

DROP FUNCTION ftlc.event_by_token(TEXT);

COMMIT;
