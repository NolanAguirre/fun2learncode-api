-- Deploy ftlc:event_dates to pg
-- requires: month_event

BEGIN;

CREATE TABLE ftlc.date_interval(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    start TIMESTAMP,
    "end" TIMESTAMP
);

-- CREATE TRIGGER update_event_month AFTER INSERT ON ftlc.event_dates FOR EACH ROW EXECUTE PROCEDURE ftlc.add_month();

COMMIT;
