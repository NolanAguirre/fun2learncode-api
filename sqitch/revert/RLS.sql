-- Revert ftlc:RLS from pg

BEGIN;

DROP POLICY parent_attendance ON ftlc.attendance;
DROP POLICY employee_all ON ftlc.attendance;

DROP POLICY parent_log ON ftlc.event_log;
DROP POLICY employee_all ON ftlc.event_log;

DROP POLICY registered_by ON ftlc.event_registration;
DROP POLICY employee_view ON ftlc.event_registration;
DROP POLICY admin_all ON ftlc.event_registration;

DROP POLICY is_user ON ftlc.payment;
DROP POLICY admin_all ON ftlc.payment;

DROP POLICY is_user ON ftlc.refund_request;
DROP POLICY admin_view ON ftlc.refund_request;
DROP POLICY owner_all ON ftlc.refund_request;

DROP POLICY parent_of_student ON ftlc.student_waiver;
DROP POLICY employee_all ON ftlc.student_waiver;

DROP POLICY parent_of_student ON ftlc.student;
DROP POLICY employee_all ON ftlc.student;

DROP POLICY is_user ON ftlc.users;
DROP POLICY employee_view ON ftlc.users;
DROP POLICY owner_all ON ftlc.users;

DROP POLICY parent_of_student ON ftlc.registration_override;
DROP POLICY admin_all ON ftlc.registration_override;

COMMIT;
