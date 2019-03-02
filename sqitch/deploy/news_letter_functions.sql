-- Deploy ftlc:news_letter_functions to pg
-- requires: news_letter

BEGIN;

CREATE FUNCTION ftlc.make_news_letter(CITEXT) RETURNS VOID AS $$
    INSERT INTO ftlc.news_letter (email) VALUES ($1);
$$ LANGUAGE SQL STRICT;

CREATE FUNCTION ftlc.remove_news_letter(UUID) RETURNS VOID AS $$
    DELETE FROM ftlc.news_letter WHERE id = $1;
$$ LANGUAGE SQL SECURITY DEFINER STRICT;

COMMIT;
