-- Deploy ftlc:event_dates to pg
-- requires: month_event

BEGIN;

CREATE TABLE ftlc.event_dates(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    event UUID REFERENCES ftlc.events(id),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

CREATE TRIGGER update_event_month AFTER INSERT ON ftlc.event_dates FOR EACH ROW EXECUTE PROCEDURE ftlc.add_month();

COMMIT;
