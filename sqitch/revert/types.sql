-- Revert ftlc:types from pg

BEGIN;

DROP TYPE ftlc.jwt_token;

DROP TYPE ftlc.role_type;

COMMIT;
