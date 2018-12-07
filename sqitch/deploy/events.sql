-- Deploy ftlc:events to pg
-- requires: activities
-- requires: address

BEGIN;

CREATE TABLE ftlc.events(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_type UUID REFERENCES ftlc.activities(id),
    open_registration TIMESTAMP,
    close_registration TIMESTAMP
);

COMMIT;
