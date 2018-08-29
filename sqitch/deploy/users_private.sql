-- Deploy ftlc:users_private to pg
-- requires: users
-- requires: types

BEGIN;

CREATE TABLE ftlc_private.users(
  user_id       UUID PRIMARY KEY REFERENCES ftlc.users(id) ON DELETE CASCADE,
  email         CITEXT NOT NULL UNIQUE CHECK(email ~* '^.+@.+\..+$'),
  password_hash TEXT NOT NULL
);

COMMIT;
