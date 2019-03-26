-- Deploy ftlc:stripe_id to pg
-- requires: users_private

BEGIN;

ALTER TABLE ftlc_private.users ADD COLUMN stripe_id TEXT;

COMMIT;
