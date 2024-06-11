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
3	Missie en visie
4	Marktanalyse
5	Marketingplan
6	Financieel plan
\.


--
-- Data for Name: BusinessPlanQuetion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BusinessPlanQuetion" (id, question, "businessPlanId") FROM stdin;
1	Wat is het product of dienst die je zal aanbieden?	1
2	Wat zijn de belangrijkste kenmerken en voordelen van het product of de dienst	1
3	Hoe onderscheidt jouw product of dienst zich van die van concurrenten?	1
4	Welke behoeften van de klant voorziet jouw product of dienst?	1
5	Wat is de naam van je bedrijf en wat is de rechtsvorm?	2
6	Waar is je bedrijf gevestigd en wat zijn je contactgegevens?	2
7	Hoe lang bestaat je bedrijf al en wat is de geschiedenis ervan?	2
8	Hoeveel werknemers heeft je bedrijf en wat is de organisatiestructuur?	2
9	Wat is de missie van je bedrijf? Wat is het doel van je bedrijf en waarom bestaat het?	3
10	Wat is de visie van je bedrijf? Hoe zie je de toekomst van je bedrijf en welke doelen wil je bereiken?	3
11	Wie zijn je belangrijkste klanten en wat zijn hun behoeften en wensen?	4
12	Wie zijn je belangrijkste concurrenten en wat zijn hun sterke en zwakke punten?	4
13	Wat zijn de trends en ontwikkelingen in de markt die van invloed kunnen zijn op je bedrijf?	4
14	Wat is de omvang van de markt en welk marktaandeel wil je veroveren?	4
15	Wat is je doelgroep en hoe ga je deze bereiken?	5
16	Wat is je product- en prijsstrategie?	5
17	Hoe ga je je product of dienst promoten en verkopen?	5
18	Wat zijn je plannen voor branding en positionering van je bedrijf?	5
19	Wat zijn je verwachte inkomsten en kosten?	6
20	Hoeveel kapitaal heb je nodig om je bedrijf te starten of te laten groeien?	6
21	Wat is je verwachte winst- en verliesrekening?	6
22	Wat zijn je verwachte cashflowprognoses, en hoe ga je deze berekenen en beheren?	6
\.


--
-- Data for Name: BusinessPlanValue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BusinessPlanValue" (id, value, "businessPlanQuetionId", user_id) FROM stdin;
\.


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" (id, name, image) FROM stdin;
1	Bedrijfsopzet	https://res.cloudinary.com/donicaayt/image/upload/v1715952757/categories/m3ewdjh8hpb5mxeicd0t.png
2	Juridische administratie aspecten	https://res.cloudinary.com/donicaayt/image/upload/v1715952757/categories/s1t7tnfbqu40xvxo3ug3.png
3	Personeel en sociaal beleid	https://res.cloudinary.com/donicaayt/image/upload/v1715952756/categories/mw1aaqnmnqilrmpvshfi.png
4	Financiële aspecten	https://res.cloudinary.com/donicaayt/image/upload/v1715952757/categories/htj9pzsam2glanvmda0k.png
\.


--
-- Data for Name: Dashboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dashboard" (id, title, description, image) FROM stdin;
2	Gratis en interactief	Ontdek de gratis en interactieve leeromgeving van Education Business. Leer door middel van spel en ontwikkel je ondernemersvaardigheden!	https://res.cloudinary.com/donicaayt/image/upload/v1714896345/dashboard/olivz2fsk5k6nbgbjgdk.png
3	Missie	De missie van Education Business is om studenten en professionals van alle achtergronden te inspireren, te onderwijzen en te ondersteunen bij het ontwikkelen van ondernemerschap.	https://res.cloudinary.com/donicaayt/image/upload/v1714896346/dashboard/jcsz4umuhj1tqzdvxfsr.png
4	Doel	Ons hoofddoel is om ondernemerschap te bevorderen door middel van het aanleren van essentiële vaardigheden, waaronder het opstellen van een businessplan, juridische structuren, belastingen en meer. Ontdek stap voor stap hoe je kunt starten als ondernemer en succesvol kunt groeien!	https://res.cloudinary.com/donicaayt/image/upload/v1714896347/dashboard/eda5xypblreg0skfglj1.png
\.


