-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;

CREATE FUNCTION ftlc.events_by_student(student_id UUID) RETURNS SETOF ftlc.events AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.events WHERE id IN (SELECT DISTINCT event FROM ftlc.event_dates WHERE id IN (SELECT event_date FROM ftlc.event_registration WHERE student = student_id));
    END;
$$ LANGUAGE PLPGSQL STABLE;

COMMIT;
