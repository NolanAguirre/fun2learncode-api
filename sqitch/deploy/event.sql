-- Deploy ftlc:date_group to pg

BEGIN;

CREATE TABLE ftlc.event(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    activity UUID REFERENCES ftlc.activity(id),
    address UUID REFERENCES ftlc.address(id),
    open_registration TIMESTAMP,
    close_registration TIMESTAMP,
    capacity INTEGER,
    seats_left INTEGER,
    name TEXT,
    price FLOAT,
    archive BOOLEAN DEFAULT false
);

COMMIT;
