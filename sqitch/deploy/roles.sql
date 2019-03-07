-- Deploy ftlc:roles to pg

BEGIN;

CREATE ROLE ftlc_roles;

CREATE ROLE ftlc_admin_group;

CREATE ROLE ftlc_owner;

CREATE ROLE ftlc_admin;

CREATE ROLE ftlc_instructor;

CREATE ROLE ftlc_employee;

CREATE ROLE ftlc_attendant;

CREATE ROLE ftlc_user;

CREATE ROLE ftlc_anonymous;

GRANT ftlc_admin_group TO ftlc_owner;

GRANT ftlc_admin_group TO ftlc_admin;

GRANT ftlc_employee TO ftlc_admin_group;

GRANT ftlc_roles TO ftlc_attendant;

GRANT ftlc_roles TO ftlc_employee;

GRANT ftlc_roles TO ftlc_user;

GRANT ftlc_roles TO ftlc_anonymous;

COMMIT;
