--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Debian 13.7-0+deb11u1)
-- Dumped by pg_dump version 13.7 (Debian 13.7-0+deb11u1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO toto;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO toto;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO toto;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO toto;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO toto;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO toto;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO toto;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO toto;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO toto;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO toto;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO toto;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO toto;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO toto;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO toto;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO toto;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO toto;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO toto;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO toto;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO toto;

--
-- Name: employer_categories; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.employer_categories (
    id bigint NOT NULL,
    nom character varying(30) NOT NULL,
    descriptif text
);


ALTER TABLE public.employer_categories OWNER TO toto;

--
-- Name: employer_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.employer_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employer_categories_id_seq OWNER TO toto;

--
-- Name: employer_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.employer_categories_id_seq OWNED BY public.employer_categories.id;


--
-- Name: employer_clients; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.employer_clients (
    id bigint NOT NULL,
    nom character varying(30) NOT NULL,
    prenom character varying(30) NOT NULL,
    date_insci date NOT NULL,
    addr character varying(50) NOT NULL,
    username text NOT NULL
);


ALTER TABLE public.employer_clients OWNER TO toto;

--
-- Name: employer_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.employer_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employer_clients_id_seq OWNER TO toto;

--
-- Name: employer_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.employer_clients_id_seq OWNED BY public.employer_clients.id;


--
-- Name: employer_commandes; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.employer_commandes (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    client_id bigint NOT NULL,
    commande text NOT NULL
);


ALTER TABLE public.employer_commandes OWNER TO toto;

--
-- Name: employer_commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.employer_commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employer_commandes_id_seq OWNER TO toto;

--
-- Name: employer_commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.employer_commandes_id_seq OWNED BY public.employer_commandes.id;


--
-- Name: employer_produits; Type: TABLE; Schema: public; Owner: toto
--

CREATE TABLE public.employer_produits (
    id bigint NOT NULL,
    nom character varying(30) NOT NULL,
    date_per date NOT NULL,
    photo character varying(100) NOT NULL,
    marque character varying(30) NOT NULL,
    stock integer NOT NULL,
    prix numeric(10,2) NOT NULL,
    categorie_id bigint,
    CONSTRAINT employer_produits_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.employer_produits OWNER TO toto;

--
-- Name: employer_produits_id_seq; Type: SEQUENCE; Schema: public; Owner: toto
--

CREATE SEQUENCE public.employer_produits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employer_produits_id_seq OWNER TO toto;

--
-- Name: employer_produits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toto
--

ALTER SEQUENCE public.employer_produits_id_seq OWNED BY public.employer_produits.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: employer_categories id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_categories ALTER COLUMN id SET DEFAULT nextval('public.employer_categories_id_seq'::regclass);


--
-- Name: employer_clients id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_clients ALTER COLUMN id SET DEFAULT nextval('public.employer_clients_id_seq'::regclass);


--
-- Name: employer_commandes id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_commandes ALTER COLUMN id SET DEFAULT nextval('public.employer_commandes_id_seq'::regclass);


--
-- Name: employer_produits id; Type: DEFAULT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_produits ALTER COLUMN id SET DEFAULT nextval('public.employer_produits_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add categories	7	add_categories
26	Can change categories	7	change_categories
27	Can delete categories	7	delete_categories
28	Can view categories	7	view_categories
29	Can add clients	8	add_clients
30	Can change clients	8	change_clients
31	Can delete clients	8	delete_clients
32	Can view clients	8	view_clients
33	Can add produits	9	add_produits
34	Can change produits	9	change_produits
35	Can delete produits	9	delete_produits
36	Can view produits	9	view_produits
37	Can add commandes	10	add_commandes
38	Can change commandes	10	change_commandes
39	Can delete commandes	10	delete_commandes
40	Can view commandes	10	view_commandes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$PTcO9RmxM7FOZutMrYmuej$lZtWe+z/OaEQjunt9mkf/iTT2/JvU4aMjZKX7bLLtXw=	2022-06-16 19:20:51.82+00	t	toto				t	t	2022-06-16 07:42:30.643+00
2	pbkdf2_sha256$320000$aSU5ChV0bF4suq7e2KdN1U$M7JZ6+tjEmFKbNiOTGPr1W3NzYX8AVJYp82SmrzEaFs=	2022-06-16 18:58:01.366+00	f	iut			iut@iut.rt	f	t	2022-06-16 13:32:46.933+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-06-16 17:17:29.529+00	1	Haribo Haribo	2	[{"changed": {"fields": ["Photo"]}}]	9	1
2	2022-06-16 18:50:25.753+00	2	iut	2	[{"changed": {"fields": ["password"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	employer	categories
8	employer	clients
9	employer	produits
10	employer	commandes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	Drive	0001_initial	2022-06-16 20:20:28.680395+00
2	Drive	0002_alter_produits_categorie	2022-06-16 20:20:28.700344+00
3	Drive	0003_remove_commandes_client_remove_produits_categorie_and_more	2022-06-16 20:20:28.730111+00
4	contenttypes	0001_initial	2022-06-16 20:20:28.751382+00
5	auth	0001_initial	2022-06-16 20:20:28.902748+00
6	admin	0001_initial	2022-06-16 20:20:28.947492+00
7	admin	0002_logentry_remove_auto_add	2022-06-16 20:20:28.966779+00
8	admin	0003_logentry_add_action_flag_choices	2022-06-16 20:20:28.983508+00
9	contenttypes	0002_remove_content_type_name	2022-06-16 20:20:29.017194+00
10	auth	0002_alter_permission_name_max_length	2022-06-16 20:20:29.035502+00
11	auth	0003_alter_user_email_max_length	2022-06-16 20:20:29.053405+00
12	auth	0004_alter_user_username_opts	2022-06-16 20:20:29.070663+00
13	auth	0005_alter_user_last_login_null	2022-06-16 20:20:29.08853+00
14	auth	0006_require_contenttypes_0002	2022-06-16 20:20:29.093043+00
15	auth	0007_alter_validators_add_error_messages	2022-06-16 20:20:29.113097+00
16	auth	0008_alter_user_username_max_length	2022-06-16 20:20:29.137932+00
17	auth	0009_alter_user_last_name_max_length	2022-06-16 20:20:29.155234+00
18	auth	0010_alter_group_name_max_length	2022-06-16 20:20:29.174804+00
19	auth	0011_update_proxy_permissions	2022-06-16 20:20:29.190866+00
20	auth	0012_alter_user_first_name_max_length	2022-06-16 20:20:29.208039+00
21	employer	0001_initial	2022-06-16 20:20:29.271092+00
22	employer	0002_commandes_commande	2022-06-16 20:20:29.286305+00
23	employer	0003_alter_commandes_date	2022-06-16 20:20:29.310425+00
24	employer	0004_alter_produits_photo	2022-06-16 20:20:29.32032+00
25	employer	0005_alter_produits_photo	2022-06-16 20:20:29.328961+00
26	employer	0006_alter_commandes_commande	2022-06-16 20:20:29.337674+00
27	employer	0007_rename_maraue_produits_marque	2022-06-16 20:20:29.347246+00
28	employer	0008_commandes_commande_details	2022-06-16 20:20:29.356303+00
29	employer	0009_remove_commandes_commande_details_and_more	2022-06-16 20:20:29.37596+00
30	employer	0010_alter_produits_photo	2022-06-16 20:20:29.384854+00
31	employer	0011_alter_produits_photo	2022-06-16 20:20:29.393352+00
32	employer	0012_alter_produits_photo	2022-06-16 20:20:29.402367+00
33	employer	0013_clients_username	2022-06-16 20:20:29.417244+00
34	employer	0014_alter_produits_photo	2022-06-16 20:20:29.425741+00
35	employer	0015_alter_produits_photo	2022-06-16 20:20:29.434549+00
36	sessions	0001_initial	2022-06-16 20:20:29.4643+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6sc33twn8sgx7q5tisnjsa6w7ij1lsou	.eJxVjDkOgzAQAP_iOrKWZX1AmT5vQOsrkERYAlMh_h4s0dDOjGYX2xoX0YuSSxYPMfBWxqGyYQonbu7Msf_GuYrw4fmdpc9zWSYnayIvu8pXDvH3vNrbYOR1rFsDLgJZcJqAYocMHDQrpdsOXaRkk7VESAkxtMDKG2hUpz02jtG059TzUkS_H8cfPHM-ig:1o1kY7:8HzFtna6ibgJB_vE3dJNXFp5iAZrN32w75nYed3LaTM	2022-06-30 08:08:19.391+00
91ux5krwvd9v2ojpayfbrpbqs5rh9lka	.eJxVjDEOgzAQBP_iOrJsuDOGMn3egO7OdiCJsASmQvw9INHQzuzOptYlzqpTJZesHqqntQz9yfoxHNjeGZN843SK8KHpnbXkqcwj63OiL7voVw7x97y2t8BAy3C8GdG3DTAIISBaBkuAHsS1wFhXGEKqaxYjLVpnqsqkJvnGmYhsPJgjKjQX1W37_gc5gT5r:1o1v2x:sxUc1nqdsB62i5UXKRNYDJG7HWwHhHqc1L-0HoB7cbQ	2022-06-30 19:20:51.823+00
aaaysgdhzyoj6bsrucrdb8chqpjcimgf	.eJxVjDkOgzAQAP_iOrKWZX1AmT5vQOsrkERYAlMh_h4s0dDOjGYX2xoX0YuSSxYPMfBWxqGyYQonbu7Msf_GuYrw4fmdpc9zWSYnayIvu8pXDvH3vNrbYOR1rFsDLgJZcJqAYocMHDQrpdsOXaRkk7VESAkxtMDKG2hUpz02jtG059TzUkS_H8cfPHM-ig:1o1tiO:iAGlr1pVm2zGdKHGtN67ULaUbEDdqV18cuDlxPtcloM	2022-06-30 17:55:32.364+00
dh4a0xf67miw5i231z9t2ubtq9aff5gq	.eJxVjDEOgzAQBP_iOrJsuDOGMn3egO7OdiCJsASmQvw9INHQzuzOptYlzqpTJZesHqqntQz9yfoxHNjeGZN843SK8KHpnbXkqcwj63OiL7voVw7x97y2t8BAy3C8GdG3DTAIISBaBkuAHsS1wFhXGEKqaxYjLVpnqsqkJvnGmYhsPJgjKjQX1W37_gc5gT5r:1o1urg:2Y0Kv0BWLfXasHMTRmu5Cq0oiId40E7uxNMTs70A72g	2022-06-30 19:09:12.769+00
m74hq07qds3vg76e7og1fgs7kl74qj9x	.eJxVjMsOgyAQAP-Fc0PWZUHw2LvfYJaHxbbRBPRk_PfWxEN7nZnMLgbe1jxsNZVhiqITjbj9Ms_hleZTxCfPj0WGZV7L5OWZyMtW2S8xve9X-zfIXPO5bcEnIAveEFByyMDRsNZGOfSJRjtaS4Q0IkYFrEMLjXYmYOMZW_WdBi6r6Pbj-ADyNzoX:1o1pmD:wqqC_w4x2_VccJk7R36Zk6QmwHq4wM1rt9_jQJxevtI	2022-06-30 13:43:13.54+00
rt6272e9ef8sp6n775w4qiy7na1db8yp	.eJxVjDkOgzAQAP_iOrKWZX1AmT5vQOsrkERYAlMh_h4s0dDOjGYX2xoX0YuSSxYPMfBWxqGyYQonbu7Msf_GuYrw4fmdpc9zWSYnayIvu8pXDvH3vNrbYOR1rFsDLgJZcJqAYocMHDQrpdsOXaRkk7VESAkxtMDKG2hUpz02jtG059TzUkS_H8cfPHM-ig:1o1kOJ:cCD1vpMYbGCHGSn-eLMnTM_CVpwrii6Yq883T3xkwdQ	2022-06-30 07:58:11.904+00
t0ffk7qx4ydag8fi5lgn3spjpeziqmhm	.eJxVjDkOgzAQAP_iOrKWZX1AmT5vQOsrkERYAlMh_h4s0dDOjGYX2xoX0YuSSxYPMfBWxqGyYQonbu7Msf_GuYrw4fmdpc9zWSYnayIvu8pXDvH3vNrbYOR1rFsDLgJZcJqAYocMHDQrpdsOXaRkk7VESAkxtMDKG2hUpz02jtG059TzUkS_H8cfPHM-ig:1o1kZK:YCge8jU5xuc6cHdYhxgxYid2jnKloXi5-3NtoXqvNCo	2022-06-30 08:09:34.573+00
\.


--
-- Data for Name: employer_categories; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.employer_categories (id, nom, descriptif) FROM stdin;
1	Sucreie	bonbon
\.


--
-- Data for Name: employer_clients; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.employer_clients (id, nom, prenom, date_insci, addr, username) FROM stdin;
1	iut	iut	2022-06-16	iut	iut
\.


--
-- Data for Name: employer_commandes; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.employer_commandes (id, date, client_id, commande) FROM stdin;
\.


--
-- Data for Name: employer_produits; Type: TABLE DATA; Schema: public; Owner: toto
--

COPY public.employer_produits (id, nom, date_per, photo, marque, stock, prix, categorie_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);


--
-- Name: employer_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.employer_categories_id_seq', 1, true);


--
-- Name: employer_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.employer_clients_id_seq', 1, true);


--
-- Name: employer_commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.employer_commandes_id_seq', 1, false);


--
-- Name: employer_produits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toto
--

SELECT pg_catalog.setval('public.employer_produits_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: employer_categories employer_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_categories
    ADD CONSTRAINT employer_categories_pkey PRIMARY KEY (id);


--
-- Name: employer_clients employer_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_clients
    ADD CONSTRAINT employer_clients_pkey PRIMARY KEY (id);


--
-- Name: employer_commandes employer_commandes_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_commandes
    ADD CONSTRAINT employer_commandes_pkey PRIMARY KEY (id);


--
-- Name: employer_produits employer_produits_pkey; Type: CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_produits
    ADD CONSTRAINT employer_produits_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: employer_commandes_client_id_bbefee7a; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX employer_commandes_client_id_bbefee7a ON public.employer_commandes USING btree (client_id);


--
-- Name: employer_produits_categorie_id_423255ae; Type: INDEX; Schema: public; Owner: toto
--

CREATE INDEX employer_produits_categorie_id_423255ae ON public.employer_produits USING btree (categorie_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employer_commandes employer_commandes_client_id_bbefee7a_fk_employer_clients_id; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_commandes
    ADD CONSTRAINT employer_commandes_client_id_bbefee7a_fk_employer_clients_id FOREIGN KEY (client_id) REFERENCES public.employer_clients(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employer_produits employer_produits_categorie_id_423255ae_fk_employer_; Type: FK CONSTRAINT; Schema: public; Owner: toto
--

ALTER TABLE ONLY public.employer_produits
    ADD CONSTRAINT employer_produits_categorie_id_423255ae_fk_employer_ FOREIGN KEY (categorie_id) REFERENCES public.employer_categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

