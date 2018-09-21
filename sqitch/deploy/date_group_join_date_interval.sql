-- Deploy ftlc:date_group_join_date_interval to pg
-- requires: date_group
-- requires: date_interval

BEGIN;

CREATE TABLE ftlc.date_group_join_date_interval(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    date_group UUID REFERENCES ftlc.date_group(id),
    date_interval UUID REFERENCES ftlc.date_interval(ID)
);

COMMIT;
