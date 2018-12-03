-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_roles;

-- activities
GRANT SELECT ON ftlc.activities TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.activities TO ftlc_admin_group;
-- activity_catagories
GRANT SELECT ON ftlc.activity_catagories TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.activity_catagories TO ftlc_admin_group;
-- address
GRANT SELECT ON ftlc.address TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.address TO ftlc_admin_group;
-- date_interval
GRANT SELECT ON ftlc.date_interval TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.date_interval TO ftlc_admin_group;
-- dates_join join
GRANT SELECT ON ftlc.dates_join TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.dates_join TO ftlc_admin_group;
-- date_group
GRANT SELECT ON ftlc.date_group TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.date_group TO ftlc_admin_group;
-- event months
GRANT SELECT ON ftlc.event_months TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- months
GRANT SELECT ON ftlc.months TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
-- event_logs
GRANT SELECT ON ftlc.event_logs TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student, ftlc_lead_instructor, ftlc_admin;
-- event_prerequisites
GRANT SELECT ON ftlc.event_prerequisites TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.event_prerequisites TO ftlc_admin_group;
-- event_registration
GRANT SELECT ON ftlc.event_registration TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT ON ftlc.event_registration TO ftlc_user, ftlc_owner, ftlc_admin;
-- events
GRANT SELECT ON ftlc.events TO ftlc_user, ftlc_anonymous, ftlc_instructor, ftlc_owner, ftlc_student;
GRANT INSERT, UPDATE ON ftlc.events TO ftlc_admin_group;
-- students
GRANT SELECT ON ftlc.students TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
-- users
GRANT SELECT ON ftlc.users TO ftlc_user, ftlc_instructor, ftlc_owner, ftlc_student;
COMMIT;
