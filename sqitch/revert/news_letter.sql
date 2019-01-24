-- Revert ftlc:newsletter from pg

BEGIN;

DROP TABLE ftlc.news_letter;

COMMIT;
