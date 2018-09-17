-- Deploy ftlc:event_months to pg
-- requires: events

BEGIN;

CREATE TABLE ftlc.months(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    month TIMESTAMP
);

CREATE TABLE ftlc.event_months(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.events(id),
    month UUID REFERENCES ftlc.months(id)
);

CREATE FUNCTION ftlc.add_month() RETURNS TRIGGER AS $add_month$
    DECLARE
        start_time TIMESTAMP;
        month_id UUID;
    BEGIN
        start_time := date_trunc('month', NEW.start_time)::TIMESTAMP;
        IF(SELECT NOT EXISTS(SELECT 1 FROM ftlc.months WHERE month = start_time)) THEN
            INSERT INTO ftlc.months (month) VALUES (start_time);
        END IF;
        SELECT into month_id id FROM ftlc.months WHERE month = start_time;
        IF(SELECT NOT EXISTS(SELECT 1 FROM ftlc.event_months WHERE month = month_id and event = NEW.event)) THEN
            INSERT INTO ftlc.event_months (event, month) VALUES (NEW.event, month_id);
        END IF;
        RETURN NEW;
    END;
$add_month$ LANGUAGE PLPGSQL;

COMMIT;
