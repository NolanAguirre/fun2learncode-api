-- Deploy ftlc:users to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name CITEXT CHECK(first_name != ''),
    last_name CITEXT CHECK(last_name != ''),
    -- contact_email CITEXT UNIQUE CHECK(contact_email ~* '^.+@.+\..+$'),
    -- contact_phone varchar(12),
    role ftlc.role_type
);

COMMIT;
