-- Verify ftlc:news_letter_functions on pg

BEGIN;

SELECT pg_get_functiondef('ftlc.make_news_letter(CITEXT)'::regprocedure);

SELECT pg_get_functiondef('ftlc.remove_news_letter(UUID)'::regprocedure);

ROLLBACK;
