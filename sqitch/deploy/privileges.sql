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
-- event_logs
-- event_prerequisites
GRANT SELECT ON ftlc.event_prerequisites TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_registration
-- events
GRANT SELECT ON ftlc.events TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- students
-- users
COMMIT;
