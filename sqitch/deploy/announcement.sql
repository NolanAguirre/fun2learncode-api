-- Deploy ftlc:announcement to pg
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.announcement(
    id SERIAL PRIMARY KEY,
    title CITEXT,
    message CITEXT,
    start_display TIMESTAMP DEFAULT NOW()
);

COMMIT;
