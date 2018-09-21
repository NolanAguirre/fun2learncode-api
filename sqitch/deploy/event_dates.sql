-- Deploy ftlc:events_join_date_group to pg
-- requires: date_group
-- requires: events

BEGIN;

CREATE TABLE ftlc.event_dates(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    date_group UUID REFERENCES ftlc.date_group(id),
    event UUID REFERENCES ftlc.events(id)
);

COMMIT;
