-- Deploy ftlc:registration_override to pg
-- requires: activities
-- requires: students

BEGIN;

CREATE TABLE ftlc.registration_override(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.students(id),
    date_group UUID REFERENCES ftlc.date_group(id),
    modified_price FLOAT
);

COMMIT;
