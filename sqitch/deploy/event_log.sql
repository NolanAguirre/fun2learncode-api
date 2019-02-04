-- Deploy ftlc:event_logs to pg
-- requires: events
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_log(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.event(id),
    date_interval UUID REFERENCES ftlc.date_interval(id),
    student UUID REFERENCES ftlc.student(id),
    instructor UUID REFERENCES ftlc.users(id),
    comment CITEXT
);

COMMIT;
