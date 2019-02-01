-- Deploy ftlc:news_letter_functions to pg
-- requires: news_letter

BEGIN;

CREATE FUNCTION ftlc.make_news_letter(CITEXT) RETURNS VOID AS $$
    INSERT INTO ftlc.news_letter (email) VALUES ($1);
$$ LANGUAGE SQL STRICT;

COMMIT;
