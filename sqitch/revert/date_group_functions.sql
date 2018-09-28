-- Revert ftlc:date_group_functions from pg

BEGIN;

DROP FUNCTION ftlc.make_date_group(TIMESTAMP[]);

DROP FUNCTION ftlc.date_group_exists(TIMESTAMP[][]);

DROP FUNCTION ftlc.date_exists_in_group(TIMESTAMP, TIMESTAMP, UUID);

DROP FUNCTION ftlc.date_exists(TIMESTAMP, TIMESTAMP);

COMMIT;
