-- Deploy ftlc:users_private to pg
-- requires: users
-- requires: types

BEGIN;

CREATE TABLE ftlc_private.users(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID UNIQUE REFERENCES ftlc.users(id) ON DELETE CASCADE,
    email CITEXT NOT NULL UNIQUE CHECK(email ~* '^.+@.+\..+$'),
    password_hash TEXT NOT NULL,
    credits INTEGER,
    stripe_id TEXT
);

COMMIT;
