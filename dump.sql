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
-- Data for Name: activity_catagories; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activity_catagories (id, name, description, public_display) FROM stdin;
bbf21592-57c2-463a-b535-073f5ba15981	Labs	Our labs provide flexibility for each student to explore programming at a personalized pace suitable to him/her. Our coding labs are ongoing and meet year-round, so students can enroll at any time. Students are encouraged to explore technologies that interest them and work at a pace best-suited to their learning style. Our labs meet weekly for an hour each week. Students work on individual projects with assistance from an instructor. The student-to-instructor ratio is 3:1. New students can sign up for a one-hour free trial by calling us at 512-900-8380.	t
812099f3-f086-471b-aae7-4ee165e9f25b	Classes	Our group classes are instructor-led and cover a specific program or platform for a certain number of weeks. Classes include Introduction to Coding, Minecraft Mods in Java, Video Game Development, Scratch Programming, Python, Virtual Reality and others. Classes are held at our studio in Round Rock, unless otherwise indicated. If you don’t see a class that fits your family’s schedule, please let us know, as we often add classes based on feedback from parents.	t
5e26e859-42b6-42e0-a27e-d657171b495d	Workshops		t
258b0ff6-6f37-4fe5-865a-45c0315d70c8	Summer Camps	Our day camnpps are for children and teens ages 7-16 years old and are held from 9:00 am to 4:00 pm. Our next day camps will be offered on Monday, October 8 and Tuesday, October 9.	t
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activities (id, type, url, name, description, public_display, archive) FROM stdin;
42a565df-578b-42cc-9733-97b8b52e610a	bbf21592-57c2-463a-b535-073f5ba15981	http://fun2learncode.com/wp-content/uploads/2014/05/DSC_5710-web.jpg	Open Labs	Options for students include video game development, programming languages (Java or Python), web development, app development for mobile devices, Scratch programming, 3D design and animation, and more.	t	f
9ecde101-9df7-4547-98ef-1cc08705e855	5e26e859-42b6-42e0-a27e-d657171b495d	http://fun2learncode.com/wp-content/uploads/2015/09/IMG_20150615_093633325_400x225.jpg	Coding Night	Coding night is a full 2 and a half hours of coding and pizza fun Students will build a game in scratch while we provide pizza and guidance.	t	f
84b3af20-85ab-4352-8927-ea8fb8a8e7be	258b0ff6-6f37-4fe5-865a-45c0315d70c8	https://minecraft.net/static/pages/img/index-hero-og.088fb7996b03.jpg	 Minecraft Mods JR	Use our in house tool to create minecraft mods. This differs from our minecraft mods camp because this camp involves no coding, so anyone is able to create their very own minecraft mods. Meant for ages 7-10.	t	f
7c5f3ae5-45c7-4bc3-b26b-e847feea398e	258b0ff6-6f37-4fe5-865a-45c0315d70c8	https://minecraft.net/static/pages/img/index-hero-og.088fb7996b03.jpg	Minecraft Mods	Code your very own minecraft mods using java. Students will create sprites for, code and test their own mod to add tools, items and foods into their game	t	f
\.


--
-- Data for Name: activity_prerequisites; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.activity_prerequisites (id, activity, prerequisite) FROM stdin;
d45ee645-558a-4cf2-867c-db376e5f6c01	7c5f3ae5-45c7-4bc3-b26b-e847feea398e	84b3af20-85ab-4352-8927-ea8fb8a8e7be
\.


--
-- Data for Name: add_ons; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_ons (id, name, description, price) FROM stdin;
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.address (id, street, city, county, zipcode, state, country, alias, url, archive) FROM stdin;
9bcced56-818f-4545-af96-c8597de4c1ba	420 Chisholm Vally Dr	Round Rock	\N	78664	Texas	United States	Fun 2 Learn Code	http://fun2learncode.com/	f
a2146b66-7af2-4b72-a429-ebe5bb5bf1ac	11190 Circle Drive	Austin	\N	78736	Texas	United States	Del Sol	https://delsolaustin.com/	f
00bf266e-d81a-461b-8a9e-2730a920c084	2001 Justin Ln	Austin	\N	78757	Texas	United States	Toybrary	http://toybraryaustin.com/	f
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.events (id, event_type, open_registration, close_registration, archive) FROM stdin;
a568265b-a528-4272-b3f7-d6b8119a8ffd	42a565df-578b-42cc-9733-97b8b52e610a	2019-01-02 05:59:48	2019-12-02 05:59:48	f
d5db6ea5-7a1c-480d-8a43-4c42578b666a	9ecde101-9df7-4547-98ef-1cc08705e855	2019-01-02 05:59:54	2019-01-24 05:59:54	f
6170b380-934b-450c-bf77-aa96841b6223	84b3af20-85ab-4352-8927-ea8fb8a8e7be	2019-01-13 05:59:52	2019-08-01 04:59:52	f
5b3e92d8-fd58-4b80-9106-f41079ca69e9	7c5f3ae5-45c7-4bc3-b26b-e847feea398e	2019-01-02 05:59:44	2019-08-01 04:59:44	f
\.


--
-- Data for Name: date_group; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_group (id, event, address, open_registration, close_registration, capacity, seats_left, name, price, archive) FROM stdin;
a9bfccb9-ceaf-4931-89c2-b7ff7f370125	a568265b-a528-4272-b3f7-d6b8119a8ffd	9bcced56-818f-4545-af96-c8597de4c1ba	2018-12-02 05:59:50	2019-01-02 05:59:50	8	8	Sunday January Labs	100	f
1ad904e4-6912-4b0d-b58e-05b9ddb9e57c	a568265b-a528-4272-b3f7-d6b8119a8ffd	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:17	2019-03-02 05:59:17	8	8	Sunday March	100	f
830f422d-4a82-441b-b638-abf067c2ccf5	d5db6ea5-7a1c-480d-8a43-4c42578b666a	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:18	2019-01-25 05:59:18	8	8	January 	25	f
765d3d0c-b019-4bd7-ac05-6a61d3be3af7	6170b380-934b-450c-bf77-aa96841b6223	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:35	2019-06-02 04:59:35	8	8	June	250	f
fa2abb68-436d-4cfd-9104-0ee1a89f3048	6170b380-934b-450c-bf77-aa96841b6223	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:05	2019-06-16 04:59:05	8	8	June week 3	250	f
75c59fc9-eacb-4b2c-a392-d9600749e88d	5b3e92d8-fd58-4b80-9106-f41079ca69e9	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:42	2019-06-09 04:59:42	8	8	June week 2	300	f
5b1c75d3-3f3a-4357-94e4-af0bd176e29a	5b3e92d8-fd58-4b80-9106-f41079ca69e9	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:24	2019-06-23 04:59:24	8	8	Jun week 4	300	f
71a4bcf0-2f10-4ecb-bd48-3df49749391c	a568265b-a528-4272-b3f7-d6b8119a8ffd	9bcced56-818f-4545-af96-c8597de4c1ba	2019-01-02 05:59:28	2019-02-02 05:59:28	8	6	Sunday February Labs	100	f
\.


--
-- Data for Name: add_on_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.add_on_join (id, date_group, add_on) FROM stdin;
\.