--
-- Data for Name: SubCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SubCategories" (id, title, slug, image, description, avatar, category_id) FROM stdin;
1	Businessplan opmaken	business_plan	https://res.cloudinary.com/donicaayt/image/upload/v1715961694/subCategories/ookdlrknqpuvqkctlard.png	Hallo, ik ben Louis.\n\nHet is leuk dat je hier bent! Hier ga ik je leren hoe je een businessplan moet opstellen, zodat je gemakkelijk je eigen businessplan kunt maken. Een businessplan is verplicht voor vennootschappen zoals een bv, nv en cv. Na het opstellen van het businessplan moet je het ook neerleggen bij de notaris.	https://res.cloudinary.com/donicaayt/image/upload/v1716272422/subCategories/j56qhleikj1pnqwmgn53.png	1
2	Publicatie Belgisch staatsblad	belgisch_staatsblad	https://res.cloudinary.com/donicaayt/image/upload/v1715961695/subCategories/f2lpf6gr7frxxb3ewb09.png	Hallo, ik ben Geert.\n\nWanner je documenten wilt publiceren in het Belgisch staatsblad, doorloop je de volgende stappen: \n\nDocumenten voorbereiden\nBezoek aan de notaris\nIndienen bij de ondernemingsrechtbank\nBetaling van kosten\nPublicatieaanvraag indienen\nPublicatie in het Belgisch staatsblad\nOntvangst van het bewijs van publicatie\n\nHet publiceren kan je elektronisch en op papier doen.	https://res.cloudinary.com/donicaayt/image/upload/v1717078448/subCategories/hxbctvufcuqrcqya367n.png	2
4	Factuur opmaken	factuur	https://res.cloudinary.com/donicaayt/image/upload/v1715961696/subCategories/tvwjknltz823gbeisuaz.png	Hallo ik ben Simon\n\nVoor een bedrijf is het van essentieel belang om in staat te zijn facturen op te maken. Er zijn vier hoofdtypen facturen: aankoopfacturen, verkoopfacturen, creditnota's voor aankopen en creditnota's voor verkopen. Een factuur is een document waarmee je het totale BTW-tarief berekent dat je verschuldigd bent bij een verkoop en dat aftrekbaar is bij een aankoop. 	https://res.cloudinary.com/donicaayt/image/upload/v1717363725/subCategories/lrvn1ko4knhgd1xdrytc.png	4
6	Sociaal secreteriaat	sociaal_secreteriaat	https://res.cloudinary.com/donicaayt/image/upload/v1715961697/subCategories/exwhbzq8tqxhcakmjutu.png	\N	\N	3
9	BTW nummer aanvraag	btw_aanvraag	https://res.cloudinary.com/donicaayt/image/upload/v1715961698/subCategories/rhnzdnuxhq5kzrnjv8bz.png	Hallo, ik ben Luc. \nWanneer je een btw nummer wilt aanvragen doorloop je de volgende stappen:\n\nRegistreren bij de kruispunt bank van ondernemingen (KBO)\nAanvraag BTW nr\nIndienen van de aanvraag \nVerwerken van de aanvraag\nOntvang BTW nr 	https://res.cloudinary.com/donicaayt/image/upload/v1717964849/subCategories/niiatthfsapvgmkxpelj.png	2
10	Waarom en wanneer naar de notaris	notaris	https://res.cloudinary.com/donicaayt/image/upload/v1715961699/subCategories/scps34lne8rnfjtlcwz2.png	Hallo, ik ben Iris.\n\nIk ben notaris. Ik help je graag wanneer je een onderneming wil opstarten. Ik ga na of je een financieel plan hebt opgesteld en bekijk of de aandeelhouders voldoende middelen in de vennootschap inbrengen. Daarnaast informeer ik je graag over de rechten en plichten van oprichters en bestuurders. Ton slotte stel ik de statuten op, die dienen als spelregels van je bedrijf.	https://res.cloudinary.com/donicaayt/image/upload/v1716272690/subCategories/zulgqq78siebfcytekzt.png	2
3	Sociale verzekering	sociale_verzekering	https://res.cloudinary.com/donicaayt/image/upload/v1715961696/subCategories/ilfrzkbbqyazzofhrisc.png	Hallo ik ben Elise.\n\nIk werk bij een sociale verzekerings kantoor.\n\nEen sociaal verzekering is bestemd voor werknemers, zelfstandigen, ambtenaren en werklozen. Sociaal verzekering verwijst naar het stelsel van verzekeringen dat werknemers en zelfstandigen in België beschermt tegen verschillende risico’s, zoals, ziekte, invaliditeit, werkloosheid, pensioen, ...  Deze systeem wordt gefinancierd door de sociale bijdrage, die betaald wordt door werkgevers, werknemers en zelfstandigen.	https://res.cloudinary.com/donicaayt/image/upload/v1717078818/subCategories/ouri5qfs7ia1twkkiakg.png	3
15	Jaarrekening winst-verlies, pb vs vb	jaarrekening_pb_vb	https://res.cloudinary.com/donicaayt/image/upload/v1715961697/subCategories/r9pyhflzrprvda1jgxb0.png	\N	\N	4
13	Vergunning	vergunning	https://res.cloudinary.com/donicaayt/image/upload/v1715961698/subCategories/oupxkye3yyvuus8brxdj.png	\N	\N	1
11	Eenmans vs vennootschap	eenmans_vennootschap	https://res.cloudinary.com/donicaayt/image/upload/v1715961698/subCategories/ffdlfrzkq1k8ta3ud37g.png	\N	\N	1
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, "userName", email, password, "firstName", "lastName") FROM stdin;
8	test	test@hotmail.com	$2b$10$xZ4KCK/xKuOePPnvJPD/p.tEX99mW1qekPWoWHtpfM1GtOsw2blCW	testie	tast
1	Neşe	nese@hotmail.com	$2b$10$dzgqJ7p0k9i4aonQe9raLu1BXZQBeV5i1L2hyZLQ/xzYzHt4A96LS	Nese	Yildirim
2	Anna	anna@hotmail.com	$2b$10$g5AFgkN3KgTv8K.i/xE5z.h2SUoSr86PfjNdFlvAhf53olBZJnsFS	Anna-Yodit	Olsen
10	anna	a	$2b$10$3lXZ8LDRENrRBc4MHLJsVukLXonH479LkxefjvX8T7gT2qOGF1AUu	Nese	Yildirim
\.


