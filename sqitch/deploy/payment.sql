-- Deploy ftlc:payment to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.payment(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES ftlc.users(id) NOT NULL,
    status ftlc.payment_status_type DEFAULT 'paid' NOT NULL,
    create_on TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    snapshot JSONB NOT NULL,
    charge JSONB NOT NULL,
    refund JSONB
);

COMMIT;
