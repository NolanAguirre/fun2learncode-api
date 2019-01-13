-- Verify ftlc:promo_code on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_tables WHERE schemaname = 'ftlc' AND tablename = 'promo_code';

ROLLBACK;
