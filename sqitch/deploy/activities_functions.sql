-- Deploy ftlc:activities_functions to pg
-- requires: activities
-- requires: event_prerequisites

BEGIN;

CREATE FUNCTION ftlc.make_activity(UUID, CITEXT, CITEXT, UUID DEFAULT null) RETURNS VOID AS $$
    BEGIN
        INSERT INTO ftlc.activities (type, name, description) VALUES ($1, $2, $3);
        IF($4 != null) THEN
            INSERT INTO ftlc.event_prerequisites(event, prerequisite) VALUES($1, $4);
        END IF; 
    END;
$$ LANGUAGE PLPGSQL STRICT;

COMMIT;
