-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;

-- activities
GRANT SELECT ON ftlc.activities TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- activity_catagories
GRANT SELECT ON ftlc.activity_catagories TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- address
GRANT SELECT ON ftlc.address TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event dates
GRANT SELECT ON ftlc.event_dates TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event months
GRANT SELECT ON ftlc.event_months TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- months
GRANT SELECT ON ftlc.months TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_logs
GRANT SELECT ON ftlc.event_logs TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_prerequisites
GRANT SELECT ON ftlc.event_prerequisites TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_registration
GRANT SELECT ON ftlc.event_registration TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- events
GRANT SELECT ON ftlc.events TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- students
GRANT SELECT ON ftlc.students TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- users
GRANT SELECT ON ftlc.users TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
COMMIT;
