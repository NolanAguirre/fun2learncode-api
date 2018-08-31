-- Deploy ftlc:event_prerequisites to pg
-- requires: activities

BEGIN;

CREATE TABLE ftlc.event_prerequisites(
    event UUID REFERENCES ftlc.activities(id),
    prerequisite UUID REFERENCES ftlc.activities(id),
    PRIMARY KEY(event,prerequisite)
);

COMMIT;
