-- Revert ftlc:students from pg

BEGIN;

DROP TABLE ftlc.students;

COMMIT;
