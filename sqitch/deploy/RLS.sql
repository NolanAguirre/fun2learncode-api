-- Deploy ftlc:RLS to pg

BEGIN;

ALTER TABLE ftlc.attendance ENABLE ROW LEVEL SECURITY;

CREATE POLICY parent_attendance ON ftlc.attendance TO ftlc_user USING (student IN (SELECT id FROM ftlc.students WHERE parent = ftlc.get_id()));
CREATE POLICY employee_all ON ftlc.attendance TO ftlc_employee USING (true) WITH CHECK (true);

ALTER TABLE ftlc.event_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY parent_log ON ftlc.event_logs TO ftlc_user USING (student IN (SELECT id FROM ftlc.students WHERE parent = ftlc.get_id()));
CREATE POLICY employee_all ON ftlc.event_logs TO ftlc_employee USING (true) WITH CHECK (true);

ALTER TABLE ftlc.students ENABLE ROW LEVEL SECURITY;

CREATE POLICY parent_of_student ON ftlc.students TO ftlc_user USING (parent = ftlc.get_id());
CREATE POLICY employee_all ON ftlc.students TO ftlc_employee USING (true) WITH CHECK (true);

ALTER TABLE ftlc.event_registration ENABLE ROW LEVEL SECURITY;

CREATE POLICY registered ON ftlc.event_registration TO ftlc_user USING (registered_by = ftlc.get_id());
CREATE POLICY employee_all ON ftlc.event_registration TO ftlc_employee, ftlc_attendant USING (true) WITH CHECK (true);

ALTER TABLE ftlc.users ENABLE ROW LEVEL SECURITY;

CREATE POLICY is_user ON ftlc.users TO ftlc_user USING (id = ftlc.get_id());
CREATE POLICY employee_all ON ftlc.users TO ftlc_employee USING (true) WITH CHECK (true);

ALTER TABLE ftlc.payment ENABLE ROW LEVEL SECURITY;

CREATE POLICY is_user ON ftlc.payment TO ftlc_user USING (user_id = ftlc.get_id());
CREATE POLICY employee_all ON ftlc.payment TO ftlc_employee USING (true) WITH CHECK (true);

ALTER TABLE ftlc.refund_request ENABLE ROW LEVEL SECURITY;

CREATE POLICY is_user ON ftlc.refund_request TO ftlc_user USING (user_id = ftlc.get_id());
CREATE POLICY admin_all ON ftlc.refund_request TO ftlc_admin_group USING (true) WITH CHECK (true);

COMMIT;
