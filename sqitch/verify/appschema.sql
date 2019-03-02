-- Verify ftlc:appschema on pg

BEGIN;

SELECT 1/COUNT(*) FROM information_schema.schemata WHERE schema_name = 'ftlc';

SELECT 1/COUNT(*) FROM information_schema.schemata WHERE schema_name = 'ftlc_private';

ROLLBACK;
