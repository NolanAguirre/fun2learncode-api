-- Revert ftlc:types from pg

BEGIN;

DROP TYPE ftlc.role_type;

COMMIT;
