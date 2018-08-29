-- Deploy ftlc:event_logs to pg
-- requires: event_dates
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_logs(
    id UUID PRIMARY KEY,
    event_date UUID REFERENCES ftlc.event_dates(id),
    student UUID REFERENCES ftlc.students(id),
    instructor UUID REFERENCES ftlc.users(id),
    comment CITEXT
);

COMMIT;
