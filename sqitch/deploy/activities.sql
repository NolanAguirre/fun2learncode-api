-- Deploy ftlc:activities to pg
-- requires: types
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.activities(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name CITEXT,
    description CITEXT,
    type ftlc.activity_type
);

COMMIT;
