--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.3 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BusinessPlan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BusinessPlan" (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public."BusinessPlan" OWNER TO postgres;

--
-- Name: BusinessPlanQuetion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BusinessPlanQuetion" (
    id integer NOT NULL,
    question text NOT NULL,
    "businessPlanId" integer NOT NULL
);


ALTER TABLE public."BusinessPlanQuetion" OWNER TO postgres;

--
-- Name: BusinessPlanQuetion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BusinessPlanQuetion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BusinessPlanQuetion_id_seq" OWNER TO postgres;

--
-- Name: BusinessPlanQuetion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BusinessPlanQuetion_id_seq" OWNED BY public."BusinessPlanQuetion".id;


--
-- Name: BusinessPlanValue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BusinessPlanValue" (
    id integer NOT NULL,
    value text NOT NULL,
    "businessPlanQuetionId" integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."BusinessPlanValue" OWNER TO postgres;

--
-- Name: BusinessPlanValue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BusinessPlanValue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BusinessPlanValue_id_seq" OWNER TO postgres;

--
-- Name: BusinessPlanValue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BusinessPlanValue_id_seq" OWNED BY public."BusinessPlanValue".id;


--
-- Name: BusinessPlan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BusinessPlan_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BusinessPlan_id_seq" OWNER TO postgres;

--
-- Name: BusinessPlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BusinessPlan_id_seq" OWNED BY public."BusinessPlan".id;


--
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name text NOT NULL,
    image text NOT NULL
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Categories_id_seq" OWNER TO postgres;

--
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;


--
-- Name: Dashboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dashboard" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    image text NOT NULL
);


ALTER TABLE public."Dashboard" OWNER TO postgres;

--
-- Name: Dashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Dashboard_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Dashboard_id_seq" OWNER TO postgres;

--
-- Name: Dashboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Dashboard_id_seq" OWNED BY public."Dashboard".id;


--
-- Name: SubCategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SubCategories" (
    id integer NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    image text NOT NULL,
    description text,
    avatar text,
    category_id integer NOT NULL
);


ALTER TABLE public."SubCategories" OWNER TO postgres;

--
-- Name: SubCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SubCategories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."SubCategories_id_seq" OWNER TO postgres;

--
-- Name: SubCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SubCategories_id_seq" OWNED BY public."SubCategories".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    "userName" text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "firstName" text,
    "lastName" text
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: ViewedLessens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ViewedLessens" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "subCategoryId" integer NOT NULL
);


ALTER TABLE public."ViewedLessens" OWNER TO postgres;

--
-- Name: ViewedLessens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ViewedLessens_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ViewedLessens_id_seq" OWNER TO postgres;

--
-- Name: ViewedLessens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ViewedLessens_id_seq" OWNED BY public."ViewedLessens".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: BusinessPlan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlan" ALTER COLUMN id SET DEFAULT nextval('public."BusinessPlan_id_seq"'::regclass);


--
-- Name: BusinessPlanQuetion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanQuetion" ALTER COLUMN id SET DEFAULT nextval('public."BusinessPlanQuetion_id_seq"'::regclass);


--
-- Name: BusinessPlanValue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanValue" ALTER COLUMN id SET DEFAULT nextval('public."BusinessPlanValue_id_seq"'::regclass);


--
-- Name: Categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);


--
-- Name: Dashboard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dashboard" ALTER COLUMN id SET DEFAULT nextval('public."Dashboard_id_seq"'::regclass);


--
-- Name: SubCategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubCategories" ALTER COLUMN id SET DEFAULT nextval('public."SubCategories_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: ViewedLessens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ViewedLessens" ALTER COLUMN id SET DEFAULT nextval('public."ViewedLessens_id_seq"'::regclass);


--
-- Data for Name: BusinessPlan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BusinessPlan" (id, title) FROM stdin;
1	Beschrijving van je product of dienst
2	Bedrijfsgegevens
\.


