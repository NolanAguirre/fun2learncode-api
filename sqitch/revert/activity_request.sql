-- Revert ftlc:activity_request from pg

BEGIN;

DROP TABLE ftlc.activity_request;

COMMIT;
