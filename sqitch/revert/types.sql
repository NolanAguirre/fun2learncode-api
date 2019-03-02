-- Revert ftlc:types from pg

BEGIN;

DROP TYPE ftlc.jwt_token;

DROP TYPE ftlc.payment_status_type;

DROP TYPE ftlc.role_type;

DROP TYPE ftlc.request_type;

COMMIT;
