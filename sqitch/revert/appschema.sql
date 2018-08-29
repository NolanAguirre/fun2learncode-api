-- Revert ftlc:appschema from pg

BEGIN;

DROP SCHEMA ftlc_private;

DROP SCHEMA ftlc;

COMMIT;
