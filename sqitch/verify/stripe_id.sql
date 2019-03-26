-- Verify ftlc:stripe_id on pg

BEGIN;

SELECT 1/ COUNT(*) FROM information_schema.columns WHERE table_schema='ftlc_private' AND table_name='users' and column_name='stripe_id';

ROLLBACK;
