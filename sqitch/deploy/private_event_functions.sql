-- Deploy ftlc:private_event_functions to pg
-- requires: private_event

BEGIN;

CREATE FUNCTION ftlc.event_by_hash(TEXT) RETURNS ftlc.event AS $$
    SELECT * FROM ftlc.event WHERE id = (SELECT id FROM ftlc.private_event WHERE hash = $1);
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

COMMIT;
