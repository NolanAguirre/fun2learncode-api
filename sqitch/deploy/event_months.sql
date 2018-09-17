-- Deploy ftlc:event_months to pg
-- requires: events

BEGIN;

CREATE TABLE ftlc.event_months(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.events(id),
    month TIMESTAMP
);

CREATE FUNCTION ftlc.add_month() RETURNS TRIGGER AS $add_month$
    BEGIN
        IF(SELECT NOT EXISTS(SELECT 1 FROM ftlc.event_months WHERE event = NEW.event and date_trunc('month', NEW.start_time) = date_trunc('month', month))) THEN
            INSERT INTO ftlc.event_months (event, month) VALUES (NEW.event, date_trunc('month', NEW.start_time));
        END IF;
        RETURN NEW;
    END;
$add_month$ LANGUAGE PLPGSQL;

COMMIT;
