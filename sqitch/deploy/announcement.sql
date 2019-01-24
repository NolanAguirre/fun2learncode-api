-- Deploy ftlc:announcement to pg
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.announcement(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title CITEXT,
    message CITECT,
    start_display TIMESTAMP DEFAULT NOW()
);

COMMIT;
