--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    column1 integer NOT NULL,
    column2 integer NOT NULL,
    column3 integer,
    is_bool boolean,
    column4 text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    column1 integer NOT NULL,
    column2 integer NOT NULL,
    column3 integer,
    is_bool boolean,
    column4 text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    col1 integer NOT NULL,
    col2 integer NOT NULL,
    is_bool boolean,
    col3 numeric(4,1),
    col4 text,
    name character varying(20)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    column1 integer NOT NULL,
    column2 integer NOT NULL,
    column3 integer,
    is_bool boolean,
    column4 text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    column1 numeric(4,1) NOT NULL,
    column2 integer NOT NULL,
    column3 integer,
    is_bool boolean,
    column4 text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy A', 100, 200, 300, true, 'Description A');
INSERT INTO public.galaxy VALUES (2, 'Galaxy B', 150, 250, 350, false, 'Description B');
INSERT INTO public.galaxy VALUES (3, 'Galaxy C', 200, 300, 400, true, 'Description C');
INSERT INTO public.galaxy VALUES (4, 'Galaxy D', 250, 350, 450, false, 'Description D');
INSERT INTO public.galaxy VALUES (5, 'Galaxy E', 300, 400, 500, true, 'Description E');
INSERT INTO public.galaxy VALUES (6, 'Galaxy F', 400, 500, 600, true, 'Description F');
INSERT INTO public.galaxy VALUES (7, 'Galaxy G', 450, 550, 650, false, 'Description G');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (106, 'Moon 1', 50, 100, 150, true, 'Description 1', 1);
INSERT INTO public.moon VALUES (107, 'Moon 2', 70, 120, 180, false, 'Description 2', 1);
INSERT INTO public.moon VALUES (108, 'Moon 3', 60, 110, 160, true, 'Description 3', 2);
INSERT INTO public.moon VALUES (109, 'Moon 4', 80, 130, 190, false, 'Description 4', 2);
INSERT INTO public.moon VALUES (110, 'Moon 5', 90, 140, 200, true, 'Description 5', 3);
INSERT INTO public.moon VALUES (111, 'Moon 6', 50, 100, 150, true, 'Description 6', 3);
INSERT INTO public.moon VALUES (112, 'Moon 7', 70, 120, 180, false, 'Description 7', 4);
INSERT INTO public.moon VALUES (113, 'Moon 8', 60, 110, 160, true, 'Description 8', 4);
INSERT INTO public.moon VALUES (114, 'Moon 9', 80, 130, 190, false, 'Description 9', 5);
INSERT INTO public.moon VALUES (115, 'Moon 10', 90, 140, 200, true, 'Description 10', 5);
INSERT INTO public.moon VALUES (116, 'Moon 11', 50, 100, 150, true, 'Description 11', 1);
INSERT INTO public.moon VALUES (117, 'Moon 12', 70, 120, 180, false, 'Description 12', 1);
INSERT INTO public.moon VALUES (118, 'Moon 13', 60, 110, 160, true, 'Description 13', 2);
INSERT INTO public.moon VALUES (119, 'Moon 14', 80, 130, 190, false, 'Description 14', 2);
INSERT INTO public.moon VALUES (120, 'Moon 15', 90, 140, 200, true, 'Description 15', 3);
INSERT INTO public.moon VALUES (121, 'Moon 16', 50, 100, 150, true, 'Description 16', 3);
INSERT INTO public.moon VALUES (122, 'Moon 17', 70, 120, 180, false, 'Description 17', 4);
INSERT INTO public.moon VALUES (123, 'Moon 18', 60, 110, 160, true, 'Description 18', 4);
INSERT INTO public.moon VALUES (124, 'Moon 19', 80, 130, 190, false, 'Description 19', 5);
INSERT INTO public.moon VALUES (125, 'Moon 20', 90, 140, 200, true, 'Description 20', 5);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 10, 20, true, 1.5, 'Description 1', 'Info 1');
INSERT INTO public.more_info VALUES (2, 15, 25, false, 2.3, 'Description 2', 'Info 2');
INSERT INTO public.more_info VALUES (3, 20, 30, true, 3.7, 'Description 3', 'Info 3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', 500, 1000, 1500, true, 'Description 1', 1);
INSERT INTO public.planet VALUES (2, 'Planet 2', 700, 1200, 1800, false, 'Description 2', 1);
INSERT INTO public.planet VALUES (3, 'Planet 3', 600, 1100, 1600, true, 'Description 3', 2);
INSERT INTO public.planet VALUES (4, 'Planet 4', 800, 1300, 1900, false, 'Description 4', 2);
INSERT INTO public.planet VALUES (5, 'Planet 5', 900, 1400, 2000, true, 'Description 5', 3);
INSERT INTO public.planet VALUES (26, 'Planet 6', 700, 1500, 2000, true, 'Description 6', 1);
INSERT INTO public.planet VALUES (27, 'Planet 7', 800, 1600, 2100, false, 'Description 7', 2);
INSERT INTO public.planet VALUES (28, 'Planet 8', 900, 1700, 2200, true, 'Description 8', 3);
INSERT INTO public.planet VALUES (29, 'Planet 9', 1000, 1800, 2300, false, 'Description 9', 4);
INSERT INTO public.planet VALUES (30, 'Planet 10', 1100, 1900, 2400, true, 'Description 10', 5);
INSERT INTO public.planet VALUES (31, 'Planet 11', 1200, 2000, 2500, false, 'Description 11', 6);
INSERT INTO public.planet VALUES (32, 'Planet 12', 1300, 2100, 2600, true, 'Description 12', 7);
INSERT INTO public.planet VALUES (33, 'Planet 13', 1400, 2200, 2700, false, 'Description 13', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', 10.5, 100, 200, true, 'Description 1', 1);
INSERT INTO public.star VALUES (2, 'Star 2', 8.2, 150, 250, false, 'Description 2', 1);
INSERT INTO public.star VALUES (3, 'Star 3', 12.7, 200, 300, true, 'Description 3', 2);
INSERT INTO public.star VALUES (4, 'Star 4', 9.8, 250, 350, false, 'Description 4', 2);
INSERT INTO public.star VALUES (5, 'Star 5', 11.3, 300, 400, true, 'Description 5', 3);
INSERT INTO public.star VALUES (6, 'Star 6', 9.5, 400, 500, true, 'Description 6', 6);
INSERT INTO public.star VALUES (7, 'Star 7', 8.1, 450, 550, false, 'Description 7', 7);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 125, true);


--
-- Name: more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 33, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: more_info unique_name_more_info; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT unique_name_more_info UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

