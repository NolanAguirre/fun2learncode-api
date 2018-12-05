-- Deploy ftlc:event_prerequisites to pg
-- requires: activities

BEGIN;

CREATE TABLE ftlc.activity_prerequisites(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    activity UUID REFERENCES ftlc.activities(id),
    prerequisite UUID REFERENCES ftlc.activities(id),
    CONSTRAINT unique_prerequisite UNIQUE (activity ,prerequisite)
);

COMMIT;
