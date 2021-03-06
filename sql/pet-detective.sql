--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: observation_seq; Type: SEQUENCE; Schema: public; Owner: farmperformance
--

CREATE SEQUENCE observation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_seq OWNER TO farmperformance;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: observation_tbl; Type: TABLE; Schema: public; Owner: farmperformance; Tablespace: 
--

CREATE TABLE observation_tbl (
    id numeric DEFAULT nextval('observation_seq'::regclass) NOT NULL,
    app_key character varying NOT NULL,
    mon_key character varying NOT NULL,
    sent timestamp without time zone NOT NULL,
    received timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.observation_tbl OWNER TO farmperformance;

--
-- Name: observationpayload_seq; Type: SEQUENCE; Schema: public; Owner: farmperformance
--

CREATE SEQUENCE observationpayload_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observationpayload_seq OWNER TO farmperformance;

--
-- Name: observationpayload_tbl; Type: TABLE; Schema: public; Owner: farmperformance; Tablespace: 
--

CREATE TABLE observationpayload_tbl (
    id numeric DEFAULT nextval('observationpayload_seq'::regclass) NOT NULL,
    observation_id numeric,
    key character varying,
    value character varying
);


ALTER TABLE public.observationpayload_tbl OWNER TO farmperformance;

--
-- Name: observation_seq; Type: SEQUENCE SET; Schema: public; Owner: farmperformance
--

SELECT pg_catalog.setval('observation_seq', 18, true);


--
-- Data for Name: observation_tbl; Type: TABLE DATA; Schema: public; Owner: farmperformance
--

COPY observation_tbl (id, app_key, mon_key, sent, received) FROM stdin;
1	2	2	2015-03-27 00:00:00	2015-03-29 18:54:27.059586
2	fps	beanstalk	2015-03-29 19:12:14	2015-03-29 19:12:14.410012
3	fp-server	beanstalk	2015-03-29 20:03:52	2015-03-29 20:03:52.494549
4	fp-server	beanstalk	2015-03-30 00:00:01	2015-03-30 00:00:01.522063
5	galvatron	beanstalk	2015-03-30 00:00:02	2015-03-30 00:00:29.240541
6	fp-server	beanstalk	2015-03-30 04:00:02	2015-03-30 04:00:02.475647
7	galvatron	beanstalk	2015-03-30 04:00:02	2015-03-30 04:00:29.339842
8	fp-server	beanstalk	2015-03-30 08:00:01	2015-03-30 08:00:01.830319
9	galvatron	beanstalk	2015-03-30 08:00:03	2015-03-30 08:00:30.726414
10	fp-server	beanstalk	2015-03-30 10:15:11	2015-03-30 10:15:11.776097
11	galvatron	beanstalk	2015-03-30 11:36:54	2015-03-30 11:37:22.428741
12	fp-server	beanstalk	2015-03-30 11:37:53	2015-03-30 11:37:53.450678
13	fp-server	beanstalk	2015-03-30 12:00:01	2015-03-30 12:00:01.438358
14	galvatron	beanstalk	2015-03-30 12:00:01	2015-03-30 12:00:29.720156
15	fp-server	beanstalk	2015-03-30 16:00:01	2015-03-30 16:00:02.198767
16	galvatron	beanstalk	2015-03-30 16:00:01	2015-03-30 16:00:30.092612
17	fp-server	beanstalk	2015-03-30 20:00:01	2015-03-30 20:00:01.895074
18	galvatron	beanstalk	2015-03-30 20:00:02	2015-03-30 20:00:31.472413
\.


--
-- Name: observationpayload_seq; Type: SEQUENCE SET; Schema: public; Owner: farmperformance
--

SELECT pg_catalog.setval('observationpayload_seq', 243, true);


--
-- Data for Name: observationpayload_tbl; Type: TABLE DATA; Schema: public; Owner: farmperformance
--

COPY observationpayload_tbl (id, observation_id, key, value) FROM stdin;
1	1	field1	\N
2	1	field2	\N
3	2	default	\N
4	2	error	\N
5	2	Production	\N
6	3	default	\N
7	3	error	\N
8	3	Production	\N
9	4	default	\N
10	4	error	\N
11	4	Production	\N
12	5	default	\N
13	5	WeightProdAudit	\N
14	5	ReproData	\N
15	5	Mating	\N
16	5	MINDAQueries	\N
17	5	auditweight	\N
18	5	Vetdata	\N
19	5	Dal	\N
20	5	HerdService	\N
21	5	Event	\N
22	5	VetData	\N
23	5	error	\N
24	5	PasturePerformance	\N
25	5	Datasourcing	\N
26	5	Liveweight	\N
27	5	Herd	\N
28	5	AnimalGroupMembership	\N
29	5	Calving	\N
30	5	Health	\N
31	5	Production	\N
32	5	PregnancyDiagnosis	\N
33	5	DAL	\N
34	5	agrimetrics-bcsperformance	\N
35	5	Weight	\N
36	5	CustomerCareService	\N
37	5	WeightProd	\N
38	5	HerdImprovement	\N
39	5	Data	\N
40	5	ItOpsServiceM	\N
41	5	Firehose3	\N
42	6	default	\N
43	6	error	\N
44	6	Production	\N
45	7	default	\N
46	7	WeightProdAudit	\N
47	7	ReproData	\N
48	7	Mating	\N
49	7	MINDAQueries	\N
50	7	auditweight	\N
51	7	Vetdata	\N
52	7	Dal	\N
53	7	HerdService	\N
54	7	Event	\N
55	7	VetData	\N
56	7	error	\N
57	7	PasturePerformance	\N
58	7	Datasourcing	\N
59	7	Liveweight	\N
60	7	Herd	\N
61	7	AnimalGroupMembership	\N
62	7	Calving	\N
63	7	Health	\N
64	7	Production	\N
65	7	PregnancyDiagnosis	\N
66	7	DAL	\N
67	7	agrimetrics-bcsperformance	\N
68	7	Weight	\N
69	7	CustomerCareService	\N
70	7	WeightProd	\N
71	7	HerdImprovement	\N
72	7	Data	\N
73	7	ItOpsServiceM	\N
74	7	Firehose3	\N
75	8	default	\N
76	8	error	\N
77	8	Production	\N
78	9	default	\N
79	9	WeightProdAudit	\N
80	9	ReproData	\N
81	9	Mating	\N
82	9	MINDAQueries	\N
83	9	auditweight	\N
84	9	Vetdata	\N
85	9	Dal	\N
86	9	HerdService	\N
87	9	Event	\N
88	9	VetData	\N
89	9	error	\N
90	9	PasturePerformance	\N
91	9	Datasourcing	\N
92	9	Liveweight	\N
93	9	Herd	\N
94	9	AnimalGroupMembership	\N
95	9	Calving	\N
96	9	Health	\N
97	9	Production	\N
98	9	PregnancyDiagnosis	\N
99	9	DAL	\N
100	9	agrimetrics-bcsperformance	\N
101	9	Weight	\N
102	9	CustomerCareService	\N
103	9	WeightProd	\N
104	9	HerdImprovement	\N
105	9	Data	\N
106	9	ItOpsServiceM	\N
107	9	Firehose3	\N
108	10	default	0
109	10	error	72
110	10	Production	0
111	11	default	0
112	11	WeightProdAudit	8848
113	11	ReproData	220
114	11	Mating	0
115	11	MINDAQueries	0
116	11	auditweight	15
117	11	Vetdata	3
118	11	Dal	1
119	11	HerdService	1
120	11	Event	1
121	11	VetData	4
122	11	error	6
123	11	PasturePerformance	0
124	11	Datasourcing	18
125	11	Liveweight	0
126	11	Herd	0
127	11	AnimalGroupMembership	0
128	11	Calving	0
129	11	Health	0
130	11	Production	0
131	11	PregnancyDiagnosis	0
132	11	DAL	0
133	11	agrimetrics-bcsperformance	0
134	11	Weight	0
135	11	CustomerCareService	0
136	11	WeightProd	0
137	11	HerdImprovement	0
138	11	Data	0
139	11	ItOpsServiceM	0
140	11	Firehose3	0
141	12	default	0
142	12	error	72
143	12	Production	0
144	13	default	0
145	13	error	72
146	13	Production	0
147	14	default	0
148	14	WeightProdAudit	8848
149	14	ReproData	220
150	14	Mating	0
151	14	MINDAQueries	0
152	14	auditweight	15
153	14	Vetdata	3
154	14	Dal	1
155	14	HerdService	1
156	14	Event	1
157	14	VetData	4
158	14	error	6
159	14	PasturePerformance	0
160	14	Datasourcing	18
161	14	Liveweight	0
162	14	Herd	0
163	14	AnimalGroupMembership	0
164	14	Calving	0
165	14	Health	0
166	14	Production	0
167	14	PregnancyDiagnosis	0
168	14	DAL	0
169	14	agrimetrics-bcsperformance	0
170	14	Weight	0
171	14	CustomerCareService	0
172	14	WeightProd	0
173	14	HerdImprovement	0
174	14	Data	0
175	14	ItOpsServiceM	0
176	14	Firehose3	0
177	15	default	0
178	15	error	72
179	15	Production	0
180	16	default	0
181	16	WeightProdAudit	8848
182	16	ReproData	220
183	16	Mating	0
184	16	MINDAQueries	0
185	16	auditweight	15
186	16	Vetdata	3
187	16	Dal	1
188	16	HerdService	1
189	16	Event	1
190	16	VetData	4
191	16	error	6
192	16	PasturePerformance	0
193	16	Datasourcing	18
194	16	Liveweight	0
195	16	Herd	0
196	16	AnimalGroupMembership	0
197	16	Calving	0
198	16	Health	0
199	16	Production	0
200	16	PregnancyDiagnosis	0
201	16	DAL	0
202	16	agrimetrics-bcsperformance	0
203	16	Weight	0
204	16	CustomerCareService	0
205	16	WeightProd	0
206	16	HerdImprovement	0
207	16	Data	0
208	16	ItOpsServiceM	0
209	16	Firehose3	0
210	16	AgrivetricsData	1
211	17	default	0
212	17	error	0
213	17	Production	0
214	18	default	0
215	18	AgrivetricsData	1
216	18	ReproData	220
217	18	Mating	0
218	18	MINDAQueries	0
219	18	auditweight	15
220	18	Vetdata	3
221	18	Dal	1
222	18	HerdService	1
223	18	Event	1
224	18	VetData	4
225	18	error	6
226	18	PasturePerformance	0
227	18	Datasourcing	0
228	18	Liveweight	0
229	18	Herd	0
230	18	AnimalGroupMembership	0
231	18	Calving	0
232	18	Health	0
233	18	Production	0
234	18	PregnancyDiagnosis	0
235	18	DAL	0
236	18	agrimetrics-bcsperformance	0
237	18	Weight	0
238	18	CustomerCareService	0
239	18	WeightProd	0
240	18	HerdImprovement	0
241	18	Data	0
242	18	ItOpsServiceM	0
243	18	Firehose3	0
\.


--
-- Name: observation_tbl_pkey; Type: CONSTRAINT; Schema: public; Owner: farmperformance; Tablespace: 
--

ALTER TABLE ONLY observation_tbl
    ADD CONSTRAINT observation_tbl_pkey PRIMARY KEY (id);


--
-- Name: observationpayload_tbl_pkey; Type: CONSTRAINT; Schema: public; Owner: farmperformance; Tablespace: 
--

ALTER TABLE ONLY observationpayload_tbl
    ADD CONSTRAINT observationpayload_tbl_pkey PRIMARY KEY (id);


--
-- Name: observationpaylad_observation_fk; Type: FK CONSTRAINT; Schema: public; Owner: farmperformance
--

ALTER TABLE ONLY observationpayload_tbl
    ADD CONSTRAINT observationpaylad_observation_fk FOREIGN KEY (observation_id) REFERENCES observation_tbl(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

