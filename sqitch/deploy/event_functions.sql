-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;

CREATE FUNCTION ftlc.check_prerequisite(UUID, UUID) RETURNS BOOLEAN AS $$
    DECLARE
        prerequisites UUID[];
        student_events UUID[];
    BEGIN
        IF (SELECT EXISTS(SELECT * FROM ftlc.registration_override WHERE event = $1 AND student = $2 AND valid_end > NOW())) THEN
            RETURN TRUE;
        END IF;
        SELECT array(
            SELECT prerequisite FROM ftlc.activity_prerequisite WHERE activity =
                (SELECT activity FROM ftlc.event WHERE id = $1)) INTO prerequisites;
        SELECT array(
            SELECT DISTINCT activity FROM ftlc.event WHERE close_registration < (SELECT close_registration FROM ftlc.event WHERE id = $1) and id IN
                (SELECT event from ftlc.event_registration WHERE student = $2)) INTO student_events;
        RETURN student_events @> prerequisites;
    END;
$$ LANGUAGE PLPGSQL STABLE SECURITY DEFINER;

CREATE FUNCTION ftlc.check_registration(UUID, UUID) RETURNS BOOLEAN AS $$
    SELECT NOT EXISTS(SELECT 1 FROM ftlc.event_registration WHERE event = $1 AND student = $2);
$$ LANGUAGE SQL STABLE;

CREATE FUNCTION ftlc.check_time (UUID, UUID) RETURNS BOOLEAN AS $$
    DECLARE
        dates UUID[];
    BEGIN
        SELECT array(
            SELECT DISTINCT date_interval FROM ftlc.date_join WHERE event IN (
                SELECT event FROM ftlc.event_registration WHERE student = $2)) INTO dates;
        RETURN NOT EXISTS(SELECT 1 FROM ftlc.date_interval WHERE id IN (SELECT date_interval FROM ftlc.date_join WHERE event = $1) AND id = ANY(dates));
    END;
$$ LANGUAGE PLPGSQL STABLE;
-- check time is not fool proof, it only finds events with the exact same timeslot, not that overlap, might be removed or improved later

CREATE FUNCTION ftlc.event_in_dates(TIMESTAMPTZ, TIMESTAMPTZ) RETURNS SETOF ftlc.event AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.event WHERE id IN
            (SELECT DISTINCT event FROM ftlc.date_join WHERE date_interval IN
                (SELECT id FROM ftlc.date_interval WHERE start > $1 AND start < $2));
    END;
$$ LANGUAGE PLPGSQL STABLE;
COMMIT;
