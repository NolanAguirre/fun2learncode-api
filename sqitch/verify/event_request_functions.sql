-- Verify ftlc:event_request_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.event_by_token(TEXT)'::regprocedure);

ROLLBACK;
