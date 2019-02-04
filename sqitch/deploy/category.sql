-- Deploy ftlc:activity_catagories to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.category(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name CITEXT UNIQUE,
    description CITEXT
);

COMMIT;
