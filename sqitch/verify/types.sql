-- Verify ftlc:types on pg

BEGIN;

SELECT 1/COUNT(*) FROM pg_type WHERE typname = 'role_type';

SELECT 1/COUNT(*) FROM pg_type WHERE typname = 'jwt_token';

ROLLBACK;
