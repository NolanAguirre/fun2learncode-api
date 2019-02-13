-- Deploy ftlc:date_group to pg

BEGIN;

CREATE TABLE ftlc.event(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    activity UUID REFERENCES ftlc.activity(id) NOT NULL,
    address UUID REFERENCES ftlc.address(id) NOT NULL,
    open_registration TIMESTAMP NOT NULL,
    close_registration TIMESTAMP NOT NULL,
    capacity INTEGER NOT NULL,
    seats_left INTEGER NOT NULL,
    name TEXT NOT NULL,
    price FLOAT NOT NULL,
    show_calendar BOOLEAN DEFAULT true,
    archive BOOLEAN DEFAULT false
);

COMMIT;
