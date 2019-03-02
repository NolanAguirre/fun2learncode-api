--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: category; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.category (id, name, description) FROM stdin;
de12a050-5072-4510-b61a-894ab0eed820	Labs	Labs
a5c33112-d8e1-42f0-85e8-aa69c6d5a87e	Classes	classes
990abea3-1dd1-49a0-8529-d16d6f9c53c1	Workshops	Workshop
4c3e0f49-48c6-43dd-b13b-13a28e1afd91	Summer Camps	Summer Camps
\.


--
-- Data for Name: activity; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activity (id, category, url, name, description, public_display, archive) FROM stdin;
0e207141-c0c9-402d-98dc-fb17c4602d6c	4c3e0f49-48c6-43dd-b13b-13a28e1afd91	https://imag.malavida.com/mvimgbig/download-fs/kodu-7181-5.jpg	Video Game Design	Kodu video game design. Meant for kids 7+	t	f
\.


--
-- Data for Name: activity_prerequisite; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activity_prerequisite (id, activity, prerequisite) FROM stdin;
\.


--
-- Data for Name: add_on; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_on (id, name, description, price) FROM stdin;
4933050d-0dc3-43fc-b81d-439a54d49cd1	Early Drop Off	Drop students off up to 1 hour before event start.	20
20fa8f5c-d218-4b30-8e83-7bd2fbab148a	Late Pickup	Pick up students up to 1 hour after the event ends	20
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.address (id, street, city, zipcode, state, country, alias, archive) FROM stdin;
c8959d18-c811-4572-aef0-dcc4475a7ec0	420 Chisholm Vally Dr	Round Rock	78664	Texas	United States	Fun 2 Learn Code	f
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event (id, activity, address, open_registration, close_registration, capacity, seats_left, name, price, show_calendar, archive, public_display) FROM stdin;
1c7441e7-56d1-4cf2-87c7-a0477a76d45f	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-05-27 23:59:59-05	8	8	May AM	200	t	f	t
587c5573-2998-4843-b915-f5438a008534	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-06-23 23:59:59-05	8	8	June PM	200	t	f	t
418d2479-88b6-4495-ad22-bf7e51f90115	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-07-21 23:59:59-05	8	8	July PM	200	t	f	t
7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	0e207141-c0c9-402d-98dc-fb17c4602d6c	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-01 23:59:59-06	2019-08-04 23:59:59-05	8	8	August AM	200	t	f	t
\.


--
-- Data for Name: add_on_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_on_join (id, event, add_on) FROM stdin;
fc7f6deb-22e8-455f-8526-8c25b22a45d7	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	4933050d-0dc3-43fc-b81d-439a54d49cd1
09ab1793-d559-4f69-b3c9-0a5de0e6b797	587c5573-2998-4843-b915-f5438a008534	20fa8f5c-d218-4b30-8e83-7bd2fbab148a
4a44e3f4-4285-4bee-868a-121ec4ed1b39	418d2479-88b6-4495-ad22-bf7e51f90115	20fa8f5c-d218-4b30-8e83-7bd2fbab148a
5946b47d-23df-4ff9-9670-7005d5dcf741	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	4933050d-0dc3-43fc-b81d-439a54d49cd1
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.announcement (id, title, message, created_on) FROM stdin;
\.


