-- Deploy ftlc:attendance to pg
-- requires: date_interval
-- requires: users

BEGIN;

CREATE TABLE ftlc.attendance(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.user(id),
    date UUID REFERENCES ftlc.date_interval(id),
    present BOOLEAN
);


COMMIT;
