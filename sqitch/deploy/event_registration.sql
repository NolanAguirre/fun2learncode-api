-- Deploy ftlc:event_registration to pg
-- requires: date_group
-- requires: events
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_registration(
    id UUID  DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.students(id),
    event_dates UUID REFERENCES ftlc.date_group(id),
    event UUID references ftlc.events(id),
    registered_on TIMESTAMP DEFAULT NOW(),
    status ftlc.registration_status_type,
    CONSTRAINT unqiue_registration PRIMARY KEY (student, event_dates, event)
);

COMMIT;
