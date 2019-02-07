-- Deploy ftlc:address to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.address(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    street CITEXT NOT NULL,
    city CITEXT NOT NULL,
    county CITEXT NOT NULL,
    zipcode VARCHAR(5) NOT NULL,
    state CITEXT NOT NULL,
    country CITEXT NOT NULL,
    alias CITEXT NOT NULL,
    archive BOOLEAN DEFAULT false
);

COMMIT;
