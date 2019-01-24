-- Deploy ftlc:refund_request to pg
-- requires: payment

BEGIN;

CREATE TABLE ftlc.refund_request(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    payment UUID REFERENCES ftlc.payment(id),
    user_id UUID REFERENCES ftlc.users(id),
    created_on TIMESTAMP DEFAULT NOW(),
    reason CITEXT,
    status ftlc.request_type
);

COMMIT;
