-- Revert ftlc:student_waiver from pg

BEGIN;

DROP TABLE ftlc.student_waiver;

COMMIT;
