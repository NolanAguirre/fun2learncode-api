-- Revert ftlc:news_letter_functions from pg

BEGIN;

DROP FUNCTION ftlc.make_news_letter(CITEXT);

DROP FUNCTION ftlc.remove_news_letter(UUID);

COMMIT;
