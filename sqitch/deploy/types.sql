-- Deploy ftlc:types to pg
-- requires: appschema

BEGIN;

CREATE TYPE ftlc.role_type AS ENUM(
    'ftlc_owner',
    'ftlc_instructor',
    'ftlc_user',
    'ftlc_student',
    'ftlc_anonymous'
);

CREATE TYPE ftlc.jwt_token AS(
    id UUID,
    expires_at INTEGER,
    role ftlc.role_type
);

COMMIT;
