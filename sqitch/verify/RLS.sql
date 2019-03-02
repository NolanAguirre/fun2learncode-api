-- Verify ftlc:RLS on pg

BEGIN;

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'attendance' AND policyname = 'parent_attendance';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'attendance' AND policyname = 'employee_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'event_log' AND policyname = 'parent_log';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'event_log' AND policyname = 'employee_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'event_registration' AND policyname = 'registered_by';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'event_registration' AND policyname = 'employee_view';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'event_registration' AND policyname = 'admin_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'payment' AND policyname = 'is_user';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'payment' AND policyname = 'admin_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'refund_request' AND policyname = 'is_user';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'refund_request' AND policyname = 'admin_view';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'refund_request' AND policyname = 'owner_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'refund_request' AND policyname = 'owner_all';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'refund_request' AND policyname = 'owner_all';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'refund_request' AND policyname = 'owner_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'student_waiver' AND policyname = 'parent_of_student';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'student_waiver' AND policyname = 'employee_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'student' AND policyname = 'parent_of_student';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'student' AND policyname = 'employee_all';

SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'users' AND policyname = 'is_user';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'users' AND policyname = 'employee_view';
SELECT 1/ COUNT(*) FROM pg_policies WHERE schemaname = 'ftlc' AND tablename = 'users' AND policyname = 'owner_all';

ROLLBACK;