--
-- Data for Name: date_interval; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.date_interval (id, start, "end", archive) FROM stdin;
71abe846-e107-4f51-be34-4b8d25510b9c	2019-01-06 16:00:00	2019-01-06 17:00:00	f
e40c9f7f-a0c8-482a-a235-541b979e4e2a	2019-01-13 16:00:00	2019-01-13 17:00:00	f
6fdc2b0f-bfa4-497c-b3f8-ec0f5f0793f9	2019-01-20 16:00:00	2019-01-20 17:00:00	f
e0be0687-d3f6-415d-b2e3-50b663e7a336	2019-01-27 16:00:00	2019-01-27 17:00:00	f
68e21b60-53eb-4b69-8f7d-64ae8b573faf	2019-02-03 16:00:00	2019-02-03 17:00:00	f
e943018f-7d58-4225-94a2-807b61fc775a	2019-02-10 16:00:00	2019-02-10 17:00:00	f
e27c3e31-7f15-4d6e-860c-83d294fc3fd7	2019-02-17 16:00:00	2019-02-17 17:00:00	f
80256130-6a26-4ae9-8171-e1217285bc0b	2019-02-24 16:00:00	2019-02-24 17:00:00	f
edd7b413-ef58-4a5f-9717-5f2cb7f5ce82	2019-03-03 16:00:00	2019-03-03 17:00:00	f
170e71fd-c2b7-4b50-a9bb-f6525fefaa8d	2019-03-10 15:00:00	2019-03-10 16:00:00	f
e12856e4-3b70-43f6-9d1a-2f05f9f4f8ea	2019-03-17 15:00:00	2019-03-17 16:00:00	f
ab0bcd91-275c-4a69-8a99-9876f5387cf6	2019-03-24 15:00:00	2019-03-24 16:00:00	f
bf6eecd7-987b-4dc1-8549-fb237fb61c5c	2019-03-31 15:00:00	2019-03-31 16:00:00	f
ce0f7869-ad70-4ea2-bf4a-63706a54a73a	2019-01-26 00:30:00	2019-01-26 03:00:00	f
a0d53b2d-eac8-4138-9152-6a43e9950afe	2019-06-03 14:00:00	2019-06-03 17:00:00	f
d0118881-d53c-4578-b8e9-bb50c0edd827	2019-06-04 14:00:00	2019-06-04 17:00:00	f
b124bea2-f028-4fcd-bd03-c1c9c0c7a579	2019-06-05 14:00:00	2019-06-05 17:00:00	f
57307530-d75f-407a-a6af-cf717bdcf1a0	2019-06-06 14:00:00	2019-06-06 17:00:00	f
fef1ed6c-3c43-4f40-b1eb-9709c11fc378	2019-06-07 14:00:00	2019-06-07 17:00:00	f
eb5264df-fdb6-48d2-8def-fe102746822d	2019-06-17 14:00:00	2019-06-17 17:00:00	f
59b42861-b1f4-4cb8-a0a8-7383a185fa4f	2019-06-18 14:00:00	2019-06-18 17:00:00	f
7f9bf677-9898-44e7-8b63-8bce801e2cb0	2019-06-19 14:00:00	2019-06-19 17:00:00	f
a37fc922-f3d2-4b37-9e27-73fb220484a5	2019-06-20 14:00:00	2019-06-20 17:00:00	f
a34196af-46cc-4ec8-b209-36d3edc71651	2019-06-21 14:00:00	2019-06-21 17:00:00	f
e65f9c34-b2b1-48fb-8663-93446847971b	2019-06-10 14:00:00	2019-06-10 17:00:00	f
6a69340c-d86d-41a7-b58d-946098375e82	2019-06-11 14:00:00	2019-06-11 17:00:00	f
5320c5e2-68c0-44d8-8f30-a0003d7a71a2	2019-06-12 14:00:00	2019-06-12 17:00:00	f
2100f70e-1d43-4848-9678-c31484374fb4	2019-06-13 14:00:00	2019-06-13 17:00:00	f
baf856c6-3a5d-41ce-a8e5-4abdb855994e	2019-06-14 14:00:00	2019-06-14 17:00:00	f
efda6a15-48e5-44a2-a64d-f8089a386da2	2019-06-24 14:00:00	2019-06-24 17:00:00	f
5f70fe08-c761-4923-98bd-92f8e7a0a6cd	2019-06-25 14:00:00	2019-06-25 17:00:00	f
cb243737-4338-4f62-a27c-967aed829282	2019-06-26 14:00:00	2019-06-26 17:00:00	f
57dc91c2-83e2-440b-88da-c04a8e97f696	2019-06-27 14:00:00	2019-06-27 17:00:00	f
93136a2a-ff93-4a80-874d-cabfb07d9289	2019-06-28 14:00:00	2019-06-28 17:00:00	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.users (id, first_name, last_name, created_on, role) FROM stdin;
b0b7dffd-f3db-48a4-8365-41a73071492a	Nolan	Aguirre	2019-01-19 18:11:14.101486	ftlc_admin
d4b27fb7-8bb0-49f5-aad6-d33d5e80d463	Manny	Castro	2019-01-19 18:11:14.11885	ftlc_owner
d365c527-a433-442e-8c17-6bd9171cffec	david	Koch	2019-01-19 18:11:14.127178	ftlc_instructor
803fced0-16b6-43b1-b4f7-6dc0a6a2207a	david	Koch	2019-01-19 18:11:14.133813	ftlc_lead_instructor
20fe1996-eacf-4d98-92ef-f9fb53d0ad96	fun2learncode	attendant	2019-01-19 18:11:14.13961	ftlc_attendant
adffb70b-b8c1-41a2-9957-ea9e72684b31	Sybill	Glover	2019-01-19 18:11:14.145297	ftlc_user
2b099a44-a22d-4629-902f-982ec65bfb96	Joelle	Miles	2019-01-19 18:11:14.15124	ftlc_user
a5089873-e28e-40ff-9937-a4d909d9892d	Dorian	Koch	2019-01-19 18:11:14.156416	ftlc_user
39e0a2f3-886f-40dc-a306-616727b75ced	Gail	Wall	2019-01-19 18:11:14.162522	ftlc_user
13196efa-e680-49d8-afec-5901d17e6f00	Candice	Cantrell	2019-01-19 18:11:14.167711	ftlc_user
b5dcddec-06af-40f5-a4a1-a64b595093e5	Castor	Roberson	2019-01-19 18:11:14.173048	ftlc_user
cd4288a7-ed63-487e-80e6-f5487c0f06d6	Cora	Guzman	2019-01-19 18:11:14.178503	ftlc_user
6742ab1c-4004-42a1-afcb-85002b8a7c69	Graham	Newman	2019-01-19 18:11:14.183731	ftlc_user
64ff67e4-1690-4065-af29-0ecfd97bb85b	Xandra	Schwartz	2019-01-19 18:11:14.189249	ftlc_user
734b6a2f-c8a6-4001-aa04-ae7747b10cf6	Whoopi	Walls	2019-01-19 18:11:14.202965	ftlc_user
1091d0e0-23e9-4a02-97f2-a94faacf6a65	Kibo	Morrison	2019-01-19 18:11:14.209608	ftlc_user
ec5ab84d-87c6-4710-b065-b31175140d6f	Priscilla	Riggs	2019-01-19 18:11:14.214929	ftlc_user
ef70f6f9-695d-4991-a22e-62978a8675d2	Reece	Mcconnell	2019-01-19 18:11:14.220122	ftlc_user
478b700a-e5b7-4caf-a091-dc3319c0114f	Evelyn	Sargent	2019-01-19 18:11:14.225108	ftlc_user
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.students (id, parent, first_name, last_name, date_of_birth) FROM stdin;
9f283045-642d-4da9-97a7-ea768d6bf553	adffb70b-b8c1-41a2-9957-ea9e72684b31	Dave	Glover	2019-01-20 00:12:34.802
5494f5b9-ea1b-4981-86b2-7f3c42cda058	adffb70b-b8c1-41a2-9957-ea9e72684b31	Sally	Glover	2009-07-08 23:12:34.802
203ad45c-35e5-487a-b72c-f7bf37aa4734	2b099a44-a22d-4629-902f-982ec65bfb96	Oscar	Miles	2000-07-06 23:13:37.327
c90122f5-0eb2-4d91-a264-737a2d2a736f	a5089873-e28e-40ff-9937-a4d909d9892d	Boa	Koch	2009-07-14 23:14:35.658
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.attendance (id, student, date_interval, date_group, present, check_in_time) FROM stdin;
\.


