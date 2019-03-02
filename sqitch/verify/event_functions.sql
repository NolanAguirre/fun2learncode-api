-- Verify ftlc:event_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.check_registration(UUID, UUID)'::regprocedure);

SELECT pg_get_functiondef('ftlc.check_time(UUID, UUID)'::regprocedure);

SELECT pg_get_functiondef('ftlc.check_prerequisite(UUID, UUID)'::regprocedure);

SELECT pg_get_functiondef('ftlc.event_in_dates(TIMESTAMPTZ, TIMESTAMPTZ)'::regprocedure);

ROLLBACK;
