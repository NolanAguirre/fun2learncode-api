-- Revert ftlc:types from pg

BEGIN;

DROP TYPE ftlc.role_type;

DROP TYPE ftlc.jwt_token;

COMMIT;
