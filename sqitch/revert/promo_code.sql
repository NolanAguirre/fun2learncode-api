-- Revert ftlc:promo_code from pg

BEGIN;

DROP TABLE ftlc.promo_code;

COMMIT;
