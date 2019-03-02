-- Deploy ftlc:add_ons to pg
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.add_on(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name CITEXT NOT NULL,
    description CITEXT NOT NULL,
    price FLOAT NOT NULL
);

COMMIT;