--
-- Data for Name: date_interval; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_interval (id, start, "end", archive) FROM stdin;
6c7e0021-d09d-4390-9419-6689473738f5	2019-05-07 09:00:00-05	2019-05-07 12:00:00-05	f
a5ac27f4-3c6d-445b-8955-304e37b16e80	2019-05-08 09:00:00-05	2019-05-08 12:00:00-05	f
f21646e2-2879-4fd9-bee4-c332e76b2914	2019-05-09 09:00:00-05	2019-05-09 12:00:00-05	f
6a0cf612-fce7-4381-9544-951ce551e5c2	2019-05-10 09:00:00-05	2019-05-10 12:00:00-05	f
9490ba95-d18c-4c20-b5d0-a3083f239586	2019-08-05 09:00:00-05	2019-08-05 12:00:00-05	f
4ebfb117-27a8-4ca8-8625-aa64f450cdc2	2019-08-06 09:00:00-05	2019-08-06 12:00:00-05	f
35099fa5-b1a4-494a-bc96-55ab3a5546be	2019-08-07 09:00:00-05	2019-08-07 12:00:00-05	f
36d6a691-c8bd-4098-8d8c-3da8c1ee4c21	2019-08-08 09:00:00-05	2019-08-08 12:00:00-05	f
bf356f6f-db84-41e9-a237-6b47fc9155c0	2019-08-09 09:00:00-05	2019-08-09 12:00:00-05	f
c00c2c1d-02be-4655-bf0e-61819605b768	2019-07-24 13:00:00-05	2019-07-24 16:00:00-05	f
dcf9c460-d021-4ed1-bb63-7b0317bf3d9d	2019-07-25 13:00:00-05	2019-07-25 16:00:00-05	f
a84437b6-076d-4c08-9d77-d1bd71f4c49a	2019-07-26 13:00:00-05	2019-07-26 16:00:00-05	f
d1df63b3-9e53-4483-b273-5a820301f14d	2019-06-24 13:00:00-05	2019-06-24 16:00:00-05	f
7049baf4-4c3a-46c1-86f6-75821b371736	2019-06-25 13:00:00-05	2019-06-25 16:00:00-05	f
4ca9277a-693d-47b0-83ed-4171e6dae57b	2019-06-26 13:00:00-05	2019-06-26 16:00:00-05	f
8f51aa7a-bffb-40f9-96f7-abb598d304c5	2019-06-27 13:00:00-05	2019-06-27 16:00:00-05	f
184ed254-2b41-4b7c-9cb3-743302920f0a	2019-06-28 13:00:00-05	2019-06-28 16:00:00-05	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.users (id, first_name, last_name, email, created_on, role) FROM stdin;
007458de-2329-4f0f-9572-eae8f8459208	Nolan	Aguirre	nolanaguirre08@gmail.com	2019-02-22 20:27:27.681601-06	ftlc_owner
40ac3d56-2b49-4ab0-ac0c-b90b264abf93	TestFirst	TestLast	bobby7083@gmail.com	2019-02-28 23:41:51.379278-06	ftlc_user
298100ad-096d-4997-a2f0-3a60551ebcf5	John	Doe	aguirrefammusic@gmail.com	2019-02-28 23:42:32.796259-06	ftlc_user
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.student (id, parent, first_name, last_name, date_of_birth) FROM stdin;
5527df7f-1e09-4671-b6c3-ead678c74d7a	40ac3d56-2b49-4ab0-ac0c-b90b264abf93	John	TestLast	2009-06-03 23:46:24.519-05
7fff603e-1b5e-4fd7-b1e5-b154a9a1f1ed	40ac3d56-2b49-4ab0-ac0c-b90b264abf93	Sally	TestLast	2005-08-10 23:46:45.012-05
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.attendance (id, student, date_interval, event, present, check_in_time) FROM stdin;
\.


