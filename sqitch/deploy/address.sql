-- Deploy ftlc:address to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.address(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    street CITEXT,
    city CITEXT,
    county CITEXT,
    zipcode VARCHAR(5),
    state CITEXT,
    country CITEXT,
    alias CITEXT,
    url CITEXT
);

COMMIT;
