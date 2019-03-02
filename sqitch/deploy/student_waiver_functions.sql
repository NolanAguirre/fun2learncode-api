-- Deploy ftlc:student_waiver_functions to pg
-- requires: student_waiver

BEGIN;

CREATE FUNCTION ftlc.check_waiver(UUID) RETURNS BOOLEAN AS $$
    SELECT EXISTS(SELECT 1 FROM ftlc.student_waiver WHERE student = $1 AND created_on > (NOW() - interval '1 years'));
$$ LANGUAGE SQL STABLE;


COMMIT;
