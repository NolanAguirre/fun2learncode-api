-- Deploy ftlc:activity_catagories to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.activity_catagories(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name CITEXT UNIQUE,
    description CITEXT
);

COMMIT;
