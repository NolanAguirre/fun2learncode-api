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

CREATE FUNCTION ftlc.check_prerequisites(UUID, UUID) RETURNS BOOLEAN AS $$
    DECLARE
        prerequisites UUID[];
        student_events UUID[];
    BEGIN
        SELECT array(
            SELECT prerequisite FROM ftlc.activity_prerequisites WHERE activity =
                (SELECT event_type FROM ftlc.events WHERE id =
                    (SELECT event from ftlc.date_group where id = $1))) INTO prerequisites;
        SELECT array(
            SELECT DISTINCT event_type FROM ftlc.events WHERE id IN (
                SELECT DISTINCT event FROM ftlc.date_group WHERE id IN (
                    SELECT date_group from ftlc.event_registration WHERE student = $2
                    AND date_group.close_registration < (SELECT close_registration from ftlc.date_group WHERE id = $1)))) INTO student_events;
        RETURN student_events @> prerequisites;
    END;
$$ LANGUAGE PLPGSQL STABLE;

COMMIT;
