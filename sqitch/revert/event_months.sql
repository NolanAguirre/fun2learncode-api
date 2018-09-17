-- Revert ftlc:event_months from pg

BEGIN;

DROP FUNCTION ftlc.add_month();

DROP TABLE ftlc.event_months;

DROP TABLE ftlc.months;

COMMIT;
