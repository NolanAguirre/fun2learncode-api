-- Deploy ftlc:registration_override to pg
-- requires: activities
-- requires: students

BEGIN;

CREATE TABLE ftlc.registration_override(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.students(id),
    activity UUID REFERENCES ftlc.activities(id),
    modified_price FLOAT
);

COMMIT;
