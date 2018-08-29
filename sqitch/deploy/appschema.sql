-- Deploy ftlc:appschema to pg

BEGIN;

CREATE SCHEMA ftlc;

CREATE SCHEMA ftlc_private;

COMMIT;
