-- Deploy ftlc:types to pg
-- requires: appschema

BEGIN;

CREATE TYPE ftlc.role_type AS ENUM(
    'ftlc_owner',
    'ftlc_admin',
    'ftlc_lead_instructor',
    'ftlc_instructor',
    'ftlc_attendant',
    'ftlc_user',
    'ftlc_student',
    'ftlc_anonymous'
);

CREATE TYPE ftlc.registration_status_type AS ENUM(
    'waitlist',
    'paid',
    'unpaid'
);

CREATE TYPE ftlc.jwt_token AS(
    role ftlc.role_type,
    expires_at INTEGER,
    id UUID
);

COMMIT;
