-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;

CREATE FUNCTION ftlc.events_by_student(student_id UUID) RETURNS SETOF ftlc.events AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.events WHERE id IN (SELECT DISTINCT event FROM ftlc.event_dates WHERE id IN (SELECT event_date FROM ftlc.event_registration WHERE student = student_id)) ORDER BY event_type ASC;
    END;
$$ LANGUAGE PLPGSQL STABLE;

CREATE OR REPLACE FUNCTION ftlc.months_by_student(student_id UUID) RETURNS SETOF ftlc.months AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.months where id IN (
            SELECT month FROM ftlc.event_months WHERE event in(
                select id FROM ftlc.events WHERE id IN (
                    SELECT DISTINCT event FROM ftlc.event_dates WHERE id IN (
                        SELECT event_date FROM ftlc.event_registration WHERE student = student_id))))
        ORDER BY month ASC;
    END;
$$ LANGUAGE PLPGSQL STABLE;

COMMIT;
