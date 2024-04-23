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
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
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
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 12, 152);
INSERT INTO public.games VALUES (2, 12, 340);
INSERT INTO public.games VALUES (3, 13, 79);
INSERT INTO public.games VALUES (4, 13, 584);
INSERT INTO public.games VALUES (5, 12, 216);
INSERT INTO public.games VALUES (6, 12, 371);
INSERT INTO public.games VALUES (7, 12, 608);
INSERT INTO public.games VALUES (8, 14, 8);
INSERT INTO public.games VALUES (9, 15, 797);
INSERT INTO public.games VALUES (10, 15, 404);
INSERT INTO public.games VALUES (11, 16, 310);
INSERT INTO public.games VALUES (12, 16, 735);
INSERT INTO public.games VALUES (13, 15, 536);
INSERT INTO public.games VALUES (14, 15, 61);
INSERT INTO public.games VALUES (15, 15, 429);
INSERT INTO public.games VALUES (16, 17, 610);
INSERT INTO public.games VALUES (17, 17, 587);
INSERT INTO public.games VALUES (18, 18, 431);
INSERT INTO public.games VALUES (19, 18, 289);
INSERT INTO public.games VALUES (20, 17, 528);
INSERT INTO public.games VALUES (21, 17, 583);
INSERT INTO public.games VALUES (22, 17, 747);
INSERT INTO public.games VALUES (23, 19, 734);
INSERT INTO public.games VALUES (24, 19, 762);
INSERT INTO public.games VALUES (25, 20, 609);
INSERT INTO public.games VALUES (26, 20, 62);
INSERT INTO public.games VALUES (27, 19, 177);
INSERT INTO public.games VALUES (28, 19, 22);
INSERT INTO public.games VALUES (29, 19, 72);
INSERT INTO public.games VALUES (30, 1, 11);
INSERT INTO public.games VALUES (31, 1, 9);
INSERT INTO public.games VALUES (32, 21, 615);
INSERT INTO public.games VALUES (33, 21, 583);
INSERT INTO public.games VALUES (34, 22, 652);
INSERT INTO public.games VALUES (35, 22, 56);
INSERT INTO public.games VALUES (36, 21, 913);
INSERT INTO public.games VALUES (37, 21, 77);
INSERT INTO public.games VALUES (38, 21, 962);
INSERT INTO public.games VALUES (39, 23, 388);
INSERT INTO public.games VALUES (40, 23, 673);
INSERT INTO public.games VALUES (41, 24, 434);
INSERT INTO public.games VALUES (42, 24, 469);
INSERT INTO public.games VALUES (43, 23, 342);
INSERT INTO public.games VALUES (44, 23, 759);
INSERT INTO public.games VALUES (45, 23, 321);
INSERT INTO public.games VALUES (46, 25, 502);
INSERT INTO public.games VALUES (47, 25, 591);
INSERT INTO public.games VALUES (48, 26, 859);
INSERT INTO public.games VALUES (49, 26, 918);
INSERT INTO public.games VALUES (50, 25, 542);
INSERT INTO public.games VALUES (51, 25, 698);
INSERT INTO public.games VALUES (52, 25, 730);
INSERT INTO public.games VALUES (53, 27, 919);
INSERT INTO public.games VALUES (54, 27, 576);
INSERT INTO public.games VALUES (55, 28, 899);
INSERT INTO public.games VALUES (56, 28, 748);
INSERT INTO public.games VALUES (57, 27, 230);
INSERT INTO public.games VALUES (58, 27, 966);
INSERT INTO public.games VALUES (59, 27, 731);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Ty');
INSERT INTO public.users VALUES (2, 'Joe');
INSERT INTO public.users VALUES (3, 'Mary');
INSERT INTO public.users VALUES (4, 'user_1713884909353');
INSERT INTO public.users VALUES (6, 'user_1713884909352');
INSERT INTO public.users VALUES (12, 'user_1713885066553');
INSERT INTO public.users VALUES (13, 'user_1713885066552');
INSERT INTO public.users VALUES (14, 'Bob');
INSERT INTO public.users VALUES (15, 'user_1713885194459');
INSERT INTO public.users VALUES (16, 'user_1713885194458');
INSERT INTO public.users VALUES (17, 'user_1713886046175');
INSERT INTO public.users VALUES (18, 'user_1713886046174');
INSERT INTO public.users VALUES (19, 'user_1713886866807');
INSERT INTO public.users VALUES (20, 'user_1713886866806');
INSERT INTO public.users VALUES (21, 'user_1713887584350');
INSERT INTO public.users VALUES (22, 'user_1713887584349');
INSERT INTO public.users VALUES (23, 'user_1713887963070');
INSERT INTO public.users VALUES (24, 'user_1713887963069');
INSERT INTO public.users VALUES (25, 'user_1713888403487');
INSERT INTO public.users VALUES (26, 'user_1713888403486');
INSERT INTO public.users VALUES (27, 'user_1713888479813');
INSERT INTO public.users VALUES (28, 'user_1713888479812');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 59, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (username);


--
-- Name: games fk_users_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_users_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

