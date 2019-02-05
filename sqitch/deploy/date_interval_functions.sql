-- Deploy ftlc:date_interval_functions to pg
-- requires: date_interval
-- requires: dates_join

BEGIN;

CREATE FUNCTION ftlc.make_date_interval(TIMESTAMP, TIMESTAMP, UUID) RETURNS ftlc.date_join AS $$
    DECLARE
       dateInterval UUID;
       date_join ftlc.date_join;
   BEGIN
   SELECT id INTO dateInterval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF(dateInterval IS NULL) THEN
       INSERT INTO ftlc.date_interval (start, "end") VALUES ($1, $2) RETURNING id INTO dateInterval;
   END IF;
   SELECT * INTO date_join FROM ftlc.date_join WHERE date_interval = dateInterval AND event = $3;
   IF(date_join IS NULL) THEN
      INSERT INTO ftlc.date_join (event, date_interval) VALUES ($3, dateInterval) RETURNING * INTO date_join;
   END IF;
   RETURN date_join;
   END;
$$ LANGUAGE PLPGSQL STRICT;

CREATE FUNCTION ftlc.remove_date_interval(TIMESTAMP, TIMESTAMP, UUID) RETURNS ftlc.date_join AS $$
   DECLARE -- THIS MIGHT HAVE ISSUES, NEEDS MORE TESTING
      dateInterval UUID;
      date_join ftlc.date_join;
   BEGIN
   SELECT id INTO dateInterval FROM ftlc.date_interval WHERE start = $1 AND "end" = $2;
   IF( dateInterval IS NOT NULL) THEN
       DELETE FROM ftlc.date_join WHERE date_interval = dateInterval AND event = $3 RETURNING * INTO date_join;
       IF(SELECT NOT EXISTS(SELECT * from ftlc.date_join WHERE date_interval =  dateInterval)) THEN
           DELETE FROM ftlc.date_interval WHERE id = dateInterval;
       END IF;
   END IF;
   RETURN date_join;
   END;
$$ LANGUAGE PLPGSQL STRICT;

COMMIT;
