-- Revert ftlc:promo_code_use from pg

BEGIN;

DROP TABLE ftlc.promo_code_use;

COMMIT;
