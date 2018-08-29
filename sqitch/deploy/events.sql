-- Deploy ftlc:events to pg
-- requires: activities

BEGIN;

CREATE TABLE ftlc.events(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_type UUID REFERENCES ftlc.activities(id),
    address UUID REFERENCES ftlc.address(id),
    capacity INTEGER,
    price FLOAT
);

COMMIT;
