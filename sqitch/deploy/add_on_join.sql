-- Deploy ftlc:add_on_join to pg
-- requires: event
-- requires: add_ons

BEGIN;

CREATE TABLE ftlc.add_on_join(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.event(id) NOT NULL,
    add_on UUID REFERENCES ftlc.add_on(id) NOT NULL
);

COMMIT;
