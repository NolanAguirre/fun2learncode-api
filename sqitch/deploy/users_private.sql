-- Deploy ftlc:users_private to pg
-- requires: users
-- requires: types

BEGIN;

CREATE TABLE ftlc_private.users(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID UNIQUE REFERENCES ftlc.users(id) ON DELETE CASCADE,
    password_hash TEXT NOT NULL,
    password_reset TEXT,
    password_reset_expiration TIMESTAMPTZ
);

COMMIT;
