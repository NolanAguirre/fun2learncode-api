-- Deploy ftlc:students to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.students(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    parent UUID REFERENCES ftlc.users(id),
    student UUID REFERENCES ftlc.users(id)
);

COMMIT;
