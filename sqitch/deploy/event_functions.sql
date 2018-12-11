-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;

CREATE FUNCTION ftlc.months_by_student(student_id UUID) RETURNS SETOF ftlc.months AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.months where id IN (
            SELECT month FROM ftlc.event_months WHERE event in(
                select id FROM ftlc.events WHERE id IN (
                    SELECT DISTINCT event FROM ftlc.event_dates WHERE id IN (
                        SELECT event_date FROM ftlc.event_registration WHERE student = student_id))))
        ORDER BY month ASC;
    END;
$$ LANGUAGE PLPGSQL STABLE;

CREATE FUNCTION ftlc.check_prerequisites(event_id UUID, student UUID) RETURNS BOOLEAN AS $$
    DECLARE
        activity UUID;
        prerequisites UUID[];
        student_events UUID[];
    BEGIN
        SELECT event_type INTO activity FROM ftlc.events WHERE id = event_id;
        SELECT array(SELECT prerequisite FROM ftlc.event_prerequisites WHERE event = activity) INTO prerequisites;
        SELECT array(SELECT event_type FROM ftlc.activities WHERE id IN(SELECT event FROM ftlc.event_registration WHERE student = student)) INTO student_events;
        RETURN student_events @> prerequisites;
    END;
$$ LANGUAGE PLPGSQL;
COMMIT;
