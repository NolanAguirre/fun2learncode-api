-- Deploy ftlc:event_request to pg
-- requires: event
-- requires: users

BEGIN;

CREATE TABLE ftlc.event_request(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES ftlc.users(id),
    created_on TIMESTAMP DEFAULT NOW(),
    desired_location CITEXT,
    desired_cost FLOAT,
    pay_by_registree BOOLEAN,
    desired_capacity INTEGER,
    description CITEXT,
    access_token TEXT,
    status ftlc.request_type
);

COMMIT;
