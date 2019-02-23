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
c62325e3-8c50-44b5-8b3c-deb69ada7dea	de12a050-5072-4510-b61a-894ab0eed820	https://cdn-images-1.medium.com/max/1600/0*356zWDYXZyGbmQxa.	Beginner Coding Lab	In our beginner coding labs students can do scratch designed for grades 1-5	t	f
11eadc42-1450-4d7e-a293-ca3ff36b8fb9	de12a050-5072-4510-b61a-894ab0eed820	https://aozoeky4dglp5sh0-zippykid.netdna-ssl.com/wp-content/uploads/2015/08/unity-3d-linux.jpg	Intermediate Coding Lab	In our intermediate coding labs students can do unity designed for grades 5-10	f	f
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
c385ff93-2d9e-4551-ab71-d8bcbc26484a	c62325e3-8c50-44b5-8b3c-deb69ada7dea	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-21 23:59:59-06	2019-03-03 23:59:59-06	8	8	Monday March 1	66	t	f	t
5813e0b2-4b89-4739-a2eb-bd4e2bad31e1	11eadc42-1450-4d7e-a293-ca3ff36b8fb9	c8959d18-c811-4572-aef0-dcc4475a7ec0	2019-02-21 23:59:59-06	2019-03-03 23:59:59-06	8	8	Monday March 2	88	t	f	t
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
3ed1feb5-f5a6-4824-96e2-203b04e46fd5	2019-03-04 17:00:00-06	2019-03-04 18:00:00-06	f
2684a7c9-bd58-4b84-a669-d875aaa81de8	2019-03-11 17:00:00-05	2019-03-11 18:00:00-05	f
27ee8f18-47bd-42f7-88a2-c33aff6bfd34	2019-03-18 17:00:00-05	2019-03-18 18:00:00-05	f
0d36e36a-240c-4337-9566-526991e004ce	2019-03-25 17:00:00-05	2019-03-25 18:00:00-05	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.users (id, first_name, last_name, email, created_on, role) FROM stdin;
007458de-2329-4f0f-9572-eae8f8459208	Nolan	Aguirre	nolanaguirre08@gmail.com	2019-02-22 20:27:27.681601-06	ftlc_owner
2a60ceea-2c29-494b-855c-df099493a67b	john	smith	bobby7083@gmail.com	2019-02-22 23:06:13.684144-06	ftlc_user
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.student (id, parent, first_name, last_name, date_of_birth) FROM stdin;
48e03b82-4c3f-43e4-9030-7e6b8705ca79	2a60ceea-2c29-494b-855c-df099493a67b	Asd	Asd	2019-02-23 00:45:29.226-06
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
96355527-3771-4064-8d8b-f9f73498349c	c385ff93-2d9e-4551-ab71-d8bcbc26484a	3ed1feb5-f5a6-4824-96e2-203b04e46fd5
f35f3d9b-7ec8-4470-9606-9d1aaeee48fc	c385ff93-2d9e-4551-ab71-d8bcbc26484a	2684a7c9-bd58-4b84-a669-d875aaa81de8
bdd67cbd-6125-4d6a-8844-44f6f1d42994	c385ff93-2d9e-4551-ab71-d8bcbc26484a	27ee8f18-47bd-42f7-88a2-c33aff6bfd34
5a931a40-b711-4524-918e-468a0db28f6b	c385ff93-2d9e-4551-ab71-d8bcbc26484a	0d36e36a-240c-4337-9566-526991e004ce
3a2948ea-464b-47ce-a183-41b90adc1e59	5813e0b2-4b89-4739-a2eb-bd4e2bad31e1	3ed1feb5-f5a6-4824-96e2-203b04e46fd5
c78256b1-6a31-4261-9b6e-868b52418d78	5813e0b2-4b89-4739-a2eb-bd4e2bad31e1	2684a7c9-bd58-4b84-a669-d875aaa81de8
9d733489-0d3d-4665-9af2-8d22f49e4991	5813e0b2-4b89-4739-a2eb-bd4e2bad31e1	27ee8f18-47bd-42f7-88a2-c33aff6bfd34
ab1b4054-50e6-41fa-bf7a-c30216731647	5813e0b2-4b89-4739-a2eb-bd4e2bad31e1	0d36e36a-240c-4337-9566-526991e004ce
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
13df4d21-2567-4b6e-8bdd-1795cc70c3db	48e03b82-4c3f-43e4-9030-7e6b8705ca79	asd	(121)-231-2312	(123)-123-1231	John Doe	Jown Do	none	2019-02-23 00:45:55.553058-06
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
6574a473-67a5-474c-a205-eb36221ac763	2a60ceea-2c29-494b-855c-df099493a67b	$2a$06$afuYhlhxqCU9EzkkPVb2t.BNOh5wwWgPT1SXRM4zN79PF2jMiK0Am	\N	\N
\.


--
-- PostgreSQL database dump complete
--
