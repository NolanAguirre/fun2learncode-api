-- Revert ftlc:privileges from pg

BEGIN;

DROP OWNED BY ftlc_owner;

DROP OWNED BY ftlc_user;

DROP OWNED BY ftlc_student;

DROP OWNED BY ftlc_instructor;

DROP OWNED BY ftlc_anonymous;

DROP OWNED BY ftlc_roles;

COMMIT;
