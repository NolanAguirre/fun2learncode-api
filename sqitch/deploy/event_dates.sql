-- Deploy ftlc:event_dates to pg
-- requires: events

BEGIN;

CREATE TABLE ftlc.event_dates(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.events(id),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

COMMIT;
