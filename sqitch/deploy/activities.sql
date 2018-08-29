-- Deploy ftlc:activities to pg
-- requires: types
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.activities(
    id UUID PRIMARY KEY,
    name CITEXT,
    description CITEXT,
    type ftlc.activity_type
);

COMMIT;