--
-- Data for Name: dates_join; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.dates_join (id, date_group, date_interval) FROM stdin;
a8fce1e6-2848-44ac-93cd-e7eae7161dc6	a9bfccb9-ceaf-4931-89c2-b7ff7f370125	71abe846-e107-4f51-be34-4b8d25510b9c
585e8957-d551-46c1-8bb3-b490c6df2013	a9bfccb9-ceaf-4931-89c2-b7ff7f370125	e40c9f7f-a0c8-482a-a235-541b979e4e2a
edfb4e13-4af7-4b85-9c24-87df03681372	a9bfccb9-ceaf-4931-89c2-b7ff7f370125	6fdc2b0f-bfa4-497c-b3f8-ec0f5f0793f9
ae142d26-706d-4d2c-aa0f-736d40f06f41	a9bfccb9-ceaf-4931-89c2-b7ff7f370125	e0be0687-d3f6-415d-b2e3-50b663e7a336
b7343136-706e-45b7-b4ba-821e42fa8181	71a4bcf0-2f10-4ecb-bd48-3df49749391c	68e21b60-53eb-4b69-8f7d-64ae8b573faf
aa890946-35eb-4ebe-8fdd-9cc42cb33598	71a4bcf0-2f10-4ecb-bd48-3df49749391c	e943018f-7d58-4225-94a2-807b61fc775a
72eee2df-d3d2-4f30-8f15-1a7d1c90f0bb	71a4bcf0-2f10-4ecb-bd48-3df49749391c	e27c3e31-7f15-4d6e-860c-83d294fc3fd7
5fdee8a6-c00c-4d51-acd7-5e85a3dc8494	71a4bcf0-2f10-4ecb-bd48-3df49749391c	80256130-6a26-4ae9-8171-e1217285bc0b
53259312-f25c-4fa5-9319-b2b5a9bf5f04	1ad904e4-6912-4b0d-b58e-05b9ddb9e57c	edd7b413-ef58-4a5f-9717-5f2cb7f5ce82
3774540b-e907-478c-a948-da18c2102f86	1ad904e4-6912-4b0d-b58e-05b9ddb9e57c	170e71fd-c2b7-4b50-a9bb-f6525fefaa8d
a7a741ab-8968-4ae0-ae65-c85ebca5a9de	1ad904e4-6912-4b0d-b58e-05b9ddb9e57c	e12856e4-3b70-43f6-9d1a-2f05f9f4f8ea
1440f7c1-3502-41da-afc2-a97296d2bd4a	1ad904e4-6912-4b0d-b58e-05b9ddb9e57c	ab0bcd91-275c-4a69-8a99-9876f5387cf6
f91abe3d-c11b-4688-b733-749f92875b4b	1ad904e4-6912-4b0d-b58e-05b9ddb9e57c	bf6eecd7-987b-4dc1-8549-fb237fb61c5c
bb4fc47d-85b2-4927-8d07-420d63074c1c	830f422d-4a82-441b-b638-abf067c2ccf5	ce0f7869-ad70-4ea2-bf4a-63706a54a73a
f94a237b-15f2-440e-8a4e-426fd5983055	765d3d0c-b019-4bd7-ac05-6a61d3be3af7	a0d53b2d-eac8-4138-9152-6a43e9950afe
a3c7a222-f118-400e-80b3-8ef54ee4eba5	765d3d0c-b019-4bd7-ac05-6a61d3be3af7	d0118881-d53c-4578-b8e9-bb50c0edd827
b4b2b68a-0483-41e0-8d02-613d03ae26d1	765d3d0c-b019-4bd7-ac05-6a61d3be3af7	b124bea2-f028-4fcd-bd03-c1c9c0c7a579
e7f40dce-d437-476d-ae26-d1f23e976c55	765d3d0c-b019-4bd7-ac05-6a61d3be3af7	57307530-d75f-407a-a6af-cf717bdcf1a0
0bc10cf0-5fe2-4d8b-ad13-ce73d795083a	765d3d0c-b019-4bd7-ac05-6a61d3be3af7	fef1ed6c-3c43-4f40-b1eb-9709c11fc378
ff883b77-6f05-4361-a009-dba8150b4207	fa2abb68-436d-4cfd-9104-0ee1a89f3048	eb5264df-fdb6-48d2-8def-fe102746822d
b904bd69-f422-40d7-b909-6207cb7f61b2	fa2abb68-436d-4cfd-9104-0ee1a89f3048	59b42861-b1f4-4cb8-a0a8-7383a185fa4f
2411542f-d9ec-4c9f-b22b-b92648c2552f	fa2abb68-436d-4cfd-9104-0ee1a89f3048	7f9bf677-9898-44e7-8b63-8bce801e2cb0
8aac11d9-9af4-4641-a935-e537786fb2ea	fa2abb68-436d-4cfd-9104-0ee1a89f3048	a37fc922-f3d2-4b37-9e27-73fb220484a5
933c4d26-ae9f-4209-90d4-cddb9f32e429	fa2abb68-436d-4cfd-9104-0ee1a89f3048	a34196af-46cc-4ec8-b209-36d3edc71651
3357bce0-1469-4756-b594-11bb85858f49	75c59fc9-eacb-4b2c-a392-d9600749e88d	e65f9c34-b2b1-48fb-8663-93446847971b
7d9c07b7-948e-4ac7-9f89-11e968f3b60f	75c59fc9-eacb-4b2c-a392-d9600749e88d	6a69340c-d86d-41a7-b58d-946098375e82
21d8b513-754f-461b-bcc8-d6dbf84b3224	75c59fc9-eacb-4b2c-a392-d9600749e88d	5320c5e2-68c0-44d8-8f30-a0003d7a71a2
1f6e6f67-5db7-48a4-8c60-d5f355174e2e	75c59fc9-eacb-4b2c-a392-d9600749e88d	2100f70e-1d43-4848-9678-c31484374fb4
dd7dab44-e3c0-4666-9a4b-d5ba681d748e	75c59fc9-eacb-4b2c-a392-d9600749e88d	baf856c6-3a5d-41ce-a8e5-4abdb855994e
6b2a7834-72ca-4ef4-b2f0-5964c92f3eab	5b1c75d3-3f3a-4357-94e4-af0bd176e29a	efda6a15-48e5-44a2-a64d-f8089a386da2
2aba24c1-9d35-4678-8977-c8aa17686198	5b1c75d3-3f3a-4357-94e4-af0bd176e29a	5f70fe08-c761-4923-98bd-92f8e7a0a6cd
91d9f069-2f9f-45b1-97dd-ef67fc21a274	5b1c75d3-3f3a-4357-94e4-af0bd176e29a	cb243737-4338-4f62-a27c-967aed829282
9333d1e0-47af-46ef-ae7f-c4327aea7e63	5b1c75d3-3f3a-4357-94e4-af0bd176e29a	57dc91c2-83e2-440b-88da-c04a8e97f696
1bd7621e-1bd7-4634-9087-8f734c00c335	5b1c75d3-3f3a-4357-94e4-af0bd176e29a	93136a2a-ff93-4a80-874d-cabfb07d9289
\.


