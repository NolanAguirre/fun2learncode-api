-- Deploy ftlc:announcement to pg
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.announcement(
    id SERIAL PRIMARY KEY,
    title CITEXT NOT NULL,
    message CITEXT NOT NULL,
    created_on TIMESTAMP DEFAULT NOW()
);

COMMIT;
