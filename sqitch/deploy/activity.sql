-- Deploy ftlc:activities to pg
-- requires: activity_catagories

BEGIN;

CREATE TABLE ftlc.activity(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    category UUID REFERENCES ftlc.category(id) NOT NULL,
    url CITEXT NOT NULL,
    name CITEXT NOT NULL,
    description CITEXT NOT NULL,
    public_display BOOLEAN DEFAULT true,
    archive BOOLEAN DEFAULT false
);

COMMIT;
