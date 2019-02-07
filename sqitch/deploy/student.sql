-- Deploy ftlc:students to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.student(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    parent UUID REFERENCES ftlc.users(id) NOT NULL,
    first_name CITEXT NOT NULL CHECK(first_name != ''),
    last_name CITEXT NOT NULL CHECK(last_name != ''),
    -- allergies //TODO
    date_of_birth TIMESTAMP NOT NULL
);

COMMIT;
