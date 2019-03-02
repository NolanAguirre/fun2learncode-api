-- Revert ftlc:roles from pg

BEGIN;

DROP ROLE ftlc_anonymous;

DROP ROLE ftlc_user;

DROP ROLE ftlc_attendant;

DROP ROLE ftlc_instructor;

DROP ROLE ftlc_admin;

DROP ROLE ftlc_owner;

DROP ROLE ftlc_employee;

DROP ROLE ftlc_admin_group;

DROP ROLE ftlc_roles;

COMMIT;