--
-- Data for Name: BusinessPlanQuetion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BusinessPlanQuetion" (id, question, "businessPlanId") FROM stdin;
1	Wat is het product of dienst die je zal aanbieden?	1
2	Wat zijn de belangrijkste kenmerken en voordelen van het product of de dienst	1
3	Hoe onderscheidt jouw product of dienst zich van die van concurrenten?	1
4	Welke behoeften van de klant voorziet jouw product of dienst?	1
\.


--
-- Data for Name: BusinessPlanValue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BusinessPlanValue" (id, value, "businessPlanQuetionId", user_id) FROM stdin;
6	U2FsdGVkX19s4Gc4AvzkZHRM5UbYHDrC7JcSHmJcmr4=	2	3
7	U2FsdGVkX19KEwjoZHFYEUQfUwd1OR/SnYbMHCtnMHw=	3	3
5	U2FsdGVkX18ryaPr9MOfcnVFajpNa4CCJM/MrmVDciw=	1	3
\.


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" (id, name, image) FROM stdin;
1	Bedrijfopzet	https://res.cloudinary.com/donicaayt/image/upload/v1715952757/categories/m3ewdjh8hpb5mxeicd0t.png
2	Juridische administratie aspecten	https://res.cloudinary.com/donicaayt/image/upload/v1715952757/categories/s1t7tnfbqu40xvxo3ug3.png
3	Personeel en sociaal beleid	https://res.cloudinary.com/donicaayt/image/upload/v1715952756/categories/mw1aaqnmnqilrmpvshfi.png
4	Financiële aspecten	https://res.cloudinary.com/donicaayt/image/upload/v1715952757/categories/htj9pzsam2glanvmda0k.png
\.


--
-- Data for Name: Dashboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dashboard" (id, title, description, image) FROM stdin;
\.


