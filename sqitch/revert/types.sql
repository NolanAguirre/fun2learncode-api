-- Revert ftlc:types from pg

BEGIN;

DROP TYPE ftlc.activity_type;

DROP TYPE ftlc.role_type;

COMMIT;
