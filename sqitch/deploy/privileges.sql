-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;

COMMIT;
