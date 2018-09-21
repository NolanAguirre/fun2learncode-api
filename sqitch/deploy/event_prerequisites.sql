-- Deploy ftlc:event_prerequisites to pg
-- requires: activities

BEGIN;

CREATE TABLE ftlc.event_prerequisites(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.activities(id),
    prerequisite UUID REFERENCES ftlc.activities(id),
    CONSTRAINT unique_prerequisite UNIQUE (event,prerequisite)
);

COMMIT;
