-- Deploy ftlc:attendance to pg
-- requires: date_interval
-- requires: users

BEGIN;

CREATE TABLE ftlc.attendance(
    id UUID DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.student(id),
    date_interval UUID REFERENCES ftlc.date_interval(id),
    event UUID REFERENCES ftlc.event(id),
    present BOOLEAN,
    check_in_time TIMESTAMP DEFAULT NOW(),
    CONSTRAINT unique_attendance PRIMARY KEY (student, date_interval)
);


COMMIT;
