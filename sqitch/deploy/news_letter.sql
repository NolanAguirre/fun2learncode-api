-- Deploy ftlc:news_letter to pg
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.news_letter(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email CITEXT NOT NULL UNIQUE CHECK(email ~* '^.+@.+\..+$')
);

COMMIT;
