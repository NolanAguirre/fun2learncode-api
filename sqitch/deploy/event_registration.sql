-- Deploy ftlc:event_registration to pg
-- requires: event_dates
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_registration(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.students(id),
    event_date UUID REFERENCES ftlc.event_dates(id),
    registered_on TIMESTAMP DEFAULT NOW(),
    attendance BOOLEAN
);

COMMIT;
