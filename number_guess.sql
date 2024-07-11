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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guess integer DEFAULT 0
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 1, 4);
INSERT INTO public.games VALUES (3, 1, 15);
INSERT INTO public.games VALUES (4, 16, 952);
INSERT INTO public.games VALUES (5, 16, 7);
INSERT INTO public.games VALUES (6, 17, 176);
INSERT INTO public.games VALUES (7, 17, 602);
INSERT INTO public.games VALUES (8, 16, 42);
INSERT INTO public.games VALUES (9, 16, 166);
INSERT INTO public.games VALUES (10, 16, 351);
INSERT INTO public.games VALUES (11, 1, 9);
INSERT INTO public.games VALUES (12, 18, 545);
INSERT INTO public.games VALUES (13, 18, 848);
INSERT INTO public.games VALUES (14, 19, 827);
INSERT INTO public.games VALUES (15, 19, 480);
INSERT INTO public.games VALUES (16, 18, 711);
INSERT INTO public.games VALUES (17, 18, 688);
INSERT INTO public.games VALUES (18, 18, 771);
INSERT INTO public.games VALUES (19, 20, 991);
INSERT INTO public.games VALUES (20, 20, 805);
INSERT INTO public.games VALUES (21, 21, 400);
INSERT INTO public.games VALUES (22, 21, 703);
INSERT INTO public.games VALUES (23, 20, 969);
INSERT INTO public.games VALUES (24, 20, 266);
INSERT INTO public.games VALUES (25, 20, 550);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'l');
INSERT INTO public.users VALUES (2, 'user_1720726945341');
INSERT INTO public.users VALUES (3, 'user_1720726945340');
INSERT INTO public.users VALUES (4, 'user_1720731254455');
INSERT INTO public.users VALUES (5, 'user_1720731254454');
INSERT INTO public.users VALUES (6, 'user_1720731291845');
INSERT INTO public.users VALUES (7, 'user_1720731291844');
INSERT INTO public.users VALUES (8, 'user_1720731305273');
INSERT INTO public.users VALUES (9, 'user_1720731305272');
INSERT INTO public.users VALUES (10, 'user_1720731352352');
INSERT INTO public.users VALUES (11, 'user_1720731352351');
INSERT INTO public.users VALUES (12, 'user_1720731597321');
INSERT INTO public.users VALUES (13, 'user_1720731597320');
INSERT INTO public.users VALUES (14, 'user_1720731908665');
INSERT INTO public.users VALUES (15, 'user_1720731908664');
INSERT INTO public.users VALUES (16, 'user_1720734427793');
INSERT INTO public.users VALUES (17, 'user_1720734427792');
INSERT INTO public.users VALUES (18, 'user_1720734752233');
INSERT INTO public.users VALUES (19, 'user_1720734752232');
INSERT INTO public.users VALUES (20, 'user_1720734790224');
INSERT INTO public.users VALUES (21, 'user_1720734790223');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 25, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