--
-- Data for Name: SubCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SubCategories" (id, title, slug, image, description, avatar, category_id) FROM stdin;
1	Businessplan opmaken	business_plan	https://res.cloudinary.com/donicaayt/image/upload/v1715961694/subCategories/ookdlrknqpuvqkctlard.png	Hallo, ik ben Louis.\n\nHet is leuk dat je hier bent! Hier ga ik je leren hoe je een businessplan moet opstellen, zodat je gemakkelijk je eigen businessplan kunt maken. Een businessplan is verplicht voor vennootschappen zoals een bv, nv en cv. Na het opstellen van het businessplan moet je het ook neerleggen bij de notaris.	https://res.cloudinary.com/donicaayt/image/upload/v1716272422/subCategories/j56qhleikj1pnqwmgn53.png	1
2	Publicatie Belgisch staatsblad	belgisch_staatsblad	https://res.cloudinary.com/donicaayt/image/upload/v1715961695/subCategories/f2lpf6gr7frxxb3ewb09.png	Hallo, ik ben Geert.\n\nWanneer je documenten wilt publiceren in het Belgisch staatsblad, doorloop je de volgende stappen:\n\nDocumenten voorbereiden\nBezoek aan de notaris\nIndienen bij de ondernemingsrechtbank\nBetaling van kosten\nPublicatieaanvraag indienen\nPublicatie in het Belgisch staatsblad\nOntvangst van het bewijs van publicatie\nHet publiceren kan je elektronisch en op papier doen.	https://res.cloudinary.com/donicaayt/image/upload/v1717078448/subCategories/hxbctvufcuqrcqya367n.png	2
3	Sociale verzekering	sociale_verzekering	https://res.cloudinary.com/donicaayt/image/upload/v1715961696/subCategories/ilfrzkbbqyazzofhrisc.png	Hallo ik ben Elise.\n\nIk werk bij een sociaal verzekerings kantoor.\n\nEen sociale verzekering is bestemd voor werknemers, zelfstandigen, ambtenaren en werklozen. Sociaal verzekering verwijst naar het stelsel van verzekeringen dat werknemers en zelfstandigen in België beschermt tegen verschillende risico’s, zoals, ziekte, invaliditeit, werkloosheid, pensioen, ...  Deze systeem wordt gefinancierd door de sociale bijdrage, die betaald wordt door werkgevers, werknemers en zelfstandigen.	https://res.cloudinary.com/donicaayt/image/upload/v1717078818/subCategories/ouri5qfs7ia1twkkiakg.png	3
4	Factuur opmaken	factuur	https://res.cloudinary.com/donicaayt/image/upload/v1715961696/subCategories/tvwjknltz823gbeisuaz.png	Hallo ik ben Simon\n\nVoor een bedrijf is het van essentieel belang om in staat te zijn facturen op te maken. Er zijn vier hoofdtypen facturen: aankoopfacturen, verkoopfacturen, creditnota's voor aankopen en creditnota's voor verkopen. Een factuur is een document waarmee je het totale BTW-tarief berekent dat je verschuldigd bent bij een verkoop en dat aftrekbaar is bij een aankoop. 	https://res.cloudinary.com/donicaayt/image/upload/v1717363725/subCategories/lrvn1ko4knhgd1xdrytc.png	4
6	Vergunningen	vergunning	https://res.cloudinary.com/donicaayt/image/upload/v1715961698/subCategories/oupxkye3yyvuus8brxdj.png	\N	\N	1
10	BTW nummer aanvraag	btw_aanvraag	https://res.cloudinary.com/donicaayt/image/upload/v1715961698/subCategories/rhnzdnuxhq5kzrnjv8bz.png	\N	\N	2
5	Eenmans vs vennootschap	eenmans_vennootschap	https://res.cloudinary.com/donicaayt/image/upload/v1715961698/subCategories/ffdlfrzkq1k8ta3ud37g.png	\N	\N	1
11	waarom en wanneer naar de notaris	notaris	https://res.cloudinary.com/donicaayt/image/upload/v1715961699/subCategories/scps34lne8rnfjtlcwz2.png	\N	\N	2
12	sociaal secretariaat	sociaal_secretariaat	https://res.cloudinary.com/donicaayt/image/upload/v1715961697/subCategories/exwhbzq8tqxhcakmjutu.png	\N	\N	3
14	Jaarrekening winst-verlies, pb vs vb	jaarrekening_pb_vb	https://res.cloudinary.com/donicaayt/image/upload/v1715961697/subCategories/r9pyhflzrprvda1jgxb0.png	\N	\N	4
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, "userName", email, password, "firstName", "lastName") FROM stdin;
3	Nese	nese@hotmail.com	$2b$10$JIa2BUDtdbLVRIImeDrsFujmH444z/B5UJKH2jkMc1a4/2UgsfkDa	Nese	Yildirim
\.


--
-- Data for Name: ViewedLessens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ViewedLessens" (id, "userId", "subCategoryId") FROM stdin;
3	3	1
4	3	1
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
b77276d4-c55a-4ed6-92af-591efa813f93	f4c98bcadbd9b410d04c8643590e346b1a6bd061289930a1da4de74d944f961e	2024-06-11 16:09:29.124319+02	20240521145822_add_users_model	\N	\N	2024-06-11 16:09:29.112337+02	1
196f754d-3ab1-44af-bea7-496983b13f76	95efa3dd85b824b4f008ebc00a8e78e6a302d7eb8a76394eb5c572c097ad6ff4	2024-06-11 16:09:29.131086+02	20240521145928_add_dashboard_model	\N	\N	2024-06-11 16:09:29.124953+02	1
edb13f18-d3cd-4fc7-9759-7a1c00357c6f	1440b61578f7cba48c95e7d5fb28172d9e9384ca3ffc01915f00a2b626a1887a	2024-06-11 16:09:29.139886+02	20240521150105_add_categories_model	\N	\N	2024-06-11 16:09:29.131968+02	1
49eb026a-7c32-4489-a2d3-53ce63c6d094	9d2cb9b9924919624a313a256d983d0ce123a921e59b9796689e34bcc5076146	2024-06-11 16:09:29.157795+02	20240521150203_add_sub_categories_model	\N	\N	2024-06-11 16:09:29.146028+02	1
9d3ea321-45dd-4826-aee0-7aa2411c60a8	d077c7df209a1b8032414e19a92f232b299dfdd691cd222f83e65e2fbcdb9543	2024-06-11 16:09:29.176695+02	20240528175245_add_viewed_lessens_model	\N	\N	2024-06-11 16:09:29.158471+02	1
b531b8a6-02f2-41e6-89ed-959a21131e49	90d29037af397e4d83d8fc993533208cefd3e6d63bc56c14ef6bc6c8b4c603a1	2024-06-11 16:09:29.181642+02	20240530151907_add_business_plan_model	\N	\N	2024-06-11 16:09:29.177241+02	1
2cdbee10-b3e8-4737-8307-83ccdc52dcfb	be304a3fe9a18d772015bc63ac48986fc53a4e73f3ece5ca3f0b22fdf725d895	2024-06-11 16:09:29.189874+02	20240530161000_add_business_plan_quetion_model	\N	\N	2024-06-11 16:09:29.182333+02	1
8d8ea0f5-b582-439e-b17d-f9550e1aa986	89bbf293c3aa013495ab918cb46937d475e8e2edcc3a67ff20377774b407e8ac	2024-06-11 16:09:30.08734+02	20240611140930_business_plan_value_migration	\N	\N	2024-06-11 16:09:30.069039+02	1
\.


