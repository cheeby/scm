--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    name character varying(255),
    "position" character varying(255),
    bio text,
    photo character varying(255),
    published boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255)
);


ALTER TABLE public.employees OWNER TO maria_montessori;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: maria_montessori
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO maria_montessori;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maria_montessori
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maria_montessori
--

SELECT pg_catalog.setval('employees_id_seq', 4, true);


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(40),
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO maria_montessori;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: maria_montessori
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO maria_montessori;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maria_montessori
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maria_montessori
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 17, true);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    name character varying(255),
    parent_id integer,
    intro_copy text,
    main_copy text,
    published boolean,
    sidebar_image_one character varying(255),
    sidebar_image_one_visible boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sidebar_image_caption text,
    sidebar_image_link character varying(255),
    slug character varying(255)
);


ALTER TABLE public.pages OWNER TO maria_montessori;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: maria_montessori
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO maria_montessori;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maria_montessori
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maria_montessori
--

SELECT pg_catalog.setval('pages_id_seq', 13, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO maria_montessori;

--
-- Name: users; Type: TABLE; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password_hash character varying(255),
    password_salt character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO maria_montessori;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: maria_montessori
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO maria_montessori;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maria_montessori
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maria_montessori
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maria_montessori
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maria_montessori
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maria_montessori
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maria_montessori
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: maria_montessori
--

COPY employees (id, name, "position", bio, photo, published, created_at, updated_at, slug) FROM stdin;
2	Mikki Tuohoy	Toddler Assistant	<p>\r\n\tNeed a bio for poor Mikki</p>\r\n	Mikki_scaled.JPG	t	2013-01-03 21:14:52.048815	2013-01-03 21:37:51.522406	mikki-tuohoy
3	Carl Banner	Montessori Guide	<p>\r\n\t<span style="color: rgb(31, 73, 125); font-family: Arial; font-size: small; line-height: 17.33333396911621px; text-align: justify;">Carl is now in his 5th year as the elementary teacher at SCMS. Prior to his work here, he taught middle school for one year and he taught high school for three years in rural North Carolina with the Teach For America program. After a year of selling antiques and records, he&nbsp;went on to earn his AMI diploma from the Washington Montessori Institute in Baltimore and a Master&#39;s degree from Loyola College in Baltimore. In his spare time, Carl enjoys spending time with his wife and son, Isaac, as well as reading, going for walks, and collecting records.&nbsp;</span></p>\r\n	Carl_scaled.JPG	t	2013-01-03 21:22:09.647594	2013-01-03 21:37:51.529787	carl-banner
4	Karing Nial	Montessori Guide — Toddler Room	<p>\r\n\t<span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">Karing has been involved with Montessori education since 1972; first as a volunteer, then as a parent, and now as a teacher.</span><span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">She has been with St. Croix Montessori since its opening in our present location in 1995.</span><span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">She lives on the school property in the farm house and oversees the animal care.</span><span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; line-height: 17.33333396911621px; text-align: center;">Her outside interests include gardening, exercise, music, friends, travel and volunteering on our property as we transition from old farm fields to native habitat and environmental learning center.</span></p>\r\n	Karing_scaled.JPG	t	2013-01-03 21:25:49.667598	2013-01-03 21:37:51.53665	karing-nial
1	Molly Ramsay	Teacher - Primary West!	<p>\r\n\tMolly grew up in the Stillwater area, she attended St.Catherine&#39;s University and spent her junior year in Avignon, France. &nbsp;She was a member of the French Honor Society, Pi Delta Phi and Phi Beta Kappa. &nbsp;She received her B.A. in French. &nbsp;Molly has been with SCMS since it first opened in 1995. &nbsp;She now resides in Hudson, WI with her husband and (naughty) dog.&nbsp;&nbsp;She enjoys reading, walking, swimming and ice skating, in addition to playing the violin, piano and guitar.</p>\r\n	molly_ramsay.JPG	f	2013-01-03 21:08:19.853695	2013-01-03 22:01:08.325773	molly-ramsay
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: maria_montessori
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, created_at) FROM stdin;
1	no-parent	0	Page	2013-01-03 17:23:50.73417
2	home	2	Page	2013-01-03 17:23:50.749104
3	about	3	Page	2013-01-03 17:23:50.756482
4	values-and-beliefs	4	Page	2013-01-03 17:23:50.763915
5	montessori	5	Page	2013-01-03 17:23:50.770709
6	programs	6	Page	2013-01-03 17:23:50.776245
7	calendar	7	Page	2013-01-03 17:23:50.782019
8	admissions	8	Page	2013-01-03 17:23:50.787679
9	mission-statement	9	Page	2013-01-03 18:53:01.182971
10	maria-montessori	10	Page	2013-01-03 19:11:54.291326
11	toddler	11	Page	2013-01-03 19:17:15.624949
12	application-procedure	12	Page	2013-01-03 19:20:15.009815
13	molly-ramsay	1	Employee	2013-01-03 21:37:51.516054
14	mikki-tuohoy	2	Employee	2013-01-03 21:37:51.525353
15	carl-banner	3	Employee	2013-01-03 21:37:51.532511
16	karing-nial	4	Employee	2013-01-03 21:37:51.539446
17	staff	13	Page	2013-01-03 21:39:55.754398
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: maria_montessori
--

