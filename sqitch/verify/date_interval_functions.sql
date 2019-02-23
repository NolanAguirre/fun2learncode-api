-- Verify ftlc:date_interval_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.make_date_interval(TIMESTAMP, TIMESTAMP, UUID)'::regprocedure);

SELECT pg_get_functiondef('ftlc.remove_date_interval(TIMESTAMP, TIMESTAMP, UUID)'::regprocedure);

ROLLBACK;
