-- Deploy ftlc:event_request_functions to pg
-- requires: event_request

BEGIN;

CREATE FUNCTION ftlc.event_by_token(TEXT) RETURNS ftlc.event AS $$
    SELECT * FROM ftlc.event WHERE id = (SELECT event FROM ftlc.event_request WHERE access_token = $1 AND (status = 'accepted' OR  (status = 'pending' AND user_id = ftlc.get_id())));
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

COMMIT;
