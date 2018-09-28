-- Deploy ftlc:date_group_functions to pg
-- requires: date_group
-- requires: dates_join
-- requires: date_interval

BEGIN;

CREATE FUNCTION ftlc.date_exists(TIMESTAMP, TIMESTAMP) RETURNS UUID AS $$
    SELECT coalesce((SELECT id FROM ftlc.date_interval WHERE start = $1 AND "end" = $2), uuid('00000000-0000-0000-0000-000000000000'));
$$ LANGUAGE SQL;

CREATE FUNCTION ftlc.date_exists_in_group(TIMESTAMP, TIMESTAMP, UUID) RETURNS UUID AS $$
    SELECT coalesce((SELECT id FROM ftlc.dates_join WHERE date_group = $3 AND date_interval = (SELECT ftlc.date_exists($1,$2))), uuid('00000000-0000-0000-0000-000000000000'));
$$ LANGUAGE SQL;

CREATE FUNCTION ftlc.date_group_exists(TIMESTAMP[][]) RETURNS UUID AS $$
    DECLARE
        date_group UUID;
        date_groups UUID[];
        dates TIMESTAMP[];
        flag BOOLEAN;
    BEGIN
        SELECT array(SELECT id from ftlc.date_group) INTO date_groups;
        FOREACH date_group IN ARRAY date_groups
        LOOP
            FOREACH dates SLICE 1 IN ARRAY $1
            LOOP
                flag := false;
                IF(SELECT ftlc.date_exists_in_group(dates[1], dates[2], date_group) = '00000000-0000-0000-0000-000000000000') THEN
                    flag := false;
                    EXIT;
                ELSE
                    flag := true;
                END IF;
            END LOOP;
            IF(SELECT flag) THEN
                RETURN date_group;
                EXIT;
            END IF;
        END LOOP;
        RETURN uuid('00000000-0000-0000-0000-000000000000');
    END;
$$ LANGUAGE PLPGSQL;

CREATE FUNCTION ftlc.make_date_group(TIMESTAMP[]) RETURNS UUID AS $$
    DECLARE
        counter INTEGER := 3;
        date_group_arrays TIMESTAMP[][] := ARRAY[[$1[1],$1[2]]];
        date_group UUID;
        dates TIMESTAMP[];
        date_interval UUID;
    BEGIN
        LOOP
            EXIT WHEN counter = array_length($1, 1);
            date_group_arrays := ARRAY[$1[counter], $1[counter+1]] || date_group_arrays;
            counter := counter+1;
        END LOOP;
        RAISE NOTICE 'date_groupe array is %)', date_group_arrays;
        date_group := ftlc.date_group_exists(date_group_arrays);
        IF(SELECT date_group != '00000000-0000-0000-0000-000000000000') THEN
            RETURN date_group;
        ELSE
            INSERT INTO ftlc.date_group DEFAULT VALUES RETURNING id INTO date_group;
            FOREACH dates SLICE 1 IN ARRAY date_group_arrays
            LOOP
                date_interval := ftlc.date_exists(dates[1], dates[2]);
                IF(SELECT date_interval = '00000000-0000-0000-0000-000000000000') THEN
                    INSERT INTO ftlc.date_interval ("start", "end") VALUES (dates[1], dates[2])  RETURNING id INTO date_interval;
                END IF;
                INSERT INTO ftlc.dates_join ("date_group", "date_interval") VALUES (date_group, date_interval);
            END LOOP;
            RETURN date_group;
        END IF;

    END;
$$ LANGUAGE PLPGSQL STRICT;

COMMIT;

select ftlc.make_date_group(ARRAY['2019-09-29T11:23:21.693Z'::timestamp, '2019-09-29T13:36:56.541Z'::timestamp,'2020-09-29T11:23:21.693Z'::timestamp, '2020-09-29T13:36:56.541Z'::timestamp]);
