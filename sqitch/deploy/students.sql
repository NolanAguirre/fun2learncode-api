-- Deploy ftlc:students to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.students(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    parent UUID REFERENCES ftlc.users(id),
    first_name CITEXT CHECK(first_name != ''),
    last_name CITEXT CHECK(last_name != ''),
    date_of_birth TIMESTAMP    
);

COMMIT;
