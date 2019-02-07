-- Deploy ftlc:refund_request to pg
-- requires: payment

BEGIN;

CREATE TABLE ftlc.refund_request(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    payment UUID REFERENCES ftlc.payment(id) NOT NULL,
    user_id UUID REFERENCES ftlc.users(id) NOT NULL,
    created_on TIMESTAMP DEFAULT NOW() ,
    reason CITEXT NOT NULL,
    granted_reason CITEXT,
    amount_refunded FLOAT,
    status ftlc.request_type DEFAULT 'pending',
    CONSTRAINT one_request UNIQUE (payment, user_id)
);

COMMIT;
