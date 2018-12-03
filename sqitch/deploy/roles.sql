-- Deploy ftlc:roles to pg

BEGIN;

CREATE ROLE ftlc_roles LOGIN PASSWORD 'potato';

CREATE ROLE ftlc_admin_group;

CREATE ROLE ftlc_owner;

GRANT ftlc_admin_group to ftlc_owner;

CREATE ROLE ftlc_admin;

GRANT ftlc_admin_group to ftlc_admin;

CREATE ROLE ftlc_lead_instructor;

GRANT ftlc_admin_group to ftlc_lead_instructor;

GRANT ftlc_roles to ftlc_admin_group;

CREATE ROLE ftlc_attendant;

GRANT ftlc_roles to ftlc_attendant;

CREATE ROLE ftlc_instructor;

GRANT ftlc_roles TO ftlc_instructor;

CREATE ROLE ftlc_user;

GRANT ftlc_roles TO ftlc_user;

CREATE ROLE ftlc_student;

GRANT ftlc_roles TO ftlc_student;

CREATE ROLE ftlc_anonymous;

GRANT ftlc_roles TO ftlc_anonymous;

COMMIT;
