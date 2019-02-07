-- Deploy ftlc:promo_code to pg
-- requires: date_group
-- requires: users

BEGIN;

CREATE TABLE ftlc.promo_code(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code TEXT NOT NULL,
    for_category BOOLEAN NOT NULL,
    for_activity BOOLEAN NOT NULL,
    for_user BOOLEAN NOT NULL,
    percent BOOLEAN NOT NULL,
    category UUID REFERENCES ftlc.category(id),
    generated_by UUID REFERENCES ftlc.payment(id),
    activity UUID REFERENCES ftlc.activity(id),
    user_id UUID REFERENCES ftlc.users(id),
    effect INTEGER NOT NULL,
    uses INTEGER NOT NULL,
    created_on TIMESTAMP DEFAULT NOW(),
    valid_start TIMESTAMP DEFAULT NOW(),
    valid_end TIMESTAMP NOT NULL,
    archive BOOLEAN DEFAULT false,
    disabled BOOLEAN DEFAULT false
);

COMMIT;
