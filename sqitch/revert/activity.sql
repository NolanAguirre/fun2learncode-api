-- Revert ftlc:activities from pg

BEGIN;

DROP TABLE ftlc.activity;

COMMIT;
