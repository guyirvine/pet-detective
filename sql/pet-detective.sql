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

SELECT pg_catalog.setval('observation_seq', 9, true);


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
\.


--
-- Name: observationpayload_seq; Type: SEQUENCE SET; Schema: public; Owner: farmperformance
--

SELECT pg_catalog.setval('observationpayload_seq', 107, true);


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

