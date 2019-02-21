-- Revert ftlc:private_event from pg

BEGIN;

DROP TABLE ftlc.private_event;

COMMIT;
