--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

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
\.


--
-- Data for Name: add_on_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_on_join (id, event, add_on) FROM stdin;
\.


--
-- Data for Name: announcement; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.announcement (id, title, message, created_on) FROM stdin;
\.


--
-- Name: announcement_id_seq; Type: SEQUENCE SET; Schema: ftlc; Owner: nolan
--

SELECT pg_catalog.setval('ftlc.announcement_id_seq', 1, false);


--
-- Data for Name: date_interval; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_interval (id, start, "end", archive) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.users (id, first_name, last_name, email, created_on, role) FROM stdin;
007458de-2329-4f0f-9572-eae8f8459208	Nolan	Aguirre	nolanaguirre08@gmail.com	2019-02-22 20:27:27.681601-06	ftlc_owner
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.student (id, parent, first_name, last_name, date_of_birth) FROM stdin;
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
\.


--
-- PostgreSQL database dump complete
--
