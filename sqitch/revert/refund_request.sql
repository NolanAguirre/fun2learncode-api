-- Revert ftlc:refund_request from pg

BEGIN;

DROP TABLE ftlc.refund_request;

COMMIT;
