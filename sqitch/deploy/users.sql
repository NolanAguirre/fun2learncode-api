-- Deploy ftlc:users to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name CITEXT CHECK(first_name != ''),
    last_name CITEXT CHECK(last_name != ''),
    email CITEXT NOT NULL UNIQUE CHECK(email ~* '^.+@.+\..+$'),
    created_on TIMESTAMP DEFAULT NOW(),
    role ftlc.role_type
);

COMMIT;