--
-- Data for Name: event_logs; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_logs (id, date_group, date_interval, student, instructor, comment) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.payment (id, user_id, status, create_on, snapshot) FROM stdin;
02843cb0-daa3-4e8c-ab77-f440c17a6d94	adffb70b-b8c1-41a2-9957-ea9e72684b31	paid	2019-01-21 15:49:52.176674	{"dates": [{"id": "68e21b60-53eb-4b69-8f7d-64ae8b573faf", "end": "2019-02-03T23:00:00.000Z", "start": "2019-02-03T22:00:00.000Z", "archive": false}, {"id": "e943018f-7d58-4225-94a2-807b61fc775a", "end": "2019-02-10T23:00:00.000Z", "start": "2019-02-10T22:00:00.000Z", "archive": false}, {"id": "e27c3e31-7f15-4d6e-860c-83d294fc3fd7", "end": "2019-02-17T23:00:00.000Z", "start": "2019-02-17T22:00:00.000Z", "archive": false}, {"id": "80256130-6a26-4ae9-8171-e1217285bc0b", "end": "2019-02-24T23:00:00.000Z", "start": "2019-02-24T22:00:00.000Z", "archive": false}], "addons": [], "payment": {"total": 18000, "chargedTo": "4242"}, "activity": {"id": "42a565df-578b-42cc-9733-97b8b52e610a", "url": "http://fun2learncode.com/wp-content/uploads/2014/05/DSC_5710-web.jpg", "name": "Open Labs", "type": "bbf21592-57c2-463a-b535-073f5ba15981", "archive": false, "description": "Options for students include video game development, programming languages (Java or Python), web development, app development for mobile devices, Scratch programming, 3D design and animation, and more.", "public_display": true}, "students": [{"id": "9f283045-642d-4da9-97a7-ea768d6bf553", "parent": "adffb70b-b8c1-41a2-9957-ea9e72684b31", "last_name": "Glover", "first_name": "Dave", "date_of_birth": "2019-01-20T06:12:34.802Z"}, {"id": "5494f5b9-ea1b-4981-86b2-7f3c42cda058", "parent": "adffb70b-b8c1-41a2-9957-ea9e72684b31", "last_name": "Glover", "first_name": "Sally", "date_of_birth": "2009-07-09T04:12:34.802Z"}], "dateGroup": {"id": "71a4bcf0-2f10-4ecb-bd48-3df49749391c", "name": "Sunday February Labs", "event": "a568265b-a528-4272-b3f7-d6b8119a8ffd", "price": 100, "address": "9bcced56-818f-4545-af96-c8597de4c1ba", "archive": false, "capacity": 8, "seats_left": 8, "open_registration": "2019-01-02T11:59:28.000Z", "close_registration": "2019-02-02T11:59:28.000Z"}}
\.


--
-- Data for Name: event_registration; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.event_registration (id, registered_by, student, date_group, payment, registered_on) FROM stdin;
2c130171-136b-4037-b805-d2bae0783074	adffb70b-b8c1-41a2-9957-ea9e72684b31	9f283045-642d-4da9-97a7-ea768d6bf553	71a4bcf0-2f10-4ecb-bd48-3df49749391c	02843cb0-daa3-4e8c-ab77-f440c17a6d94	2019-01-21 15:49:52.187595
f143f5f3-421c-49c9-8d60-8844e861b365	adffb70b-b8c1-41a2-9957-ea9e72684b31	5494f5b9-ea1b-4981-86b2-7f3c42cda058	71a4bcf0-2f10-4ecb-bd48-3df49749391c	02843cb0-daa3-4e8c-ab77-f440c17a6d94	2019-01-21 15:49:52.187621
\.


--
-- Data for Name: promo_code; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.promo_code (id, code, for_catagory, for_event, for_user, percent, catagory, generated_by, event, user_id, effect, uses, created_on, valid_start, valid_end) FROM stdin;
\.


--
-- Data for Name: transaction_state; Type: TABLE DATA; Schema: ftlc; Owner: nolan
--

