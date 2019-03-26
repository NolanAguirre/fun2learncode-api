-- Revert ftlc:stripe_id from pg

BEGIN;

ALTER TABLE ftlc_private.users DROP COLUMN stripe_id;

COMMIT;
