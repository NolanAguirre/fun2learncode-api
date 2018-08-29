-- Deploy ftlc:roles to pg

BEGIN;

CREATE ROLE ftlc_roles LOGIN PASSWORD 'potato';

CREATE ROLE ftlc_owner;

GRANT ftlc_owner to ftlc_roles;

CREATE ROLE ftlc_instructor;

GRANT ftlc_instructor TO ftlc_roles;

CREATE ROLE ftlc_user;

GRANT ftlc_user TO ftlc_roles;

CREATE ROLE ftlc_student;

GRANT ftlc_student TO ftlc_roles;

CREATE ROLE ftlc_anonymous;

GRANT ftlc_anonymous TO ftlc_roles;

COMMIT;
