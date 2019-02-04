-- Revert ftlc:activity_request from pg

BEGIN;

DROP TABLE ftlc.event_request;

COMMIT;
