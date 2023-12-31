--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name_id integer NOT NULL,
    n_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: names; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.names (
    name character varying(22) NOT NULL,
    name_id integer NOT NULL
);


ALTER TABLE public.names OWNER TO freecodecamp;

--
-- Name: names_name_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.names_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.names_name_id_seq OWNER TO freecodecamp;

--
-- Name: names_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.names_name_id_seq OWNED BY public.names.name_id;


--
-- Name: names name_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.names ALTER COLUMN name_id SET DEFAULT nextval('public.names_name_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 8);
INSERT INTO public.games VALUES (1, 2);
INSERT INTO public.games VALUES (1, 1);
INSERT INTO public.games VALUES (2, 5);
INSERT INTO public.games VALUES (4, 402);
INSERT INTO public.games VALUES (4, 802);
INSERT INTO public.games VALUES (5, 238);
INSERT INTO public.games VALUES (5, 7);
INSERT INTO public.games VALUES (4, 14);
INSERT INTO public.games VALUES (4, 962);
INSERT INTO public.games VALUES (4, 408);
INSERT INTO public.games VALUES (6, 400);
INSERT INTO public.games VALUES (6, 465);
INSERT INTO public.games VALUES (7, 262);
INSERT INTO public.games VALUES (7, 206);
INSERT INTO public.games VALUES (6, 162);
INSERT INTO public.games VALUES (6, 212);
INSERT INTO public.games VALUES (6, 860);
INSERT INTO public.games VALUES (8, 59);
INSERT INTO public.games VALUES (8, 10);
INSERT INTO public.games VALUES (9, 111);
INSERT INTO public.games VALUES (9, 459);
INSERT INTO public.games VALUES (8, 465);
INSERT INTO public.games VALUES (8, 242);
INSERT INTO public.games VALUES (8, 162);
INSERT INTO public.games VALUES (10, 632);
INSERT INTO public.games VALUES (10, 365);
INSERT INTO public.games VALUES (11, 811);
INSERT INTO public.games VALUES (11, 473);
INSERT INTO public.games VALUES (10, 299);
INSERT INTO public.games VALUES (10, 742);
INSERT INTO public.games VALUES (10, 994);
INSERT INTO public.games VALUES (12, 816);
INSERT INTO public.games VALUES (12, 526);
INSERT INTO public.games VALUES (13, 103);
INSERT INTO public.games VALUES (13, 623);
INSERT INTO public.games VALUES (12, 501);
INSERT INTO public.games VALUES (12, 169);
INSERT INTO public.games VALUES (12, 349);
INSERT INTO public.games VALUES (14, 343);
INSERT INTO public.games VALUES (14, 631);
INSERT INTO public.games VALUES (15, 850);
INSERT INTO public.games VALUES (15, 588);
INSERT INTO public.games VALUES (14, 40);
INSERT INTO public.games VALUES (14, 346);
INSERT INTO public.games VALUES (14, 974);
INSERT INTO public.games VALUES (16, 421);
INSERT INTO public.games VALUES (16, 964);
INSERT INTO public.games VALUES (17, 899);
INSERT INTO public.games VALUES (17, 680);
INSERT INTO public.games VALUES (16, 168);
INSERT INTO public.games VALUES (16, 796);
INSERT INTO public.games VALUES (16, 914);
INSERT INTO public.games VALUES (18, 539);
INSERT INTO public.games VALUES (18, 790);
INSERT INTO public.games VALUES (19, 455);
INSERT INTO public.games VALUES (19, 104);
INSERT INTO public.games VALUES (18, 206);
INSERT INTO public.games VALUES (18, 789);
INSERT INTO public.games VALUES (18, 388);


--
-- Data for Name: names; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.names VALUES ('ettore', 1);
INSERT INTO public.names VALUES ('test', 2);
INSERT INTO public.names VALUES ('', 3);
INSERT INTO public.names VALUES ('user_1704044312183', 4);
INSERT INTO public.names VALUES ('user_1704044312182', 5);
INSERT INTO public.names VALUES ('user_1704044580614', 6);
INSERT INTO public.names VALUES ('user_1704044580613', 7);
INSERT INTO public.names VALUES ('user_1704044614408', 8);
INSERT INTO public.names VALUES ('user_1704044614407', 9);
INSERT INTO public.names VALUES ('user_1704044634823', 10);
INSERT INTO public.names VALUES ('user_1704044634822', 11);
INSERT INTO public.names VALUES ('user_1704044649766', 12);
INSERT INTO public.names VALUES ('user_1704044649765', 13);
INSERT INTO public.names VALUES ('user_1704044677618', 14);
INSERT INTO public.names VALUES ('user_1704044677617', 15);
INSERT INTO public.names VALUES ('user_1704044739450', 16);
INSERT INTO public.names VALUES ('user_1704044739449', 17);
INSERT INTO public.names VALUES ('user_1704044769202', 18);
INSERT INTO public.names VALUES ('user_1704044769201', 19);


--
-- Name: names_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.names_name_id_seq', 19, true);


--
-- Name: names names_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_name_key UNIQUE (name);


--
-- Name: names names_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (name_id);


--
-- Name: games games_name_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_name_id_fkey FOREIGN KEY (name_id) REFERENCES public.names(name_id);


--
-- PostgreSQL database dump complete
--

