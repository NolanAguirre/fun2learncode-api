-- Verify ftlc:users_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.get_user_data()'::regprocedure);

SELECT pg_get_functiondef('ftlc.get_id()'::regprocedure);

SELECT pg_get_functiondef('ftlc.register_user(CITEXT, CITEXT, CITEXT, TEXT)'::regprocedure);

SELECT pg_get_functiondef('ftlc.register_other(CITEXT, CITEXT, CITEXT, TEXT, ftlc.role_type)'::regprocedure);

SELECT pg_get_functiondef('ftlc.authenticate(CITEXT, TEXT)'::regprocedure);

SELECT pg_get_functiondef('ftlc.generate_password_token(CITEXT)'::regprocedure);

SELECT pg_get_functiondef('ftlc.check_registration(UUID, UUID)'::regprocedure);

SELECT pg_get_functiondef('ftlc.reset_password(TEXT, TEXT)'::regprocedure);

ROLLBACK;
