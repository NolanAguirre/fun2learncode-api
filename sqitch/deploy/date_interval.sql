-- Deploy ftlc:event_dates to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.date_interval(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    start TIMESTAMPTZ NOT NULL,
    "end" TIMESTAMPTZ NOT NULL CHECK ("end" > start),
    archive BOOLEAN DEFAULT false,
    CONSTRAINT unique_date UNIQUE (start, "end")
);

COMMIT;
