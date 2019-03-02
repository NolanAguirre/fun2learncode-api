-- Revert ftlc:students from pg

BEGIN;

DROP TABLE ftlc.student;

COMMIT;
