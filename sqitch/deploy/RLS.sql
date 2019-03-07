-- Deploy ftlc:RLS to pg

BEGIN;

ALTER TABLE ftlc.attendance ENABLE ROW LEVEL SECURITY;
CREATE POLICY parent_attendance ON ftlc.attendance TO ftlc_user USING (student IN (SELECT id FROM ftlc.student WHERE parent = ftlc.get_id()));
CREATE POLICY employee_all ON ftlc.attendance TO ftlc_attendant, ftlc_employee USING (true);

ALTER TABLE ftlc.event_log ENABLE ROW LEVEL SECURITY;
CREATE POLICY parent_log ON ftlc.event_log TO ftlc_user USING (student IN (SELECT id FROM ftlc.student WHERE parent = ftlc.get_id()));
CREATE POLICY employee_all ON ftlc.event_log TO ftlc_attendant, ftlc_employee USING (true) WITH CHECK (instructor = ftlc.get_id());

ALTER TABLE ftlc.event_registration ENABLE ROW LEVEL SECURITY;
CREATE POLICY registered_by ON ftlc.event_registration TO ftlc_user USING (registered_by = ftlc.get_id());
CREATE POLICY employee_view ON ftlc.event_registration FOR SELECT TO ftlc_instructor, ftlc_attendant USING (true);
CREATE POLICY admin_all ON ftlc.event_registration TO ftlc_admin_group USING (true);

ALTER TABLE ftlc.payment ENABLE ROW LEVEL SECURITY;
CREATE POLICY is_user ON ftlc.payment TO ftlc_user USING (user_id = ftlc.get_id());
CREATE POLICY admin_all ON ftlc.payment TO ftlc_admin_group USING (true);

ALTER TABLE ftlc.refund_request ENABLE ROW LEVEL SECURITY;
CREATE POLICY is_user ON ftlc.refund_request TO ftlc_user USING (user_id = ftlc.get_id());
CREATE POLICY admin_view ON ftlc.refund_request FOR SELECT TO ftlc_admin USING (true);
CREATE POLICY owner_all ON ftlc.refund_request FOR SELECT TO ftlc_owner USING (true);

ALTER TABLE ftlc.student_waiver ENABLE ROW LEVEL SECURITY;
CREATE POLICY parent_of_student ON ftlc.student_waiver TO ftlc_user USING (student IN (SELECT id FROM ftlc.student WHERE parent = ftlc.get_id()));
CREATE POLICY employee_all ON ftlc.student_waiver  TO ftlc_employee USING (true);

ALTER TABLE ftlc.student ENABLE ROW LEVEL SECURITY;
CREATE POLICY parent_of_student ON ftlc.student TO ftlc_user USING (parent = ftlc.get_id());
CREATE POLICY employee_all ON ftlc.student TO ftlc_employee, ftlc_attendant USING (true);

ALTER TABLE ftlc.users ENABLE ROW LEVEL SECURITY;
CREATE POLICY is_user ON ftlc.users TO ftlc_user USING (id = ftlc.get_id() OR role != 'ftlc_user');
CREATE POLICY employee_view ON ftlc.users FOR SELECT TO ftlc_employee USING (true);
CREATE POLICY owner_all ON ftlc.users TO ftlc_owner USING (true);

ALTER TABLE ftlc.registration_override ENABLE ROW LEVEL SECURITY;
CREATE POLICY parent_of_student ON ftlc.registration_override FOR SELECT TO ftlc_user USING (student IN (SELECT id FROM ftlc.student WHERE parent = ftlc.get_id()));
CREATE POLICY admin_all ON ftlc.registration_override TO ftlc_admin_group USING (true);

COMMIT;
