-- Deploy ftlc:payment to pg
-- requires: users

BEGIN;

CREATE TABLE ftlc.payment(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES ftlc.users(id),
    status ftlc.payment_status_type,
    create_on TIMESTAMP DEFAULT NOW(),
    snapshot jsonb
);

COMMIT;
