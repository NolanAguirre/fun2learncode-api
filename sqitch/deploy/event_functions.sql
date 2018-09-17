-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;

CREATE FUNCTION ftlc.events_by_student(student_id UUID) RETURNS SETOF ftlc.events AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.events WHERE id IN (SELECT DISTINCT event FROM ftlc.event_dates WHERE id IN (SELECT event_date FROM ftlc.event_registration WHERE student = student_id)) ORDER BY event_type ASC;
    END;
$$ LANGUAGE PLPGSQL STABLE;

CREATE FUNCTION ftlc.event_months_by_student(student_id UUID) RETURNS SETOF ftlc.event_months AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.event_months WHERE ftlc.event_dates.event IN (SELECT DISTINCT event FROM ftlc.event_dates WHERE id IN (SELECT event_date FROM ftlc.event_registration WHERE student = student_id)) ORDER BY event_type ASC;
    END;
$$ LANGUAGE PLPGSQL STABLE;

COMMIT;
