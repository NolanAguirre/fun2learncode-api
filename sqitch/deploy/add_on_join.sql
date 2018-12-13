-- Deploy ftlc:add_on_join to pg
-- requires: date_group
-- requires: add_ons

BEGIN;

CREATE TABLE ftlc.add_on_join(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    date_group UUID REFERENCES ftlc.date_group(id),
    add_on UUID REFERENCES ftlc.add_ons(id)
);

COMMIT;
