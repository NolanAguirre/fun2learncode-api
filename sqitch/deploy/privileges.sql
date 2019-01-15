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
-- event_logs
GRANT SELECT ON ftlc.event_logs TO ftlc_employee, ftlc_user;
GRANT INSERT, UPDATE ON ftlc.event_logs TO ftlc_employee;
-- event_prerequisites
GRANT SELECT ON ftlc.activity_prerequisites TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.activity_prerequisites TO ftlc_admin_group;
-- event_registration
GRANT SELECT ON ftlc.event_registration TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.event_registration TO ftlc_admin;
-- events
GRANT SELECT ON ftlc.events TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.events TO ftlc_admin_group;
-- students
GRANT SELECT ON ftlc.students TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.students TO ftlc_admin_group, ftlc_user;
-- users
GRANT SELECT ON ftlc.users TO ftlc_employee, ftlc_user;
-- add_ons
GRANT SELECT ON ftlc.add_ons TO ftlc_admin_group, ftlc_user;
GRANT INSERT, UPDATE ON ftlc.add_ons TO ftlc_admin_group;
-- add_on_join
GRANT SELECT ON ftlc.add_on_join TO ftlc_admin_group, ftlc_user;
GRANT INSERT, DELETE ON ftlc.add_on_join TO ftlc_admin_group;
-- attendance
GRANT SELECT ON ftlc.attendance TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.attendance TO ftlc_attendant;
-- payment
GRANT SELECT ON ftlc.payment TO ftlc_admin_group, ftlc_user;

COMMIT;
