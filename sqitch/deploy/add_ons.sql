-- Deploy ftlc:add_ons to pg
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.add_ons(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name CITEXT,
    description CITECT,
    price INTEGER
);

COMMIT;
