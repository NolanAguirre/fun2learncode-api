-- Deploy ftlc:transaction_state to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.transaction_state(
    user_id UUID PRIMARY KEY REFERENCES ftlc.users(id),
    transaction JSONB NOT NULL,
    processing BOOLEAN NOT NULL
);

COMMIT;