COPY ftlc.transaction_state (user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: ftlc_private; Owner: nolan
--

COPY ftlc_private.users (id, user_id, email, password_hash, credits, stripe_id) FROM stdin;
1dcbc498-afc3-46e4-bc7f-a4823e955521	b0b7dffd-f3db-48a4-8365-41a73071492a	admin@admin.com	$2a$06$SUYvf4jHJm2uJnF.JnXtHOBu3WlL14O2hNTiM74RcfhizWAJq5CAm	\N	\N
765e06ac-5c19-45fe-96a5-dea3851dabae	d4b27fb7-8bb0-49f5-aad6-d33d5e80d463	owner@owner.com	$2a$06$tyv59073aje6.eJNX32fru8pg9gff3qBWTAhV2I6r6K00SP7awpdW	\N	\N
a304037e-ccb5-42d5-a87d-f5d8454677d9	d365c527-a433-442e-8c17-6bd9171cffec	instructor@instructor.com	$2a$06$NeVxUv4Xzu/lXs.tsYG0fOHFCXeEuVI8SQjb0E4QYIgWC7FyZix56	\N	\N
1fc3910d-2897-428a-a25b-1b3f6eedc8af	803fced0-16b6-43b1-b4f7-6dc0a6a2207a	lead_instructor@email.com	$2a$06$EEyUvDhNR/e14dwnbu3GxezQhasmnlOtaq9kcAvMyGcJNTS/hKxS.	\N	\N
93aa4018-e0e4-4d95-be1b-d486912e592f	20fe1996-eacf-4d98-92ef-f9fb53d0ad96	attendant@attendant.com	$2a$06$6yCnUBru6OPfvGAYUGU34OVR4BPNCpvK09etS03H4L65o2l7nqN5q	\N	\N
84be68d7-9e95-4f2b-a1ec-53398d24839e	adffb70b-b8c1-41a2-9957-ea9e72684b31	email@email.com	$2a$06$Msqc4sD/QffLdLu5znxlU.1sCeLFmZsw7/hL2kAutYzkg2KscmTJ6	\N	\N
382d3796-dde0-41ec-9a7d-eed4ddf16270	2b099a44-a22d-4629-902f-982ec65bfb96	user@user.com	$2a$06$54Yp8qtNihp3PG6B17UKOer2wSbfBtY9lFWxy0bRTc/lnWiUx4.uC	\N	\N
00977fd6-f4b1-4f2d-8792-f51d817829cf	a5089873-e28e-40ff-9937-a4d909d9892d	DorianKoch@gmail.com	$2a$06$9vAT2paCDo0JpL5qVRflD.4ic5z489DHqRTdxgBCwe7s0Hj6thvGa	\N	\N
53ff81ac-79ad-4a49-93df-e3f6655a1d71	39e0a2f3-886f-40dc-a306-616727b75ced	GailWall99@hotmail.com	$2a$06$oJVf6RDQb5IHO/MzQDMvVumOCfD5EY2SbwtXxjDkWZWkijsbEY4hy	\N	\N
4648da13-7a09-4258-b56d-1251f979a7bc	13196efa-e680-49d8-afec-5901d17e6f00	augue.Sed@ipsumsodales.org	$2a$06$gjMw8r1UUYDTvfyKHo5nB.m5W/e0oZM3mCKH1V0UDYp4gDN6suRQm	\N	\N
12be363f-d2fd-45ef-b21c-cc2bb0e72610	b5dcddec-06af-40f5-a4a1-a64b595093e5	ipsum@sociisnatoquepenatibus.edu	$2a$06$AuySKxqJHsxleoLrZvhcluk7r6a7Y47LqlyUDzzHt/Q2UGlAYWXRK	\N	\N
554f0ec7-07c4-4fa4-a69c-8ee3efe4ba56	cd4288a7-ed63-487e-80e6-f5487c0f06d6	convallis.in@penatibus.net	$2a$06$bp0BgOEPIMC8RYn25zHyR.EsSvUc7ZxFAuUwA6uWZm1wvwyxCgpha	\N	\N
b5ac2370-e729-4945-b1fb-68939b091815	6742ab1c-4004-42a1-afcb-85002b8a7c69	amet.ultricies.sem@CuraePhasellusornare.org	$2a$06$f/xTCLGUmFhhj.WcY4ViVufovso7.6yaM/nMYZpjU663nNAuwYhKm	\N	\N
e00cd5b9-1991-4b52-911e-77656a9bc679	64ff67e4-1690-4065-af29-0ecfd97bb85b	adipiscing.Mauris.molestie@a.com	$2a$06$QO903gSZubMRtEnYxf/ECe9WCg79Mff7aWcz5HuwDdcSQUkDa3ZVe	\N	\N
e300fd03-bf02-4bf3-82d2-51408398c648	734b6a2f-c8a6-4001-aa04-ae7747b10cf6	nec@esttempor.co.uk	$2a$06$gFLeFWiJrKMbllpJr54hBePgKrfVAwBi19mDJ.kjgEP6RKiZyA7Xm	\N	\N
fadd6279-8d43-4b57-b131-ad1ebfc22452	1091d0e0-23e9-4a02-97f2-a94faacf6a65	ut.odio.vel@doloregestasrhoncus.org	$2a$06$Ccd1PCamc9Vf9NnNlXqAye7s3ZKDVMLlQG5GoMmomqx5p3tygLBBK	\N	\N
b389c80c-73f4-40d9-8b91-a3356247b0a4	ec5ab84d-87c6-4710-b065-b31175140d6f	magna.sed.dui@mattis.net	$2a$06$o25Z6G84p9gE0G60iJbWje2NJmqlVEpWMrF/oEfvutUAqvJ8fmJyO	\N	\N
73551a61-1929-4fa7-aff0-307b12869a88	ef70f6f9-695d-4991-a22e-62978a8675d2	Aliquam@luctussit.net	$2a$06$Nw0sm0EboP2J/Veq0ii1e.iNQ7x.7h/JOMcVNwkwKznFVgyqRvBdG	\N	\N
b895f0d4-d480-4c17-a1d0-b1950af82fc9	478b700a-e5b7-4caf-a091-dc3319c0114f	sagittis.augue.eu@feugiat.co.uk	$2a$06$uOtIi6hlzMXtnNfCN8Sn9OudPU8aEic/k/s5uudR4djQQ1XaT3yu2	\N	\N
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.projects (project, uri, created_at, creator_name, creator_email) FROM stdin;
ftlc	\N	2019-01-21 16:10:47.799521-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.changes (change_id, script_hash, change, project, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
7decbba512c319112815608f66d381cf987d32e9	1afd8802d010fddc77dc7d42b2fc76f5ec6533b5	appschema	ftlc	Add appschema migration	2019-01-19 18:11:10.661335-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
d29edad4f6b478766505320a6cf1697082283939	6b34c007d894e7c96b73c470577ce92f723246f8	roles	ftlc	Add roles migration	2019-01-19 18:11:10.721937-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	ce6c847b195fd015f117cd9156ddae574f7d8d14	extensions	ftlc	Add extensions migration	2019-01-19 18:11:10.798109-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
673830cd7cbaf27cd0570d313771c7439c81a909	b8f589aacacfa19d4e82fb859fb22845d2236ca1	types	ftlc	Add types migration	2019-01-19 18:11:10.860704-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
c8088d19b46572f24040ab2a661939c9da2db293	a95e67d9ac1343f9c8393f74e7562c30831d49f3	address	ftlc	Add address migration	2019-01-19 18:11:10.923429-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
0033c1184d1690315527b58ddfaae1cb8f3f3597	2f79281f2b87d42c3c42d3ad706098946e6e7f15	date_interval	ftlc	add event dates migration	2019-01-19 18:11:10.988803-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
51164b0dacbbb3d665314708b18c884a828fc5c5	99c958bb321ccff09baa845c06078b2000e1b07c	activity_catagories	ftlc	Add activity catagories migration	2019-01-19 18:11:11.069955-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
cc5e8cc0c8d9287de3cf230986dfc326894b833b	b465a910ab864b252bf9eeb9572f33c237e70888	add_ons	ftlc	Add add ons migration	2019-01-19 18:11:11.141733-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
aaeaa8196841111e5e8aa54c3f5249e824449ea9	ec673318ad51226c65fb47700c5b0e8c222f0d72	users	ftlc	add users migration	2019-01-19 18:11:11.213797-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
65c3ebd7eb131b87bc0ab9adedee222677a936a8	03e0d887d9272b2b206a0faae3b5ae8cc672aff4	activities	ftlc	add activities migration	2019-01-19 18:11:11.279766-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	c7bc7592a1fac2586249f8e07e7e76dfb0d1599b	transaction_state	ftlc	add transaction state migration	2019-01-19 18:11:11.348075-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	40c509302bd68288dd6c3ef53f0f36a5a5744861	users_private	ftlc	add users private migration	2019-01-19 18:11:11.435532-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
6d7dd7d324f49065d8223b51938fdc575dc55c3c	343a71eb671f0b4830fba3f70b28337288bf677a	students	ftlc	add students join migration	2019-01-19 18:11:11.497455-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
640409c61b5fea1e5a450dd13cf060978e60dc8c	f03ce4ba01fecc0e6e814f082d0be6603c52cad6	payment	ftlc	Add payment migration	2019-01-19 18:11:11.560234-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	0d87b88927f08154dd9980380b14f65fb856d7a5	activity_prerequisites	ftlc	Add prerequisites join migration	2019-01-19 18:11:11.620058-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	0eafaebdab0efd41af2b03d08c265565e305edc5	events	ftlc	add events migration	2019-01-19 18:11:11.680672-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
8fb2ad11b7b994513b2ba82f009ddb521df3eacd	adbf942accd8c2613441755845d9fd390bece717	date_group	ftlc	Add date group migration	2019-01-19 18:11:11.748408-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	aa00f35c5effb3c1b127fe28e65899c9d315357a	event_registration	ftlc	add event registration migration	2019-01-19 18:11:11.811032-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
c7b0e903ad0442afc1bb8ca777c4d300a18d432d	78162c0dfed0c889534e24cd08e33f294e11b4d6	event_logs	ftlc	add event logs migration	2019-01-19 18:11:11.876989-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
109ba3642d82d530bbeabeb9b26410cd6389d7fb	8172d75a5e1daee588d8d7fa8c3425f36198301e	dates_join	ftlc	Add join between date_group and date_inverval	2019-01-19 18:11:11.944969-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
83567d2e8d198908df2990c56157f1f4bce8e02d	d617c99997d2d42160a47a5f0a3e05b2037bc0ec	date_interval_functions	ftlc	Add date interval functions migration	2019-01-19 18:11:12.001262-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
e63d91afdeb92c9f30cf3ccef8b331a69950bef5	4181cb16e4478a9e9f6cc743b4d5320b52be0668	users_functions	ftlc	Add users functions migration	2019-01-19 18:11:12.051869-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
8d71b59b13d96d22558dcd80f4385c513b2c2bea	98be0da8195c2e55db942cd2e65bf6dba9adaded	event_functions	ftlc	Add event functions migration	2019-01-19 18:11:12.101728-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
81eb05fa65b62a991b8710bff9b559432af75328	820a22d8cabb237022d00e12e02c37a0b2373417	activities_functions	ftlc	Add activities functions migration	2019-01-19 18:11:12.146127-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
a3eb3777b370c2da532cd2d5dc5a69f892d57357	f674c80c67e08d0c0fcb106d34f526e96fc13c14	add_on_join	ftlc	Add add on join	2019-01-19 18:11:12.203413-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
06913818ab950b6e864081e43a275edf8b23f1c7	aed0bfbf542cd1355b55b16af15a67c38fffc00e	attendance	ftlc	Add attendance migration	2019-01-19 18:11:12.25887-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
36a1e102481004ed142daeb079065d333f4d615d	3a0c20f8023791eb54a5ef1673a72825bb5be13c	promo_code	ftlc	add promo code migration	2019-01-19 18:11:12.322224-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
ad63cc7a8c3e80506d918f0bc26359c61497173e	d28b26f88ef8c435539077f99505cdbcff4a9c4c	privileges	ftlc	Add priviliges migration	2019-01-19 18:11:12.377109-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	4a18e99d9a101c09db5c0f56684cc637b47cc758	RLS	ftlc	Row level security migration	2019-01-19 18:11:12.424866-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: dependencies; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.dependencies (change_id, type, dependency, dependency_id) FROM stdin;
673830cd7cbaf27cd0570d313771c7439c81a909	require	appschema	7decbba512c319112815608f66d381cf987d32e9
673830cd7cbaf27cd0570d313771c7439c81a909	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
c8088d19b46572f24040ab2a661939c9da2db293	require	appschema	7decbba512c319112815608f66d381cf987d32e9
c8088d19b46572f24040ab2a661939c9da2db293	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
0033c1184d1690315527b58ddfaae1cb8f3f3597	require	appschema	7decbba512c319112815608f66d381cf987d32e9
0033c1184d1690315527b58ddfaae1cb8f3f3597	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
51164b0dacbbb3d665314708b18c884a828fc5c5	require	appschema	7decbba512c319112815608f66d381cf987d32e9
51164b0dacbbb3d665314708b18c884a828fc5c5	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
cc5e8cc0c8d9287de3cf230986dfc326894b833b	require	extensions	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94
aaeaa8196841111e5e8aa54c3f5249e824449ea9	require	types	673830cd7cbaf27cd0570d313771c7439c81a909
65c3ebd7eb131b87bc0ab9adedee222677a936a8	require	activity_catagories	51164b0dacbbb3d665314708b18c884a828fc5c5
bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
6d7dd7d324f49065d8223b51938fdc575dc55c3c	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
640409c61b5fea1e5a450dd13cf060978e60dc8c	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	require	activities	65c3ebd7eb131b87bc0ab9adedee222677a936a8
a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	require	activities	65c3ebd7eb131b87bc0ab9adedee222677a936a8
a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	require	address	c8088d19b46572f24040ab2a661939c9da2db293
8fb2ad11b7b994513b2ba82f009ddb521df3eacd	require	events	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9
2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	require	events	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9
2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	require	students	6d7dd7d324f49065d8223b51938fdc575dc55c3c
2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	require	payment	640409c61b5fea1e5a450dd13cf060978e60dc8c
c7b0e903ad0442afc1bb8ca777c4d300a18d432d	require	events	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9
c7b0e903ad0442afc1bb8ca777c4d300a18d432d	require	students	6d7dd7d324f49065d8223b51938fdc575dc55c3c
109ba3642d82d530bbeabeb9b26410cd6389d7fb	require	date_group	8fb2ad11b7b994513b2ba82f009ddb521df3eacd
109ba3642d82d530bbeabeb9b26410cd6389d7fb	require	date_interval	0033c1184d1690315527b58ddfaae1cb8f3f3597
83567d2e8d198908df2990c56157f1f4bce8e02d	require	date_interval	0033c1184d1690315527b58ddfaae1cb8f3f3597
83567d2e8d198908df2990c56157f1f4bce8e02d	require	dates_join	109ba3642d82d530bbeabeb9b26410cd6389d7fb
e63d91afdeb92c9f30cf3ccef8b331a69950bef5	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
8d71b59b13d96d22558dcd80f4385c513b2c2bea	require	students	6d7dd7d324f49065d8223b51938fdc575dc55c3c
8d71b59b13d96d22558dcd80f4385c513b2c2bea	require	events	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9
81eb05fa65b62a991b8710bff9b559432af75328	require	activities	65c3ebd7eb131b87bc0ab9adedee222677a936a8
81eb05fa65b62a991b8710bff9b559432af75328	require	activity_prerequisites	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2
a3eb3777b370c2da532cd2d5dc5a69f892d57357	require	date_group	8fb2ad11b7b994513b2ba82f009ddb521df3eacd
a3eb3777b370c2da532cd2d5dc5a69f892d57357	require	add_ons	cc5e8cc0c8d9287de3cf230986dfc326894b833b
06913818ab950b6e864081e43a275edf8b23f1c7	require	date_interval	0033c1184d1690315527b58ddfaae1cb8f3f3597
06913818ab950b6e864081e43a275edf8b23f1c7	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
36a1e102481004ed142daeb079065d333f4d615d	require	date_group	8fb2ad11b7b994513b2ba82f009ddb521df3eacd
36a1e102481004ed142daeb079065d333f4d615d	require	users	aaeaa8196841111e5e8aa54c3f5249e824449ea9
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.events (event, change_id, change, project, note, requires, conflicts, tags, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-21 16:10:47.870365-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-21 16:10:47.923004-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-21 16:10:47.989399-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-21 16:10:48.043536-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-21 16:10:48.113396-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-21 16:10:48.179038-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-21 16:10:48.262302-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-21 16:10:48.338198-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-21 16:10:48.40791-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-21 16:10:48.476572-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-21 16:10:48.532862-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-21 16:10:48.616489-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-21 16:10:48.682831-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-21 16:10:48.758521-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-21 16:10:48.822183-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-21 16:10:48.87986-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-21 16:10:48.939563-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-21 16:10:49.001383-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-21 16:10:49.063538-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-21 16:10:49.12814-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-21 16:10:49.18702-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-21 16:10:49.251581-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-21 16:10:49.315221-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-21 16:10:49.375915-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-21 16:10:49.43437-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-21 16:10:49.496991-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-21 16:10:49.564463-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-21 16:10:49.616683-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-21 16:10:49.664397-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-21 16:13:38.558617-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-21 16:13:38.610691-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-21 16:13:38.657737-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-21 16:13:38.713009-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-21 16:13:38.762694-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-21 16:13:38.811072-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-21 16:13:38.855242-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-21 16:13:38.901185-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-21 16:13:38.94679-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-21 16:13:38.993329-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-21 16:13:39.046095-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-21 16:13:39.091943-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-21 16:13:39.136788-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-21 16:13:39.183033-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-21 16:13:39.234617-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-21 16:13:39.281326-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-21 16:13:39.330655-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-21 16:13:39.381551-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-21 16:13:39.436978-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-21 16:13:39.483312-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-21 16:13:39.534846-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-21 16:13:39.580107-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-21 16:13:39.639623-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-21 16:13:39.704956-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-21 16:13:39.754552-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-21 16:13:39.799052-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-21 16:13:39.853093-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-21 16:13:39.899735-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-21 16:13:39.950137-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:09:23.138175-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
fail	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-18 23:09:23.179722-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:09:23.225938-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:10:16.43546-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-18 23:10:16.488535-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-18 23:10:16.547761-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:16.602082-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:16.670017-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:16.728503-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:16.798659-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-18 23:10:16.865994-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-18 23:10:16.935539-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-18 23:10:17.007083-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-18 23:10:17.073007-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-18 23:10:17.159707-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-18 23:10:17.233036-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-18 23:10:17.310382-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-18 23:10:17.374464-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-18 23:10:17.438214-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-18 23:10:17.506642-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-18 23:10:17.571477-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-18 23:10:17.64746-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-18 23:10:17.718934-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-18 23:10:17.778668-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-18 23:10:17.82892-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-18 23:10:17.875158-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-18 23:10:17.91801-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-18 23:10:17.983873-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-18 23:10:18.050691-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-18 23:10:18.122754-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-18 23:10:18.180667-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-18 23:10:18.234221-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-18 23:10:24.565045-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-18 23:10:24.628655-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-18 23:10:24.678513-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-18 23:10:24.729918-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-18 23:10:24.787731-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-18 23:10:24.837771-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-18 23:10:24.883793-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-18 23:10:24.934292-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-18 23:10:24.986851-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-18 23:10:25.044745-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-18 23:10:25.091713-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-18 23:10:25.138523-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-18 23:10:25.185641-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-18 23:10:25.241759-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-18 23:10:25.292342-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-18 23:10:25.353632-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-18 23:10:25.410381-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-18 23:10:25.465306-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-18 23:10:25.525641-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-18 23:10:25.582877-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-18 23:10:25.629018-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-18 23:10:25.674915-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:25.722028-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:25.774462-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:25.825198-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:25.8818-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-18 23:10:25.931584-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-18 23:10:25.976767-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:10:26.022167-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:10:43.868735-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-18 23:10:43.924753-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-18 23:10:43.985649-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:44.041943-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:44.102281-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:44.161317-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:44.230344-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-18 23:10:44.287548-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-18 23:10:44.357134-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-18 23:10:44.423082-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-18 23:10:44.4788-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-18 23:10:44.550189-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-18 23:10:44.619396-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-18 23:10:44.679296-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-18 23:10:44.736297-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-18 23:10:44.786463-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-18 23:10:44.846451-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-18 23:10:44.910115-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-18 23:10:44.976404-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-18 23:10:45.053857-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-18 23:10:45.114313-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-18 23:10:45.172038-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-18 23:10:45.218591-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-18 23:10:45.261964-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-18 23:10:45.318955-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-18 23:10:45.375966-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-18 23:10:45.439032-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-18 23:10:45.500265-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-18 23:10:45.569739-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-18 23:10:49.537884-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-18 23:10:49.58538-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-18 23:10:49.638082-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-18 23:10:49.685449-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-18 23:10:49.737466-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-18 23:10:49.78216-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-18 23:10:49.832606-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-18 23:10:49.878962-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-18 23:10:49.930572-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-18 23:10:49.977152-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-18 23:10:50.029369-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-18 23:10:50.075753-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-18 23:10:50.121819-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-18 23:10:50.169294-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-18 23:10:50.243719-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-18 23:10:50.398694-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-18 23:10:50.636272-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-18 23:10:50.887003-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-18 23:10:50.964125-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-18 23:10:51.030072-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-18 23:10:51.082145-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-18 23:10:51.1278-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:51.260874-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:51.354331-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:51.447832-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:51.526986-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-18 23:10:51.645005-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-18 23:10:51.730277-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:10:51.783653-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-18 23:10:52.25106-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-18 23:10:52.299469-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-18 23:10:52.386004-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:52.464223-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:52.534678-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:52.606034-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-18 23:10:52.705181-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-18 23:10:52.779368-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-18 23:10:52.868386-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-18 23:10:52.932632-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-18 23:10:52.993996-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-18 23:10:53.062545-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-18 23:10:53.153083-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-18 23:10:53.237313-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-18 23:10:53.302041-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-18 23:10:53.382443-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-18 23:10:53.462023-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-18 23:10:53.524855-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-18 23:10:53.613612-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-18 23:10:53.697421-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-18 23:10:53.753783-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-18 23:10:53.809663-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-18 23:10:53.884609-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-18 23:10:53.940417-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-18 23:10:53.993824-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-18 23:10:54.054764-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-18 23:10:54.120076-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-18 23:10:54.194492-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-18 23:10:54.25877-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-19 18:00:39.840518-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-19 18:00:39.886651-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-19 18:00:39.942754-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-19 18:00:39.98538-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-19 18:00:40.027678-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-19 18:00:40.06721-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-19 18:00:40.109297-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-19 18:00:40.151267-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-19 18:00:40.192462-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-19 18:00:40.23929-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-19 18:00:40.289873-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-19 18:00:40.35182-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-19 18:00:40.403093-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-19 18:00:40.460293-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-19 18:00:40.505286-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-19 18:00:40.555126-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-19 18:00:40.60119-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-19 18:00:40.651409-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-19 18:00:40.697593-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-19 18:00:40.745085-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-19 18:00:40.790568-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-19 18:00:40.850901-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:40.899777-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:40.946653-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:41.007073-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:41.063118-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-19 18:00:41.120049-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-19 18:00:41.176165-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-19 18:00:41.222168-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-19 18:00:41.595429-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-19 18:00:41.646611-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-19 18:00:41.720838-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:41.771934-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:41.833896-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:41.900497-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-19 18:00:41.995484-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-19 18:00:42.077246-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-19 18:00:42.146201-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-19 18:00:42.224023-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-19 18:00:42.292653-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-19 18:00:42.370728-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-19 18:00:42.434247-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-19 18:00:42.512175-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-19 18:00:42.581355-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-19 18:00:42.639633-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-19 18:00:42.707-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-19 18:00:42.772332-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-19 18:00:42.836225-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-19 18:00:42.907792-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-19 18:00:42.965158-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-19 18:00:43.012369-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-19 18:00:43.057293-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-19 18:00:43.100886-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-19 18:00:43.156496-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-19 18:00:43.211962-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-19 18:00:43.283684-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-19 18:00:43.338917-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-19 18:00:43.387072-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-19 18:11:08.910278-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-19 18:11:08.962221-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-19 18:11:09.009895-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-19 18:11:09.061352-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-19 18:11:09.107744-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-19 18:11:09.156955-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-19 18:11:09.20255-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-19 18:11:09.252818-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-19 18:11:09.29852-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-19 18:11:09.353844-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-19 18:11:09.400603-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-19 18:11:09.453068-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-19 18:11:09.500261-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-19 18:11:09.562938-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-19 18:11:09.613089-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-19 18:11:09.660593-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-19 18:11:09.713322-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-19 18:11:09.759981-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-19 18:11:09.809928-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-19 18:11:09.855742-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-19 18:11:09.906235-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-19 18:11:09.953008-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
revert	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.013711-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.061275-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.116644-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.166949-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-19 18:11:10.216711-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-19 18:11:10.267152-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
revert	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-19 18:11:10.313159-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	7decbba512c319112815608f66d381cf987d32e9	appschema	ftlc	Add appschema migration	{}	{}	{}	2019-01-19 18:11:10.662339-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:39:35-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	d29edad4f6b478766505320a6cf1697082283939	roles	ftlc	Add roles migration	{}	{}	{}	2019-01-19 18:11:10.722554-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:42:17-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	de00f1ff87b0f8395b345bc31e55ebe5ab96aa94	extensions	ftlc	Add extensions migration	{}	{}	{}	2019-01-19 18:11:10.7989-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:43:33-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	673830cd7cbaf27cd0570d313771c7439c81a909	types	ftlc	Add types migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.861998-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:55:30-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c8088d19b46572f24040ab2a661939c9da2db293	address	ftlc	Add address migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.925413-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:45:58-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	0033c1184d1690315527b58ddfaae1cb8f3f3597	date_interval	ftlc	add event dates migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:10.99041-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:20:22-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	51164b0dacbbb3d665314708b18c884a828fc5c5	activity_catagories	ftlc	Add activity catagories migration	{appschema,extensions}	{}	{}	2019-01-19 18:11:11.072559-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-04 22:50:25-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	cc5e8cc0c8d9287de3cf230986dfc326894b833b	add_ons	ftlc	Add add ons migration	{extensions}	{}	{}	2019-01-19 18:11:11.143999-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:04:06-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	aaeaa8196841111e5e8aa54c3f5249e824449ea9	users	ftlc	add users migration	{types}	{}	{}	2019-01-19 18:11:11.215293-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 19:57:32-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	65c3ebd7eb131b87bc0ab9adedee222677a936a8	activities	ftlc	add activities migration	{activity_catagories}	{}	{}	2019-01-19 18:11:11.281387-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:12:18-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	bd898d4811a5ef901ad72aa5ba7cbbb99e9a4618	transaction_state	ftlc	add transaction state migration	{users}	{}	{}	2019-01-19 18:11:11.350109-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-15 00:50:30-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	123a3b001adbe4ca5c85ebc4f81464a8ae508a4a	users_private	ftlc	add users private migration	{users}	{}	{}	2019-01-19 18:11:11.436561-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:01:46-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6d7dd7d324f49065d8223b51938fdc575dc55c3c	students	ftlc	add students join migration	{users}	{}	{}	2019-01-19 18:11:11.498955-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:07:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	640409c61b5fea1e5a450dd13cf060978e60dc8c	payment	ftlc	Add payment migration	{users}	{}	{}	2019-01-19 18:11:11.561276-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:00:24-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	29a1eb4173ffb2e82c63b76d2ab70be31d5df3b2	activity_prerequisites	ftlc	Add prerequisites join migration	{activities}	{}	{}	2019-01-19 18:11:11.621093-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-30 19:24:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a0ded0231be3718c1e832e1a9768d7d8fffbd4b9	events	ftlc	add events migration	{activities,address}	{}	{}	2019-01-19 18:11:11.682389-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:17:09-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8fb2ad11b7b994513b2ba82f009ddb521df3eacd	date_group	ftlc	Add date group migration	{events}	{}	{}	2019-01-19 18:11:11.749934-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:26:14-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	2e6b35f4ae5e2c1dd0c06d432432fe1f6fe783e5	event_registration	ftlc	add event registration migration	{events,students,payment}	{}	{}	2019-01-19 18:11:11.812949-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:47:38-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	c7b0e903ad0442afc1bb8ca777c4d300a18d432d	event_logs	ftlc	add event logs migration	{events,students}	{}	{}	2019-01-19 18:11:11.878542-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-08-28 20:42:27-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	109ba3642d82d530bbeabeb9b26410cd6389d7fb	dates_join	ftlc	Add join between date_group and date_inverval	{date_group,date_interval}	{}	{}	2019-01-19 18:11:11.946929-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-21 14:30:00-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	83567d2e8d198908df2990c56157f1f4bce8e02d	date_interval_functions	ftlc	Add date interval functions migration	{date_interval,dates_join}	{}	{}	2019-01-19 18:11:12.002206-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 16:16:20-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	e63d91afdeb92c9f30cf3ccef8b331a69950bef5	users_functions	ftlc	Add users functions migration	{users}	{}	{}	2019-01-19 18:11:12.052881-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 21:26:44-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	8d71b59b13d96d22558dcd80f4385c513b2c2bea	event_functions	ftlc	Add event functions migration	{students,events}	{}	{}	2019-01-19 18:11:12.102687-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-13 22:44:41-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	81eb05fa65b62a991b8710bff9b559432af75328	activities_functions	ftlc	Add activities functions migration	{activities,activity_prerequisites}	{}	{}	2019-01-19 18:11:12.147156-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-25 12:35:51-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	a3eb3777b370c2da532cd2d5dc5a69f892d57357	add_on_join	ftlc	Add add on join	{date_group,add_ons}	{}	{}	2019-01-19 18:11:12.204366-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:08:09-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	06913818ab950b6e864081e43a275edf8b23f1c7	attendance	ftlc	Add attendance migration	{date_interval,users}	{}	{}	2019-01-19 18:11:12.260776-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-12-13 13:11:56-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	36a1e102481004ed142daeb079065d333f4d615d	promo_code	ftlc	add promo code migration	{date_group,users}	{}	{}	2019-01-19 18:11:12.323797-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-13 15:47:14-06	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	ad63cc7a8c3e80506d918f0bc26359c61497173e	privileges	ftlc	Add priviliges migration	{}	{}	{}	2019-01-19 18:11:12.377811-06	Nolan Aguirre	nolanaguirre08@gmail.com	2018-09-06 22:13:43-05	Nolan Aguirre	nolanaguirre08@gmail.com
deploy	6b077a11e51e56c82fbe31b6cd735c6c5086cd9c	RLS	ftlc	Row level security migration	{}	{}	{}	2019-01-19 18:11:12.425458-06	Nolan Aguirre	nolanaguirre08@gmail.com	2019-01-16 20:06:50-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: releases; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.releases (version, installed_at, installer_name, installer_email) FROM stdin;
1.10000002	2019-01-21 16:10:47.795455-06	Nolan Aguirre	nolanaguirre08@gmail.com
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: sqitch; Owner: nolan
--

COPY sqitch.tags (tag_id, tag, project, change_id, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

