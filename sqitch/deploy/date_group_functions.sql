-- Deploy ftlc:date_group_functions to pg
-- requires: date_group
-- requires: dates_join
-- requires: date_interval

BEGIN;

CREATE FUNCTION ftlc.make_date_group(dates TIMESTAMP[][]) RETURNS VOID AS $$
    DECLARE
        date_group UUID;
        temp_date TIMESTAMP[];
    BEGIN
        FOREACH temp_date IN ARRAY dates
        LOOP
            IF( SELECT EXISTS FROM (SELECT 1 FROM ftlc.date_interval WHERE start = temp_date[0] AND "end" = temp_date[0])
            ELSE
            END IF;
        END LOOP;
    END;
$$ LANGUAGE PLPGSQL STRICT;

CREATE FUNCTION fltc.date_group_exists(TIMESTAMP[][]) RETURNS UUID AS $$
    DECLARE
        date_group UUID;
        date_groups UUID[];
        dates TIMESTAMP[];
        flag BOOLEAN;
    BEGIN
        SELECT array(SELECT id from ftlc.date_groups) INTO date_groups;
        FOREACH date_group IN ARRAY date_groups
        LOOP
            FOREACH dates IN ARRAY $1
            LOOP
                flag := false;
                IF((SELECT ftlc.date_exists_in_group(dates[0], dates[1], date_group) = '00000000-0000-0000-0000-000000000000') THEN
                    flag := false;
                    EXIT;
                ELSE
                    flag: := true;
                END IF;
            END LOOP;
            IF(flag) THEN
                RETURN date_group;
                EXIT;
            END IF;
        END LOOP
        RETURN uuid('00000000-0000-0000-0000-000000000000');
    END;
$$ LANGUAGE PLPGSQL;

CREATE FUNCTION ftlc.date_exists_in_group(TIMESTAMP, TIMESTAMP, UUID) RETURNS UUID AS $$
    SELECT coalesce((SELECT id FROM ftlc.dates_join WHERE date_group = $3 AND date_interval = (SELECT ftlc.date_exists($1,$2))),uuid('00000000-0000-0000-0000-000000000000'));
$$ LANGUAGE SQL;

CREATE FUNCTION ftlc.date_exists(TIMESTAMP, TIMESTAMP) RETURNS UUID AS $$
    SELECT coalesce((SELECT id FROM ftlc.date_interval WHERE start = $1 AND "end" = $2),uuid('00000000-0000-0000-0000-000000000000'));
$$ LANGUAGE SQL;

COMMIT;
