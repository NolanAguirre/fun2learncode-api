-- Verify ftlc:date_interval_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.make_date_interval(TIMESTAMPTZ, TIMESTAMPTZ, UUID)'::regprocedure);

SELECT pg_get_functiondef('ftlc.remove_date_interval(TIMESTAMPTZ, TIMESTAMPTZ, UUID)'::regprocedure);

ROLLBACK;
