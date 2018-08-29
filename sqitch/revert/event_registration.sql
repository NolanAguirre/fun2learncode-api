-- Revert ftlc:event_registration from pg

BEGIN;

DROP TABLE ftlc.event_registration;

COMMIT;
