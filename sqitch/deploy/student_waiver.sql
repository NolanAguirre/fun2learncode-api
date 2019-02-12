-- Deploy ftlc:student_waiver to pg
-- requires: student

BEGIN;

CREATE TABLE ftlc.student_waiver(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.student(id),
    primary_care CITEXT,
    primary_care_phone VARCHAR(14),
    emergency_phone VARCHAR(14),
    pickup_one CITEXT,
    pickup_two CITEXT,
    other CITEXT,
    created_on TIMESTAMP DEFAULT NOW()
);

COMMIT;
