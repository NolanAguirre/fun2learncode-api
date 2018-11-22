-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;

-- activities
GRANT SELECT ON ftlc.activities TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.activities TO ftlc_instructor; --this will need to be owner
GRANT UPDATE ON ftlc.activities TO ftlc_instructor; --this will need to be owner
-- activity_catagories
GRANT SELECT ON ftlc.activity_catagories TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- address
GRANT SELECT ON ftlc.address TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- date_interval
GRANT SELECT ON ftlc.date_interval TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.date_interval TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;--this will need to be owner
GRANT DELETE ON ftlc.date_interval TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- dates_join join
GRANT SELECT ON ftlc.dates_join TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.dates_join TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;--this will need to be owner
GRANT DELETE ON ftlc.dates_join TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- date_group
GRANT SELECT ON ftlc.date_group TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.date_group TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student; --this will need to be owner
-- event months
GRANT SELECT ON ftlc.event_months TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- months
GRANT SELECT ON ftlc.months TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_logs
GRANT SELECT ON ftlc.event_logs TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_prerequisites
GRANT SELECT ON ftlc.event_prerequisites TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.event_prerequisites TO ftlc_instructor; --this will need to be owner
-- event_registration
GRANT SELECT ON ftlc.event_registration TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- events
GRANT SELECT ON ftlc.events TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.events TO ftlc_instructor;
-- students
GRANT SELECT ON ftlc.students TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- users
GRANT SELECT ON ftlc.users TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
COMMIT;
