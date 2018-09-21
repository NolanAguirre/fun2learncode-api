-- Deploy ftlc:date_group to pg

BEGIN;

CREATE TABLE ftlc.date_group(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4()
);

COMMIT;
