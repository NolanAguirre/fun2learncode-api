-- Deploy ftlc:payment to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.payment(
    id UUID NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES ftlc.users(id),
    status ftlc.payment_status_type NOT NULL DEFAULT 'paid',
    create_on TIMESTAMP NOT NULL DEFAULT NOW(),
    snapshot JSONB NOT NULL,
    charge JSONB NOT NULL,
    refund JSONB
);

COMMIT;
