-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_roles;

-- activity prerequisite
GRANT SELECT ON ftlc.activity_prerequisite TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.activity_prerequisite TO ftlc_admin_group;

-- activity
GRANT SELECT ON ftlc.activity TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.activity TO ftlc_admin_group;

-- add_on_join
GRANT SELECT ON ftlc.add_on_join TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.add_on_join TO ftlc_admin_group;

-- add_on
GRANT SELECT ON ftlc.add_on TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.add_on TO ftlc_admin_group;

-- address
GRANT SELECT ON ftlc.address TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.address TO ftlc_admin_group;

-- announcement
GRANT SELECT ON ftlc.announcement TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.announcement TO ftlc_admin_group;
GRANT USAGE, SELECT ON SEQUENCE ftlc.announcement_id_seq TO ftlc_roles;

-- attendance RLS
GRANT SELECT ON ftlc.attendance TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.attendance TO ftlc_attendant;

-- category
GRANT SELECT ON ftlc.category TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.category TO ftlc_admin_group;

-- date_interval
GRANT SELECT ON ftlc.date_interval TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.date_interval TO ftlc_admin_group;

-- date join
GRANT SELECT ON ftlc.date_join TO ftlc_roles;
GRANT INSERT, DELETE ON ftlc.date_join TO ftlc_admin_group;

-- event_log RLS
GRANT SELECT ON ftlc.event_log TO ftlc_employee, ftlc_user;
GRANT INSERT, UPDATE ON ftlc.event_log TO ftlc_employee;

-- event_registration RLS
GRANT SELECT ON ftlc.event_registration TO ftlc_employee, ftlc_user;
GRANT INSERT, DELETE ON ftlc.event_registration TO ftlc_admin;

-- event_request still testing RLS
GRANT INSERT, SELECT ON ftlc.event_request TO ftlc_user;
GRANT UPDATE, SELECT ON ftlc.event_request TO ftlc_admin_group;

-- event
GRANT SELECT ON ftlc.event TO ftlc_roles;
GRANT INSERT, UPDATE ON ftlc.event TO ftlc_admin_group;

-- news_letter
GRANT INSERT, DELETE ON ftlc.news_letter TO ftlc_roles;
GRANT SELECT ON ftlc.news_letter TO ftlc_admin_group;

-- payment RLS
GRANT SELECT ON ftlc.payment TO ftlc_admin_group, ftlc_user;

-- promo code use
GRANT SELECT ON ftlc.promo_code_use to ftlc_admin_group;

-- promo codes
GRANT INSERT ON ftlc.promo_code TO ftlc_admin_group;
GRANT UPDATE(archive, disabled) ON ftlc.promo_code TO ftlc_admin_group;
GRANT SELECT ON ftlc.promo_code to ftlc_roles; --this needs to be changed to ftlc_admin_group

-- refund_request RLS
GRANT SELECT ON ftlc.refund_request TO ftlc_admin_group, ftlc_user;
GRANT INSERT(user_id, payment, reason) ON ftlc.refund_request TO ftlc_user;
GRANT UPDATE(status, amount_refunded, granted_reason) ON ftlc.refund_request TO ftlc_owner;

-- registration override
GRANT SELECT, UPDATE, INSERT ON ftlc.registration_override TO ftlc_admin_group;

-- student RLS
GRANT SELECT ON ftlc.student TO ftlc_employee, ftlc_user;
GRANT INSERT ON ftlc.student TO ftlc_user;

-- transaction state
GRANT SELECT, UPDATE ON ftlc.transaction_state TO ftlc_admin_group;

-- users RLS
GRANT SELECT ON ftlc.users TO ftlc_employee, ftlc_user;
GRANT UPDATE (role) ON ftlc.users TO ftlc_owner;
GRANT UPDATE (email) ON ftlc.users TO ftlc_user;

COMMIT;
