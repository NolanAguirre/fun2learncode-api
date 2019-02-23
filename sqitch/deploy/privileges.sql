-- Deploy ftlc:privileges to pg

BEGIN;

GRANT USAGE ON SCHEMA ftlc TO ftlc_roles;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ftlc TO ftlc_admin_group;

-- activity prerequisite
GRANT SELECT ON ftlc.activity_prerequisite TO ftlc_roles;

-- activity
GRANT SELECT ON ftlc.activity TO ftlc_roles;

-- add_on_join
GRANT SELECT ON ftlc.add_on_join TO ftlc_roles;

-- add_on
GRANT SELECT ON ftlc.add_on TO ftlc_roles;

-- address
GRANT SELECT ON ftlc.address TO ftlc_roles;

-- announcement
GRANT SELECT ON ftlc.announcement TO ftlc_roles;
GRANT USAGE, SELECT ON SEQUENCE ftlc.announcement_id_seq TO ftlc_roles;

-- attendance RLS
GRANT SELECT ON ftlc.attendance TO ftlc_instructor, ftlc_attendant, ftlc_user;
GRANT INSERT ON ftlc.attendance TO ftlc_attendant;

-- category
GRANT SELECT ON ftlc.category TO ftlc_roles;

-- date_interval
GRANT SELECT ON ftlc.date_interval TO ftlc_roles;

-- date join
GRANT SELECT ON ftlc.date_join TO ftlc_roles;

-- event_log RLS
GRANT SELECT ON ftlc.event_log TO ftlc_instructor, ftlc_user;
GRANT INSERT ON ftlc.event_log TO ftlc_instructor, ftlc_attendant;

-- event_registration RLS
GRANT SELECT ON ftlc.event_registration TO ftlc_instructor, ftlc_attendant, ftlc_user;

-- event_request still testing RLS
GRANT INSERT (information), SELECT ON ftlc.event_request TO ftlc_user;

-- event
GRANT SELECT ON ftlc.event TO ftlc_roles;

-- news_letter
GRANT INSERT ON ftlc.news_letter TO ftlc_roles;

-- payment RLS
GRANT SELECT ON ftlc.payment TO ftlc_user;

-- promo code use
-- handled by rest api transaction processing

-- promo codes
-- handled by rest api transaction processing

-- refund_request RLS
GRANT SELECT ON ftlc.refund_request TO ftlc_user;
GRANT INSERT(payment, reason) ON ftlc.refund_request TO ftlc_user;

-- registration override
-- handed on rest api, created by owners and admins

--student waiver RLS
GRANT SELECT ON ftlc.student_waiver TO ftlc_user, ftlc_instructor;
GRANT INSERT ON ftlc.student_waiver TO ftlc_user;

-- student RLS
GRANT SELECT ON ftlc.student TO ftlc_instructor, ftlc_attendant, ftlc_user;
GRANT INSERT (first_name, last_name, date_of_birth) ON ftlc.student TO ftlc_user;

-- transaction state
-- handled by rest api, tracks transaction state

-- users RLS
GRANT SELECT ON ftlc.users TO ftlc_instructor, ftlc_user;
GRANT UPDATE (email) ON ftlc.users TO ftlc_user;

COMMIT;
