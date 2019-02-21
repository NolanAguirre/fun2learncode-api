-- Deploy ftlc:private_event to pg
-- requires: event

BEGIN;

CREATE TABLE ftlc.private_event(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.event(id) NOT NULL,
    hash TEXT UNIQUE NOT NULL CHECK(char_length(hash) > 39)
);

COMMENT ON TABLE ftlc.private_event IS 'Provides hidden hash to access events';

COMMIT;
