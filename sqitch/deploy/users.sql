-- Deploy ftlc:users to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name CITEXT,
    last_name CITEXT,
    contact_email CITEXT UNIQUE CHECK(contact_email ~* '^.+@.+\..+$'),
    contact_phone varchar(12),
    role ftlc.role_type
);

COMMIT;
