-- Revert ftlc:privileges from pg

BEGIN;

DROP OWNED BY ftlc_owner;

DROP OWNED BY ftlc_user;

DROP OWNED BY ftlc_lead_instructor;

DROP OWNED BY ftlc_instructor;

DROP OWNED BY ftlc_admin;

DROP OWNED BY ftlc_attendant;

DROP OWNED BY ftlc_anonymous;

DROP OWNED BY ftlc_employee;

DROP OWNED BY ftlc_admin_group;

DROP OWNED BY ftlc_roles;

COMMIT;