--
-- Name: BusinessPlanQuetion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BusinessPlanQuetion_id_seq"', 4, true);


--
-- Name: BusinessPlanValue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BusinessPlanValue_id_seq"', 7, true);


--
-- Name: BusinessPlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BusinessPlan_id_seq"', 2, true);


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categories_id_seq"', 4, true);


--
-- Name: Dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dashboard_id_seq"', 1, false);


--
-- Name: SubCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SubCategories_id_seq"', 14, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 3, true);


--
-- Name: ViewedLessens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ViewedLessens_id_seq"', 4, true);


--
-- Name: BusinessPlanQuetion BusinessPlanQuetion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanQuetion"
    ADD CONSTRAINT "BusinessPlanQuetion_pkey" PRIMARY KEY (id);


--
-- Name: BusinessPlanValue BusinessPlanValue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanValue"
    ADD CONSTRAINT "BusinessPlanValue_pkey" PRIMARY KEY (id);


--
-- Name: BusinessPlan BusinessPlan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlan"
    ADD CONSTRAINT "BusinessPlan_pkey" PRIMARY KEY (id);


--
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- Name: Dashboard Dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dashboard"
    ADD CONSTRAINT "Dashboard_pkey" PRIMARY KEY (id);


--
-- Name: SubCategories SubCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubCategories"
    ADD CONSTRAINT "SubCategories_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: ViewedLessens ViewedLessens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ViewedLessens"
    ADD CONSTRAINT "ViewedLessens_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: SubCategories_slug_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "SubCategories_slug_key" ON public."SubCategories" USING btree (slug);


--
-- Name: Users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Users_email_key" ON public."Users" USING btree (email);


--
-- Name: Users_userName_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Users_userName_key" ON public."Users" USING btree ("userName");


--
-- Name: BusinessPlanQuetion BusinessPlanQuetion_businessPlanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanQuetion"
    ADD CONSTRAINT "BusinessPlanQuetion_businessPlanId_fkey" FOREIGN KEY ("businessPlanId") REFERENCES public."BusinessPlan"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BusinessPlanValue BusinessPlanValue_businessPlanQuetionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanValue"
    ADD CONSTRAINT "BusinessPlanValue_businessPlanQuetionId_fkey" FOREIGN KEY ("businessPlanQuetionId") REFERENCES public."BusinessPlanQuetion"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BusinessPlanValue BusinessPlanValue_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BusinessPlanValue"
    ADD CONSTRAINT "BusinessPlanValue_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SubCategories SubCategories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubCategories"
    ADD CONSTRAINT "SubCategories_category_id_fkey" FOREIGN KEY (category_id) REFERENCES public."Categories"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ViewedLessens ViewedLessens_subCategoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ViewedLessens"
    ADD CONSTRAINT "ViewedLessens_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES public."SubCategories"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ViewedLessens ViewedLessens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ViewedLessens"
    ADD CONSTRAINT "ViewedLessens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

