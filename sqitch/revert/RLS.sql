-- Revert ftlc:RLS from pg

BEGIN;

DROP POLICY parent_attendance ON ftlc.attendance;
DROP POLICY admin_all ON ftlc.attendance;


DROP POLICY parent_log ON ftlc.event_logs;
DROP POLICY admin_all ON ftlc.event_logs;


DROP POLICY parent_of_student ON ftlc.students;
DROP POLICY admin_all ON ftlc.students;


DROP POLICY registered ON ftlc.event_registration;
DROP POLICY admin_all ON ftlc.event_registration;

DROP POLICY is_user ON ftlc.users;
DROP POLICY admin_all ON ftlc.users;


DROP POLICY is_user ON ftlc.payment;
DROP POLICY admin_all ON ftlc.payment;

COMMIT;