COPY pages (id, name, parent_id, intro_copy, main_copy, published, sidebar_image_one, sidebar_image_one_visible, created_at, updated_at, sidebar_image_caption, sidebar_image_link, slug) FROM stdin;
0	-- no parent --	0	\N	\N	\N	\N	\N	2012-12-29 22:54:18.932486	2013-01-03 17:23:50.685951	\N	\N	no-parent
2	home	0	<p>\r\n\tthis is the intro copy</p>\r\n	<p>\r\n\tAs a leading center for Montessori education in the east metro since 1993, SCMS is an independent, not-for-profit school that serves children 16 months through the sixth grade. We are beautifully situated on 15 acres in a rural setting and are conveniently located just east of the Twin Cities north of Highway 94 and east of Manning Avenue between Woodbury and Stillwater. Students at SCMS receive a quality student-centered classroom experience within a variety of settings on our property, including the opportunity to care for farm animals such as our alpacas, miniature donkeys and chickens.</p>\r\n	t	summer_camp.JPG	t	2012-12-30 05:04:25.551071	2013-01-03 17:23:50.745768	Check out our Summer Camp options!	/summer-camps	home
3	about	0	<p>\r\n\tChoose an area to explore deeper:</p>\r\n	<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: large; line-height: 17.33333396911621px;">\r\n\t<font color="#000000" face="Arial, Verdana, sans-serif" size="3"><span style="font-size: 12px;"><b>-</b>&nbsp;Learn about our&nbsp;<a href="http://stcroixmontessori.org/values_and_beliefs.aspx">values and beliefs</a>&nbsp;</span></font></div>\r\n<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: large; line-height: 17.33333396911621px;">\r\n\t<font color="#000000" face="Arial, Verdana, sans-serif" size="3"><span style="font-size: 12px;"><b>-&nbsp;</b>Read our&nbsp;<a href="http://stcroixmontessori.org/mission_statement.aspx">mission statement</a></span></font></div>\r\n<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: large; line-height: 17.33333396911621px;">\r\n\t<font color="#000000" face="Arial, Verdana, sans-serif" size="3"><span style="font-size: 12px;"><b>-</b>&nbsp;Discover our&nbsp;<a href="http://stcroixmontessori.org/history.aspx">history</a></span></font></div>\r\n<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: large; line-height: 17.33333396911621px;">\r\n\t<font color="#000000" face="Arial, Verdana, sans-serif" size="3"><span style="font-size: 12px;"><strong>-&nbsp;</strong>Meet our&nbsp;<a href="http://stcroixmontessori.org/facultyandstaff.aspx">Faculty and Staff</a><br />\r\n\t<strong>-</strong>&nbsp;Find us on the&nbsp;<a href="http://stcroixmontessori.org/location.aspx">map</a></span></font></div>\r\n<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: large; line-height: 17.33333396911621px;">\r\n\t<font color="#000000" face="Arial, Verdana, sans-serif" size="3"><span style="font-size: 12px;"><b>-</b>&nbsp;Check for&nbsp;<a href="http://stcroixmontessori.org/employment.aspx">employment opportunities</a></span></font></div>\r\n	t	\N	f	2013-01-02 22:00:57.980091	2013-01-03 17:23:50.75413	\N	\N	about
5	montessori	0	<p>\r\n\tWhat is Montessori?</p>\r\n	<p>\r\n\tRead about Maria Montessori.</p>\r\n	t	\N	f	2013-01-02 22:22:15.593684	2013-01-03 17:23:50.768278	\N	\N	montessori
6	programs	0	<p>\r\n\tPrograms</p>\r\n	<p>\r\n\tRead about our programs.</p>\r\n	t	\N	f	2013-01-02 22:23:51.990576	2013-01-03 17:23:50.774055	\N	\N	programs
7	calendar	0	<p>\r\n\tCalendar of events / School schedule</p>\r\n		t	\N	f	2013-01-02 22:24:27.423116	2013-01-03 17:23:50.779496	\N	\N	calendar
8	admissions	0	<p>\r\n\tHow do I enroll my child?</p>\r\n	<p>\r\n\tMore information here about enrollment at SCM.</p>\r\n	t	\N	f	2013-01-02 22:25:09.403348	2013-01-03 17:23:50.785356	\N	\N	admissions
4	values and beliefs	3	<p>\r\n\t&nbsp;</p>\r\n<h3>\r\n\t&nbsp;</h3>\r\n	<p>\r\n\tCORE VALUES</p>\r\n<div style="text-align: center;">\r\n\t<span style="font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); -webkit-text-decorations-in-effect: initial;"><font color="#008000" face="Verdana, Helvetica, sans-serif"><font size="3"><font size="4"><b><span style="font-size: 13px; -webkit-text-decorations-in-effect: initial;"><span style="font-weight: normal;"><font color="#000000"><font face="Arial"><font size="3"><b><font color="#000080">We support</font></b>&nbsp;the development of the whole child to their fullest potential as an emotional, intellectual, physical, social, and spiritual human being.</font></font></font></span></span></b></font></font></font></span></div>\r\n<div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><span style="font-family: Arial;"><b><font color="#000080">We hold</font></b>&nbsp;the highest vision of the child, valuing every child as unique with their own inner gifts.</span></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><font color="#000000"><span style="font-family: Arial;"><b><font color="#000080">We promote</font></b>&nbsp;the growing independence of the child, remove obstacles to their natural growth, and guide them on their journey.</span></font></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><font color="#000000"><font face="Arial"><b><span style="font-weight: normal;"><b><font color="#000080">We provide</font></b>&nbsp;a stimulating and engaging learning environment of excellence.</span></b></font></font></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><font color="#000000"><font face="Arial"><b><span style="font-weight: normal;"><b><font color="#000080">We celebrate</font></b>&nbsp;and uphold the best of American culture, and avoid exposing the child to negative cultural influences.</span></b></font></font></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><font color="#000000"><font face="Arial"><b><span style="font-weight: normal;"><b><font color="#000080">We model</font></b>&nbsp;and encourage virtues and moral standards of excellence as central to development of character.</span></b></font></font></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><font color="#000000"><font face="Arial"><b><span style="font-weight: normal;"><b><font color="#000080">We create</font></b>&nbsp;opportunities to develop self-knowledge.</span></b></font></font></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div style="text-align: center;">\r\n\t\t<span class="copy" style="font-size: 16px; color: rgb(0, 0, 0);"><font color="#000000"><font face="Arial"><b><span style="font-weight: normal;"><b><font color="#000080">We are responsible</font></b>&nbsp;world citizens who demonstrate stewardship for all living beings.</span></b></font></font></span></div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n\t<div>\r\n\t\tCORE BELIEFS</div>\r\n\t<div>\r\n\t\t&nbsp;</div>\r\n\t<div>\r\n\t\t<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: 13px; line-height: 17.33333396911621px;">\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font color="#008000" face="Verdana, Helvetica, sans-serif"><span style="font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0);"><b><font color="#000080">We believe that</font>:</b></span></font></span></div>\r\n\t\t</div>\r\n\t\t<div style="color: rgb(0, 128, 0); font-family: Verdana, Helvetica, sans-serif; font-size: 13px; line-height: 17.33333396911621px;">\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><span style="font-family: Arial;">The pioneering work of Dr. Maria Montessori provides a solid framework for the development of the whole child.</span></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Exposure to world languages from an early age assists in the child&#39;s adaptation to the world.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Recognition of world religions increases the child&#39;s understanding of the world and develops tolerance and respect for diverse cultures.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Discovery about the world&#39;s greatest civilizations deepens the child&#39;s knowledge of his culture, his role within it, and cultures across the world.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Exposure to the arts throughout the curriculum rather than as separate disciplines completes the child&#39;s rich educational experience.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Direct and frequent contact with nature, outdoor experiences and study, and interaction with the land promotes the child&#39;s holistic development.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Staying current with the latest in learning research enhances our ability to support the best for the developing child.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">High quality, competent, motivated, joyful, and trained staff are key to the child&#39;s optimal learning experience.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">A successful home/school partnership helps provide optimal conditions for a child&#39;s growth and development as a full human being.</font></font></span></div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t&nbsp;</div>\r\n\t\t\t<div style="text-align: center;">\r\n\t\t\t\t<span class="copy" style="font-family: Arial, Verdana, sans-serif; font-size: 16px; color: rgb(0, 0, 0);"><font face="Arial"><font color="#000000">Socio-economic diversity in the school community best supports the development of the whole child.</font></font></span></div>\r\n\t\t</div>\r\n\t</div>\r\n\t<div style="text-align: center;">\r\n\t\t&nbsp;</div>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n	t	\N	f	2013-01-02 22:02:50.294567	2013-01-03 17:27:11.630077			values-and-beliefs
9	mission statement	3		<p>\r\n\t&quot;St. Croix Montessori School&nbsp;supports the joyful unfolding of each child&#39;s potential by providing a rich, meaningful learning environment based on Montessori principles.&quot;&nbsp;</p>\r\n	t	toddlers.jpg	t	2013-01-03 18:53:01.177408	2013-01-03 18:54:03.306096			mission-statement
10	maria montessori	5		<p>\r\n\t&nbsp;</p>\r\n<div id="ctl12_placeholder" viewstate="false">\r\n\t<p>\r\n\t\t&nbsp;</p>\r\n\t<h2>\r\n\t\tMaria Montessori (1870-1952)</h2>\r\n\t<p>\r\n\t\tBorn in Chiaravalle in the Province of Ancona in 1870, Maria Montessori was the first woman to practice medicine in Italy. Having graduated from the Faculty of Medicine at the University of Rome in 1896 as a physician, Dr. Montessori was familiar with young children and became interested in their growth and learning.</p>\r\n\t<p align="justify">\r\n\t\tThrough careful and exhaustive scrutiny, noticing that the children spontaneously chose and worked with the learning materials she provided,&nbsp;she realized that children construct their own personalities and that they have a preference for the manner in which they learn. She also realized that certain characteristics of the mind change as the child develops.&nbsp;Montessori discovered that by offering a learning environment created uniquely for and adapted to the psychological characteristics of the child at each stage of development, learning not only comes more easily but is more spontaneous and exciting.</p>\r\n\t<p align="justify">\r\n\t\tHer approach to education stemmed from a solid grounding in biology, psychiatry and anthropology. She studied children of all races and cultures in many countries, soon seeing the universal human development playing out before her.</p>\r\n\t<p align="justify">\r\n\t\tMaria Montessori opened her first Casa dei Bambini (Children&#39;s House) in one of the very poorest areas in Rome - Quartiere di San Lorenzo.</p>\r\n</div>\r\n<div id="ctl13_placeholder" viewstate="false">\r\n\t<p>\r\n\t\t<em>&quot;It was January 6th (1907), when the first school was opened for small, normal children of between three and six years of age. I cannot say on my methods, for these did not yet exist. But in the school that was opened my method was shortly to come into being. On that day there was nothing to be seen but about fifty wretchedly poor children, rough and shy in manner, many of them crying, almost all the children of illiterate parents, who had been entrusted to my care&quot;... &quot;They were tearful, frightened children, so shy that it was impossible to get them to speak; their faces were expressionless, with bewildered eyes as though they had never seen anything in their lives.&quot;... &quot;It would be interesting to know the original circumstances that enabled these children to undergo such an extraordinary transformation,&nbsp;or rather, that brought about the appearance of new children, whose souls revealed themselves with such radiance as to spread a light through the whole world.&quot;</em></p>\r\n\t<p>\r\n\t\t- Dr. Maria Montessori</p>\r\n</div>\r\n<div id="ctl14_placeholder" viewstate="false">\r\n\t<p>\r\n\t\tIndeed it was as though this radiance had been caught in a stream of consciousness, for a mere six months after the opening of the Casa dei Bambini, people from all walks of life and from every continent came to see Maria Montessori&#39;s miracle children.</p>\r\n\t<p>\r\n\t\tIn 1909 she gave her first Montessori course, expecting to have only Italian teachers as students. To her amazement people attended from many different countries.&nbsp;</p>\r\n\t<p>\r\n\t\tMaria Montessori was a scientist, and as a good scientist, she was earth-bound and highly spiritual in her pursuit of truth. She studied medicine, specializing in psychiatry and anthropology. She was also an outstanding mathematician. Although she would never have considered being a teacher, she studied educational methods for many years and&nbsp;continued her observations throughout her life, widening and deepening her understanding until her death in 1952.</p>\r\n</div>\r\n<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\t&nbsp;</p>\r\n	t	maria.jpg	t	2013-01-03 19:11:54.286871	2013-01-03 19:12:51.352578			maria-montessori
11	toddler	6	<p>\r\n\t&quot;I need to discover what I can do.&quot;</p>\r\n	<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\tThe Toddler Community supports the abilities of the very young child. Our program is a partnership with parents, who are the first and most essential teachers of the child. Our teachers, or more accurately &quot;guides,&quot; are trained in child development. The importance of the period between sixteen and thirty-six months cannot be underestimated as research is helping us become more aware of the critical time this plays in the development of a child&#39;s cognitive abilities, social skills, sense of trust and personality. Montessori education is based on a deep respect for the latent abilities of the child.</p>\r\n<p>\r\n\tThe child develops by means of experience in his or her environment. We call such experience &quot;work.&quot; It is this work which assists the child in construction of one&#39;s self. Independence, language, sensory integration, motor development, and order are the primary learning areas in which the toddler age child works to construct him or herself.</p>\r\n<p>\r\n\tOur program supports the child&#39;s journey towards independence in a safe environment where the rhythm is toddler-paced and everything is toddler-sized, including low furniture, shelves, easily movable chairs, and artwork hung at eye-level. The sinks and refrigerator are real and accessible to the children. Through observation of other children, each toddler becomes curious about how to independently use the toilet.</p>\r\n<p>\r\n\tThe toddler age is the key stage in language acquisition. Our language-rich environment includes language materials and activities, music and song, reading and conversation, and exposure to Spanish.</p>\r\n<p>\r\n\tExploration and discovery are a primary need at this age. Our Toddler House provides an aesthetic and sensory-rich environment in which the young child is free to safely explore with the respectful assistance and encouragement of the adult.</p>\r\n<p>\r\n\tMovement is the need of the young child. The developing brain is stimulated and enhanced through movement, both small and large muscle, which must be perfected through practice. Our gross motor area within the classroom allows each child to move seamlessly between large and small muscle activities as needed.</p>\r\n<p>\r\n\tWe support a child&#39;s need for consistency and order by having a place for everything and putting everything back in its place during clean-up time. Our daily rhythm alternates between active and restful group and individual activities. Our seasonal rhythm includes gardening in spring, harvest and raking in autumn, and cooking and snow play during the winter. Walks on our lovely 15-acre campus are taken all year long.</p>\r\n<p>\r\n\tOur all-day program provides consistency in staff and continuity in environment. The self-assurance and independence gained through the work in the toddler environment not only prepares the child to move successfully to the next level (the Primary Classroom), but also lays the foundation for confident and joyful learning for life.</p>\r\n	t	toddlers2008.jpg	t	2013-01-03 19:17:15.613842	2013-01-03 20:02:32.181731			toddler
12	application procedure	8	<p>\r\n\tSteps to enrollment at St. Croix Montessori School</p>\r\n	<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\t<strong>I. Inquiry/Visit</strong></p>\r\n<p>\r\n\tPlease&nbsp;<a href="mailto:info@stcroixmontessori.org"><strong>contact</strong></a>&nbsp;the school to schedule a visit. Parents are strongly encouraged to visit the school without&nbsp;children&nbsp;before applying. Carefully review St. Croix Montessori School&#39;s program offerings, mission statement and core values and beliefs. During the visit, parents will observe our classrooms and learn more about our school and the Montessori philosophy.</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\t<strong>II. The Application</strong></p>\r\n<p>\r\n\tComplete the application form and send with the $100.00 non-refundable fee to SCMS. Call the school or download an application.<a href="http://stcroixmontessori.org/files/stcroixmontessori/files/Application%2012-13%20single%20pages.pdf" tabindex="0"><strong>Application for Admission to St. Croix Montessori School&nbsp;</strong></a><a href="http://stcroixmontessori.org/files/stcroixmontessori/files/SCM%20Application%20form%2011-12.pdf" tabindex="0"><img border="0" height="14" src="http://www.stcroixmontessori.org/images/programs/pdf_Icon.gif" width="14" /></a><em>&nbsp;<strong><em><a tabindex="0"><strong>print, complete &amp; fax or mail</strong></a></em></strong></em></p>\r\n<p>\r\n\t<strong>III. Acceptance</strong></p>\r\n<p>\r\n\tAcceptance of a child is based on several factors. The most important is the match of the family&#39;s and the school&#39;s educational goals for the child. Siblings of present contracted students are given priority, while new applicants are selected for the remaining spaces. One of our goals is to maintain gender and age balance within the classrooms.&nbsp; The first round of acceptances takes place the middle of February. Decisions are sent by mail. Accompanying the acceptance letter is an Enrollment Contract which must be completed and returned to the school with the $500.00 non-refundable tuition deposit &nbsp;within fourteen days. Depending on availability of space, additional rounds of acceptances will take place the middle of each month.&nbsp;</p>\r\n<p>\r\n\t<strong>V. Waiting Pool&nbsp;</strong><br />\r\n\t<br />\r\n\tIf there are no available spaces, applicants will be placed in our waiting pool. You will be notified when a place becomes available.</p>\r\n<p>\r\n\tVI. Placement&nbsp;<br />\r\n\t<br />\r\n\tFamilies will be notified of class placement by mail. The balance of age and gender are kept in mind as much as possible when assigning children to classrooms. The Montessori Method gives children the advantage of a mixed age classroom, so younger students are stretched by seeing the work of the older students, while older students grow from a meaningful leadership role in the class.</p>\r\n<p>\r\n\tThe mission of St. Croix Montessori School is to provide an ideal learning environment based on Montessori principles that will guide and nurture the full development of the individual.</p>\r\n	t	\N	f	2013-01-03 19:20:15.004802	2013-01-03 19:20:15.004802			application-procedure
13	staff	0	<p>\r\n\tMeet our staff</p>\r\n	<p>\r\n\tWe may need to add categories here ...&nbsp;</p>\r\n	f	\N	f	2013-01-03 21:39:55.726678	2013-01-03 21:39:55.726678			staff
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: maria_montessori
--

COPY schema_migrations (version) FROM stdin;
20121228230805
20121228230842
20130103150148
20130103150621
20130103165323
20130103172331
20130103200835
20130103213719
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: maria_montessori
--

COPY users (id, username, email, password_hash, password_salt, created_at, updated_at) FROM stdin;
1	scmadmin	sheri@stcroixmontessori.org	$2a$10$PNlq1Oy/sGqUqQ8AMo4u2.2cKXpMM8v372AV2WT17eCaaBDjVIGIG	$2a$10$PNlq1Oy/sGqUqQ8AMo4u2.	2013-01-02 20:50:34.614812	2013-01-02 20:50:34.614812
\.


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: maria_montessori; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: maria_montessori; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: maria_montessori; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: maria_montessori; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: maria_montessori; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: sfox
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM sfox;
GRANT ALL ON SCHEMA public TO sfox;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

