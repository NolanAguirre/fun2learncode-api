-- Deploy ftlc:transaction_state_functions to pg
-- requires: transaction_state

BEGIN;

CREATE FUNCTION ftlc.store_transaction(UUID, JSONB) RETURNS VOID AS $$
    DECLARE
        temp ftlc.transaction_state;
    BEGIN
        SELECT * INTO temp FROM ftlc.transaction_state WHERE user_id = $1;
        IF(temp IS NULL) THEN
            INSERT INTO ftlc.transaction_state (user_id, transaction, processing) VALUES ($1, $2, false);
        ELSIF(temp.processing = true) THEN
            RAISE EXCEPTION 'transaction is already being processed';
        ELSE
            UPDATE ftlc.transaction_state SET transaction = $2 WHERE user_id = $1;
        END IF;
    END;
$$ LANGUAGE PLPGSQL SECURITY DEFINER;

COMMIT;
