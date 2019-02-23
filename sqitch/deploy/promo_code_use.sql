-- Deploy ftlc:promo_code_use to pg
-- requires: promo_code

BEGIN;

CREATE TABLE ftlc.promo_code_use(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES ftlc.users(id) NOT NULL,
    promo_code UUID REFERENCES ftlc.promo_code(id) NOT NULL,
    CONSTRAINT sigle_use UNIQUE (user_id, promo_code)
);

COMMIT;
