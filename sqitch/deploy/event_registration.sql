-- Deploy ftlc:event_registration to pg
-- requires: events
-- requires: students
-- requires: payment

BEGIN;

CREATE TABLE ftlc.event_registration(
    id UUID PRIMARY KEY  DEFAULT uuid_generate_v4(),
    registered_by UUID REFERENCES ftlc.users(id) NOT NULL,
    student UUID REFERENCES ftlc.student(id) NOT NULL,
    event UUID REFERENCES ftlc.event(id) NOT NULL,
    payment UUID REFERENCES ftlc.payment(id) NOT NULL,
    registered_on TIMESTAMP DEFAULT NOW(),
    CONSTRAINT unqiue_registration UNIQUE (student, event)
);

COMMIT;
