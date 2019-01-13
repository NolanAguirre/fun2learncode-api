-- Deploy ftlc:event_dates to pg
-- requires: appschema
-- requires: extensions

BEGIN;

CREATE TABLE ftlc.date_interval(
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    start TIMESTAMP NOT NULL,
    "end" TIMESTAMP NOT NULL,
    archive BOOLEAN DEFAULT false,
    CONSTRAINT unique_date UNIQUE (start, "end")
);
--TODO move these functions into their own migration

CREATE FUNCTION ftlc.make_date_interval(TIMESTAMP, TIMESTAMP, UUID) RETURNS ftlc.dates_join AS $$
    DECLARE
       date_interval UUID;
       dates_join ftlc.dates_join;
   BEGIN
   SELECT id INTO date_interval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF(date_interval IS NULL) THEN
       INSERT INTO ftlc.date_interval (start, "end") VALUES ($1, $2) RETURNING id INTO date_interval;
   END IF;
   INSERT INTO ftlc.dates_join (date_group, "date_interval") VALUES ($3, date_interval) RETURNING * INTO dates_join;
   RETURN dates_join;
   END;
$$ LANGUAGE PLPGSQL STRICT;

CREATE FUNCTION ftlc.remove_date_interval(TIMESTAMP, TIMESTAMP, UUID) RETURNS ftlc.dates_join AS $$
   DECLARE
      dateInterval UUID;
      dates_join ftlc.dates_join;
   BEGIN
   SELECT id INTO dateInterval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF( dateInterval IS NOT NULL) THEN
       DELETE FROM ftlc.dates_join WHERE date_interval = dateInterval AND date_group = $3 RETURNING * INTO dates_join;
       IF(SELECT NOT EXISTS(SELECT * from ftlc.dates_join WHERE date_interval =  dateInterval)) THEN
           DELETE FROM ftlc.date_interval WHERE id = dateInterval;
       END IF;
   END IF;
   RETURN dates_join;
   END;
$$ LANGUAGE PLPGSQL STRICT;

CREATE FUNCTION ftlc.date_interval_by_student(student_id UUID) RETURNS SETOF ftlc.date_interval AS $$
    BEGIN
        RETURN QUERY SELECT * FROM ftlc.date_interval WHERE id IN (
            SELECT date_interval FROM ftlc.dates_join WHERE date_group IN (
                SELECT date_group FROM ftlc.event_registration WHERE student = student_id)) ORDER BY start ASC;
    END;
$$ LANGUAGE PLPGSQL STABLE;

COMMIT;
