-- Deploy ftlc:event_join_date_interval to pg
-- requires: event
-- requires: date_interval

BEGIN;

CREATE TABLE ftlc.date_join(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.event(id),
    date_interval UUID REFERENCES ftlc.date_interval(id),
    CONSTRAINT unique_join UNIQUE (event, date_interval)
);

COMMIT;
