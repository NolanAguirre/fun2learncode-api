-- Deploy ftlc:student_waiver to pg
-- requires: student

BEGIN;

CREATE TABLE ftlc.student_waiver(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    student UUID REFERENCES ftlc.student(id),
    allergies CITEXT,
    primary_care CITEXT,
    primary_care_phone VARCHAR(10),
    emergency_phone VARCHAR(10),
    pickup_one CITEXT,
    pickup_two CITEXT,
    pickup_three CITEXT,
    other CITEXT

);

COMMIT;
