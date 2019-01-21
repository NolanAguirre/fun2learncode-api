-- Deploy ftlc:event_functions to pg
-- requires: students
-- requires: events

BEGIN;
--
-- CREATE FUNCTION ftlc.get_check_in_options(lastName CITEXT) returns
--
-- $$ LANGUAGE PLPGSQL STABLE;

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

CREATE FUNCTION ftlc.check_registration(UUID, UUID) RETURNS BOOLEAN AS $$
    SELECT EXISTS(SELECT 1 FROM ftlc.event_registration WHERE date_group = $1 AND student = $2);
$$ LANGUAGE SQL STABLE;

CREATE FUNCTION ftlc.check_time (UUID, UUID) RETURNS BOOLEAN AS $$
    DECLARE
        dates UUID[];
    BEGIN
        SELECT array(
            SELECT DISTINCT date_interval FROM ftlc.dates_join WHERE date_group IN (
                SELECT date_group FROM ftlc.event_registration WHERE student = $2)) INTO dates;
        SELECT EXISTS(SELECT 1 FROM ftlc.date_interval WHERE id IN (SELECT date_interval FROM ftlc.dates_join WHERE date_group = $1) AND id @> dates);
    END;
$$ LANGUAGE PLPGSQL STABLE;
-- check time is not fool proof, it only finds events with the exact same timeslot, not that overlap, might be removed or improved later
COMMIT;
