-- Deploy ftlc:activities_functions to pg
-- requires: activities
-- requires: event_prerequisites

BEGIN;

CREATE OR REPLACE FUNCTION ftlc.make_activity(UUID, CITEXT, CITEXT, UUID DEFAULT '00000000-0000-0000-0000-000000000000') RETURNS VOID AS $$
    BEGIN
        INSERT INTO ftlc.activities (type, name, description) VALUES ($1, $2, $3);
        IF($4 != '00000000-0000-0000-0000-000000000000') THEN
            INSERT INTO ftlc.event_prerequisites(event, prerequisite) VALUES($1, $4);
        END IF;
    END;
$$ LANGUAGE PLPGSQL STRICT;

COMMIT;
