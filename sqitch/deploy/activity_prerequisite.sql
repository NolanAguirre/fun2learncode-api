-- Deploy ftlc:event_prerequisites to pg
-- requires: activities

BEGIN;

CREATE TABLE ftlc.activity_prerequisite(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    activity UUID REFERENCES ftlc.activity(id),
    prerequisite UUID REFERENCES ftlc.activity(id),
    CONSTRAINT unique_prerequisite UNIQUE (activity, prerequisite),
    CONSTRAINT not_self CHECK (activity != prerequisite)
);

COMMIT;
