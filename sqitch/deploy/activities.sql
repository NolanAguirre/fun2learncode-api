-- Deploy ftlc:activities to pg
-- requires: activity_catagories

BEGIN;

CREATE TABLE ftlc.activities(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type UUID REFERENCES ftlc.activity_catagories(id),
    name CITEXT,
    description CITEXT,
    public_display BOOLEAN DEFAULT TRUE
);

COMMIT;
