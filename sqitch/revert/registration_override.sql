-- Revert ftlc:registration_override from pg

BEGIN;

DROP TABLE ftlc.registration_override;

COMMIT;
