-- Deploy ftlc:date_group to pg

BEGIN;

CREATE TABLE ftlc.date_group(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.events(id),
    address UUID REFERENCES ftlc.address(id),
    open_registration TIMESTAMP,
    close_registration TIMESTAMP,
    capacity INTEGER,
    name TEXT,
    price FLOAT,
    archive BOOLEAN DEFAULT false
);

COMMIT;
