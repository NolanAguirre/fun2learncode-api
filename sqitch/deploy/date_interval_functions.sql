-- Deploy ftlc:date_interval_functions to pg
-- requires: date_interval
-- requires: dates_join

BEGIN;

CREATE FUNCTION ftlc.make_date_interval(TIMESTAMP, TIMESTAMP, UUID) RETURNS ftlc.dates_join AS $$
    DECLARE
       dateInterval UUID;
       dates_join ftlc.dates_join;
   BEGIN
   SELECT id INTO dateInterval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF(dateInterval IS NULL) THEN
       INSERT INTO ftlc.date_interval (start, "end") VALUES ($1, $2) RETURNING id INTO date_int;
   END IF;
   SELECT * INTO dates_join FROM ftlc.dates_join WHERE date_interval = dateInterval AND date_group = $3;
   IF(dates_join IS NULL) THEN
      INSERT INTO ftlc.dates_join (date_group, date_interval) VALUES ($3, date_int) RETURNING * INTO dates_join;
   END IF;
   RETURN dates_join;
   END;
$$ LANGUAGE PLPGSQL STRICT;

CREATE FUNCTION ftlc.remove_date_interval(TIMESTAMP, TIMESTAMP, UUID) RETURNS ftlc.dates_join AS $$
   DECLARE -- THIS MIGHT HAVE ISSUES, NEEDS MORE TESTING
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

COMMIT;
