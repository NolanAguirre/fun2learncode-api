-- Deploy ftlc:roles to pg

BEGIN;

CREATE ROLE ftlc_roles LOGIN PASSWORD 'potato';

CREATE ROLE ftlc_admin_group;

CREATE ROLE ftlc_employee;

CREATE ROLE ftlc_owner;

GRANT ftlc_admin_group to ftlc_owner;

CREATE ROLE ftlc_admin;

GRANT ftlc_admin_group to ftlc_admin;

CREATE ROLE ftlc_lead_instructor;

GRANT ftlc_admin_group to ftlc_lead_instructor;

GRANT ftlc_employee to ftlc_admin_group;

CREATE ROLE ftlc_attendant;

GRANT ftlc_employee to ftlc_attendant;

CREATE ROLE ftlc_instructor;

GRANT ftlc_employee TO ftlc_instructor;

GRANT ftlc_roles TO ftlc_employee;

CREATE ROLE ftlc_user;

GRANT ftlc_roles TO ftlc_user;

CREATE ROLE ftlc_anonymous;

GRANT ftlc_roles TO ftlc_anonymous;

COMMIT;
