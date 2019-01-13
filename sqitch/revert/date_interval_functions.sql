-- Revert ftlc:date_interval_functions from pg

BEGIN;

DROP FUNCTION ftlc.make_date_interval(TIMESTAMP, TIMESTAMP, UUID);

DROP FUNCTION ftlc.remove_date_interval(TIMESTAMP, TIMESTAMP, UUID);

COMMIT;
