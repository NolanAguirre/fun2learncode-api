-- Deploy ftlc:event_request to pg
-- requires: event
-- requires: users

BEGIN;

CREATE TABLE ftlc.event_request(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES ftlc.users(id) NOT NULL,
    event UUID REFERENCES ftlc.event(id),
    created_on TIMESTAMP DEFAULT NOW(),
    desired_location CITEXT NOT NULL,
    pay_in_full BOOLEAN NOT NULL,
    desired_cost FLOAT NOT NULL,
    desired_capacity INTEGER NOT NULL,
    description CITEXT NOT NULL,
    access_token TEXT UNIQUE NOT NULL,
    status ftlc.request_type DEFAULT 'pending'
);

COMMIT;
