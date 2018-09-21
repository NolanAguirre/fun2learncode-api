-- Deploy ftlc:event_logs to pg
-- requires: event_dates
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_logs(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.events(id),
    student UUID REFERENCES ftlc.students(id),
    instructor UUID REFERENCES ftlc.users(id),
    comment CITEXT
);

COMMIT;
