-- Deploy ftlc:event_request_functions to pg
-- requires: event_request

BEGIN;

CREATE FUNCTION ftlc.event_by_token(TEXT) RETURNS ftlc.event AS $$
    SELECT * FROM ftlc.event WHERE id =
        (SELECT event FROM ftlc.event_request WHERE access_token = $1 AND
            ((status = 'accepted' AND user_id = ftlc.get_id())
            OR
            (SELECT EXISTS (SELECT * FROM ftlc.payment WHERE user_id = (SELECT user_id FROM ftlc.event_request WHERE access_token = $1) AND id IN (SELECT DISTINCT payment FROM ftlc.event_registration WHERE event = (SELECT event FROM ftlc.event_request WHERE access_token = $1) AND registered_by = (SELECT user_id FROM ftlc.event_request WHERE access_token = $1))))));
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

--line 11 checks if the event has been paid for by the person who requested the event.
COMMIT;