--
-- Data for Name: date_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_join (id, event, date_interval) FROM stdin;
61abc265-ab42-4d7d-b426-f520c593cbec	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	6c7e0021-d09d-4390-9419-6689473738f5
ddba1117-a52c-414b-9491-3a23235e679a	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	a5ac27f4-3c6d-445b-8955-304e37b16e80
c7fc6099-0e12-46a8-8c5d-a346e52bae85	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	f21646e2-2879-4fd9-bee4-c332e76b2914
b3a6409d-e360-4107-aa6c-3b194a9af59e	1c7441e7-56d1-4cf2-87c7-a0477a76d45f	6a0cf612-fce7-4381-9544-951ce551e5c2
ec41c714-2bfc-48d4-8861-d6c68d66f1a1	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	9490ba95-d18c-4c20-b5d0-a3083f239586
c4896b8e-b997-4397-a49d-a4a1915a7653	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	4ebfb117-27a8-4ca8-8625-aa64f450cdc2
49e5ca73-8e83-4f4d-95e0-c364ed2bf20e	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	35099fa5-b1a4-494a-bc96-55ab3a5546be
acce4aec-33f6-4b4d-8d78-558dd1637d35	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	36d6a691-c8bd-4098-8d8c-3da8c1ee4c21
ca853523-66bf-4ac5-8630-a8ef8b6ea916	7aaf98f8-9b8d-4a9a-9dcf-c2e5db2fc4c5	bf356f6f-db84-41e9-a237-6b47fc9155c0
5b0dc250-f4c8-4cc8-bb9f-8aa57383c08c	418d2479-88b6-4495-ad22-bf7e51f90115	c00c2c1d-02be-4655-bf0e-61819605b768
73a4a8fc-83f1-47e6-8669-5ac233c79ff2	418d2479-88b6-4495-ad22-bf7e51f90115	dcf9c460-d021-4ed1-bb63-7b0317bf3d9d
bd3e2379-7d0c-431e-8e39-4fee2f7c0070	418d2479-88b6-4495-ad22-bf7e51f90115	a84437b6-076d-4c08-9d77-d1bd71f4c49a
f9163188-6ebe-40e8-a917-7c05d1c5d3a6	587c5573-2998-4843-b915-f5438a008534	d1df63b3-9e53-4483-b273-5a820301f14d
287bdaed-da3c-4c60-a3c1-8fabc9befe1a	587c5573-2998-4843-b915-f5438a008534	7049baf4-4c3a-46c1-86f6-75821b371736
e11e929a-bcea-4371-b01a-8ac9f583973c	587c5573-2998-4843-b915-f5438a008534	4ca9277a-693d-47b0-83ed-4171e6dae57b
ea44aa7a-735f-4868-9856-9e7093c3ed77	587c5573-2998-4843-b915-f5438a008534	8f51aa7a-bffb-40f9-96f7-abb598d304c5
e60c6bd8-933d-4c7f-b4f0-9f42d6623b83	587c5573-2998-4843-b915-f5438a008534	184ed254-2b41-4b7c-9cb3-743302920f0a
\.


--
-- Data for Name: event_log; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_log (id, event, date_interval, student, instructor, comment) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.payment (id, user_id, status, create_on, snapshot, charge, refund) FROM stdin;
\.


--
-- Data for Name: event_registration; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_registration (id, registered_by, student, event, payment, registered_on) FROM stdin;
\.


--
-- Data for Name: event_request; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_request (id, user_id, event, created_on, information, access_token, status) FROM stdin;
\.


--
-- Data for Name: news_letter; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.news_letter (id, email) FROM stdin;
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.promo_code (id, code, for_category, for_activity, for_user, percent, category, generated_by, activity, user_id, effect, uses, created_on, valid_start, valid_end, archive, disabled) FROM stdin;
\.


--
-- Data for Name: promo_code_use; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.promo_code_use (id, user_id, promo_code) FROM stdin;
\.


--
-- Data for Name: refund_request; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.refund_request (id, payment, user_id, created_on, reason, granted_reason, amount_refunded, status) FROM stdin;
\.


--
-- Data for Name: registration_override; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.registration_override (id, student, event, modified_price, valid_end) FROM stdin;
\.


--
-- Data for Name: student_waiver; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.student_waiver (id, student, primary_care, primary_care_phone, emergency_phone, pickup_one, pickup_two, other, created_on) FROM stdin;
\.


--
-- Data for Name: transaction_state; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.transaction_state (user_id, transaction, processing) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc_private; Owner: nolan
--

COPY ftlc_private.users (id, user_id, password_hash, password_reset, password_reset_expiration) FROM stdin;
157eb4c7-83d1-4a09-9963-96642b9e7405	007458de-2329-4f0f-9572-eae8f8459208	$2a$06$Azo2g4m6xRD9/ZXCh90Yj.1gh7ExMm6cAZudz4VolyC1q3b6LZqvi	\N	\N
5b7de219-6113-4490-b8b7-2f59ded556ce	40ac3d56-2b49-4ab0-ac0c-b90b264abf93	$2a$06$AoWVbHiq4qvjuZ663yEnz.tXg0YS87qGQF/PpP73EFjlgVSgsrvpa	\N	\N
685982f2-e06d-4380-ad52-80dc1d78bfa9	298100ad-096d-4997-a2f0-3a60551ebcf5	$2a$06$omE8CQxT5u296V15pv.rxeCUzUkyx1fjEC4i4IRHThi1.CHJZoGum	\N	\N
\.


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: ftlc; Owner: nolan
--

SELECT pg_catalog.setval('ftlc.announcement_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

