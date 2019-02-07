-- Deploy ftlc:event_logs to pg
-- requires: events
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_log(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.event(id) NOT NULL,
    date_interval UUID REFERENCES ftlc.date_interval(id) NOT NULL,
    student UUID REFERENCES ftlc.student(id) NOT NULL,
    instructor UUID REFERENCES ftlc.users(id),
    comment CITEXT
);

COMMIT;
