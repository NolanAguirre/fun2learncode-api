-- Deploy ftlc:event_registration to pg
-- requires: events
-- requires: students

BEGIN;

CREATE TABLE ftlc.event_registration(
    id UUID  DEFAULT uuid_generate_v4(),
    registered_by UUID REFERENCES ftlc.users(id),
    student UUID REFERENCES ftlc.users(id),
    date_group UUID REFERENCES ftlc.date_group(id),
    registered_on TIMESTAMP DEFAULT NOW(),
    status ftlc.registration_status_type DEFAULT 'unpaid',
    CONSTRAINT unqiue_registration PRIMARY KEY (student, date_group)
);

COMMIT;
