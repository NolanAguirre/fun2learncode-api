-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;
--
-- CREATE FUNCTION ftlc.get_check_in_options(lastName CITEXT) returns
--
-- $$ LANGUAGE PLPGSQL STABLE;

CREATE FUNCTION ftlc.check_prerequisite(UUID, UUID) RETURNS BOOLEAN AS $$
    DECLARE
        prerequisites UUID[];
        student_events UUID[];
    BEGIN
        SELECT array(
            SELECT prerequisite FROM ftlc.activity_prerequisite WHERE activity =
                (SELECT category FROM ftlc.event WHERE id = $1)) INTO prerequisites;
        SELECT array(
            SELECT DISTINCT activity FROM ftlc.event WHERE id = $1
                AND close_registration < (SELECT close_registration from ftlc.event WHERE id = $1)) INTO student_events;

        RETURN student_events @> prerequisites;
    END;
$$ LANGUAGE PLPGSQL STABLE;

CREATE FUNCTION ftlc.check_registration(UUID, UUID) RETURNS BOOLEAN AS $$
    SELECT EXISTS(SELECT 1 FROM ftlc.event_registration WHERE event = $1 AND student = $2);
$$ LANGUAGE SQL STABLE;

CREATE FUNCTION ftlc.check_time (UUID, UUID) RETURNS BOOLEAN AS $$
    DECLARE
        dates UUID[];
    BEGIN
        SELECT array(
            SELECT DISTINCT date_interval FROM ftlc.dates_join WHERE date_group IN (
                SELECT date_group FROM ftlc.event_registration WHERE student = $2)) INTO dates;
        RETURN EXISTS(SELECT 1 FROM ftlc.date_interval WHERE id IN (SELECT date_interval FROM ftlc.date_join WHERE date_group = $1) AND id = ANY(dates));
    END;
$$ LANGUAGE PLPGSQL STABLE;
-- check time is not fool proof, it only finds events with the exact same timeslot, not that overlap, might be removed or improved later
COMMIT;
