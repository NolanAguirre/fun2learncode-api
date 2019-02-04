-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_roles;

-- activity
GRANT SELECT ON ftlc.activity TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.activity TO ftlc_admin_group;
-- category
GRANT SELECT ON ftlc.category TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.category TO ftlc_admin_group;
-- address
GRANT SELECT ON ftlc.address TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.address TO ftlc_admin_group;
-- date_interval
GRANT SELECT ON ftlc.date_interval TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.date_interval TO ftlc_admin_group;
-- date_join join
GRANT SELECT ON ftlc.date_join TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.date_join TO ftlc_admin_group;
-- event
GRANT SELECT ON ftlc.event TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.event TO ftlc_admin_group;
-- event_log
GRANT SELECT ON ftlc.event_log TO ftlc_employee, ftlc_user;
GRANT INSERT, UPDATE ON ftlc.event_log TO ftlc_employee;
-- event_prerequisite
GRANT SELECT ON ftlc.activity_prerequisite TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.activity_prerequisite TO ftlc_admin_group;
-- event_registration
GRANT SELECT ON ftlc.event_registration TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.event_registration TO ftlc_admin;
-- event
GRANT SELECT ON ftlc.event TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.event TO ftlc_admin_group;
-- student
GRANT SELECT ON ftlc.student TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.student TO ftlc_admin_group, ftlc_user;
-- users
GRANT SELECT ON ftlc.users TO ftlc_employee, ftlc_user;
GRANT UPDATE (role) ON ftlc.users TO ftlc_owner;
GRANT UPDATE (email) ON ftlc.users TO ftlc_user;
-- add_on
GRANT SELECT ON ftlc.add_on TO ftlc_admin_group, ftlc_user;
GRANT INSERT, UPDATE ON ftlc.add_on TO ftlc_admin_group;
-- add_on_join
GRANT SELECT ON ftlc.add_on_join TO ftlc_admin_group, ftlc_user;
GRANT INSERT, DELETE ON ftlc.add_on_join TO ftlc_admin_group;
-- attendance
GRANT SELECT ON ftlc.attendance TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.attendance TO ftlc_attendant;
-- payment
GRANT SELECT ON ftlc.payment TO ftlc_admin_group, ftlc_user;
-- refund_request
GRANT SELECT ON ftlc.refund_request TO ftlc_admin_group, ftlc_user;
GRANT INSERT(user_id, payment, reason) ON ftlc.refund_request TO ftlc_user;
-- news_letter
GRANT INSERT, DELETE ON ftlc.news_letter TO ftlc_roles;
GRANT SELECT ON ftlc.news_letter TO ftlc_admin_group;
-- announcement
GRANT SELECT ON ftlc.announcement TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.announcement TO ftlc_admin_group;
-- event_request
GRANT INSERT, SELECT ON ftlc.event_request TO ftlc_user;
GRANT UPDATE, SELECT ON ftlc.event_request TO ftlc_admin_group;
-- news_letter
GRANT INSERT ON ftlc.news_letter TO ftlc_roles;
GRANT SELECT ON ftlc.news_letter TO ftlc_admin_group;
-- promo codes
GRANT INSERT ON ftlc.promo_code TO ftlc_admin_group;
GRANT UPDATE(archive, disabled) ON ftlc.promo_code TO ftlc_admin_group;
GRANT SELECT ON ftlc.promo_code to ftlc_roles; --this needs to be changed to ftlc_admin_group
COMMIT;
