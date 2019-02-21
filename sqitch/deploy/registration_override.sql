-- Deploy ftlc:registration_override to pg
-- requires: activities
-- requires: students

BEGIN;

CREATE TABLE ftlc.registration_override(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.student(id) NOT NULL,
    event UUID REFERENCES ftlc.event(id) NOT NULL,
    modified_price FLOAT NOT NULL,
    valid_end TIMESTAMP NOT NULL,
    CONSTRAINT unique_override UNIQUE (student, event)
);

COMMIT;
