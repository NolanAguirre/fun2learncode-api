-- Deploy ftlc:events to pg
-- requires: activities

BEGIN;

CREATE TABLE ftlc.events(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event_type UUID REFERENCES ftlc.activities(id),
    address UUID REFERENCES ftlc.address(id),
    registration_time_frame UUID REFERENCES ftlc.date_interval(id),
    capacity INTEGER,
    price FLOAT
);

COMMIT;