--
-- Data for Name: ViewedLessens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ViewedLessens" (id, "userId", "subCategoryId") FROM stdin;
302	1	1
301	1	2
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
3f320779-a328-4133-a0fd-b84e61432ab7	f4c98bcadbd9b410d04c8643590e346b1a6bd061289930a1da4de74d944f961e	2024-06-10 23:22:02.976146+02	20240521145822_add_users_model	\N	\N	2024-06-10 23:22:02.954169+02	1
817906b3-23a9-4604-9fd8-a8ffc025dbea	95efa3dd85b824b4f008ebc00a8e78e6a302d7eb8a76394eb5c572c097ad6ff4	2024-06-10 23:22:02.987098+02	20240521145928_add_dashboard_model	\N	\N	2024-06-10 23:22:02.977188+02	1
4e9d3371-79a8-4cc4-8bf0-21b3ff9454c5	1440b61578f7cba48c95e7d5fb28172d9e9384ca3ffc01915f00a2b626a1887a	2024-06-10 23:22:03.00822+02	20240521150105_add_categories_model	\N	\N	2024-06-10 23:22:02.988339+02	1
588c7a8e-fcf2-430c-9e46-193520200e2b	9d2cb9b9924919624a313a256d983d0ce123a921e59b9796689e34bcc5076146	2024-06-10 23:22:03.031855+02	20240521150203_add_sub_categories_model	\N	\N	2024-06-10 23:22:03.010061+02	1
6cc23443-9de1-4212-bdbd-c2a003ea5916	d077c7df209a1b8032414e19a92f232b299dfdd691cd222f83e65e2fbcdb9543	2024-06-10 23:22:03.050054+02	20240528175245_add_viewed_lessens_model	\N	\N	2024-06-10 23:22:03.035977+02	1
eb111af9-8d0c-49ca-a7ad-ace4e0f862a0	90d29037af397e4d83d8fc993533208cefd3e6d63bc56c14ef6bc6c8b4c603a1	2024-06-10 23:22:03.061095+02	20240530151907_add_business_plan_model	\N	\N	2024-06-10 23:22:03.051545+02	1
b25a055b-9b18-4940-92aa-5e4c2e6cf268	be304a3fe9a18d772015bc63ac48986fc53a4e73f3ece5ca3f0b22fdf725d895	2024-06-10 23:22:03.073389+02	20240530161000_add_business_plan_quetion_model	\N	\N	2024-06-10 23:22:03.062327+02	1
25698c0c-8cae-4e73-bf7f-f56f032614b0	5549ed2a90038bdba3c0029439dbec3e0d8c771c3f7c0e7ad6667a956648b73f	2024-06-10 23:22:03.08933+02	20240530161349_add_business_plan_value_model	\N	\N	2024-06-10 23:22:03.07463+02	1
15b3fd15-d376-4b3b-ae5f-96b67a7b00d2	f4c98bcadbd9b410d04c8643590e346b1a6bd061289930a1da4de74d944f961e	2024-05-30 18:13:47.394775+02	20240521145822_add_users_model	\N	\N	2024-05-30 18:13:47.353446+02	1
5d62e7a2-ab4a-4bba-8627-ac39c8425403	95efa3dd85b824b4f008ebc00a8e78e6a302d7eb8a76394eb5c572c097ad6ff4	2024-05-30 18:13:47.478282+02	20240521145928_add_dashboard_model	\N	\N	2024-05-30 18:13:47.427345+02	1
980e1bf4-2d12-47d6-b9cf-2d600f4894b2	1440b61578f7cba48c95e7d5fb28172d9e9384ca3ffc01915f00a2b626a1887a	2024-05-30 18:13:47.498142+02	20240521150105_add_categories_model	\N	\N	2024-05-30 18:13:47.479382+02	1
467fe144-6eb2-4a21-8d43-58cc07a10878	9d2cb9b9924919624a313a256d983d0ce123a921e59b9796689e34bcc5076146	2024-05-30 18:13:47.524787+02	20240521150203_add_sub_categories_model	\N	\N	2024-05-30 18:13:47.498973+02	1
d88303a2-35a8-4fcd-a8cd-a4a513ee5418	2226d2e032ddbd73eda0d15eb599be2aa4e797116209129fb32e0f6161fd6caf	2024-05-30 18:13:47.604671+02	20240521150236_add_types_model	\N	\N	2024-05-30 18:13:47.525631+02	1
5c1388f5-2323-4442-a804-9f98b644accd	d077c7df209a1b8032414e19a92f232b299dfdd691cd222f83e65e2fbcdb9543	2024-05-30 18:13:47.717267+02	20240528175245_add_viewed_lessens_model	\N	\N	2024-05-30 18:13:47.637965+02	1
d2f2befa-e95c-4c82-bf44-311e11d365de	90d29037af397e4d83d8fc993533208cefd3e6d63bc56c14ef6bc6c8b4c603a1	2024-05-30 18:13:47.793305+02	20240530151907_add_business_plan_model	\N	\N	2024-05-30 18:13:47.725889+02	1
c1263d98-9c42-4592-b8b4-5df762894fe2	be304a3fe9a18d772015bc63ac48986fc53a4e73f3ece5ca3f0b22fdf725d895	2024-05-30 18:13:47.902153+02	20240530161000_add_business_plan_quetion_model	\N	\N	2024-05-30 18:13:47.80574+02	1
52b12aea-fe19-4464-acb4-777a4bbcb6ee	ea2bf58d3c49e8caa9616228a8a15eede5b3b659dd6f500ae728fc3c14f20e0c	2024-05-30 18:13:49.072613+02	20240530161349_add_business_plan_value_model	\N	\N	2024-05-30 18:13:49.046805+02	1
\.


--
-- Name: BusinessPlanQuetion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BusinessPlanQuetion_id_seq"', 22, true);


--
-- Name: BusinessPlanValue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BusinessPlanValue_id_seq"', 94, true);


--
-- Name: BusinessPlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BusinessPlan_id_seq"', 6, true);


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categories_id_seq"', 4, true);


--
-- Name: Dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dashboard_id_seq"', 4, true);


--
-- Name: SubCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SubCategories_id_seq"', 15, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 11, true);


--
-- Name: ViewedLessens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ViewedLessens_id_seq"', 302, true);


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

