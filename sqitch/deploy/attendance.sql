-- Deploy ftlc:attendance to pg
-- requires: date_interval
-- requires: users

BEGIN;

CREATE TABLE ftlc.attendance(
    id UUID DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.student(id) NOT NULL,
    date_interval UUID REFERENCES ftlc.date_interval(id) NOT NULL,
    event UUID REFERENCES ftlc.event(id) NOT NULL,
    present BOOLEAN NOT NULL,
    check_in_time TIMESTAMP DEFAULT NOW(),
    CONSTRAINT unique_attendance PRIMARY KEY (student, date_interval)
);


COMMIT;
