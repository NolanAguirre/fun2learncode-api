-- Verify ftlc:roles on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_roles';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_owner';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_instructor';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_user';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_anonymous';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_admin';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_lead_instructor';

SELECT 1/ COUNT(*) FROM pg_roles WHERE rolname='ftlc_attendant';

ROLLBACK;
