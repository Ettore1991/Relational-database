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
    name character varying(250) NOT NULL,
    description text,
    has_life boolean,
    age numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_beautiful boolean DEFAULT true
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(250) NOT NULL,
    planet_id integer NOT NULL,
    column_int integer,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(250) NOT NULL,
    age numeric(2,1),
    distance_from_earth integer,
    description text,
    has_water boolean,
    star_id integer DEFAULT 1
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(250) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    description text,
    galaxy_id integer DEFAULT 1
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lattea', 'La Via Lattea è la galassia a spirale.', true, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'La Galassia di Andromeda è la galassia più grande', false, 10);
INSERT INTO public.galaxy VALUES (3, 'Galassia del Triangolo', 'La Galassia del Triangolo è una galassia a spirale', false, 12);
INSERT INTO public.galaxy VALUES (4, 'Galassia del Girasole', 'Questa galassia a spirale si trova nella costellazione dei Cani da Caccia', false, 10);
INSERT INTO public.galaxy VALUES (5, 'Galassia del Sigaro', 'È una galassia a spirale irregolare', false, 5);
INSERT INTO public.galaxy VALUES (6, 'Galassia del Girino', 'Questa è una galassia a spirale', false, 10);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (4, 'a', true);
INSERT INTO public.galaxy_type VALUES (5, 'b', true);
INSERT INTO public.galaxy_type VALUES (6, 'c', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganimede', 5, 500, 1, 1);
INSERT INTO public.moon VALUES (2, 'Titano', 6, 600, 1, 1);
INSERT INTO public.moon VALUES (3, 'Io', 5, 700, 1, 1);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 800, 1, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 900, 1, 1);
INSERT INTO public.moon VALUES (6, 'Tritone', 8, 1000, 1, 1);
INSERT INTO public.moon VALUES (7, 'Luna', 3, 1100, 1, 1);
INSERT INTO public.moon VALUES (8, 'Encelado', 6, 1200, 1, 1);
INSERT INTO public.moon VALUES (9, 'Giove I (Io)', 5, 1300, 1, 1);
INSERT INTO public.moon VALUES (10, 'Rea', 6, 1400, 1, 1);
INSERT INTO public.moon VALUES (11, 'Giove II (Europa)', 5, 1500, 1, 1);
INSERT INTO public.moon VALUES (12, 'Giove III (Ganymede)', 5, 1600, 1, 1);
INSERT INTO public.moon VALUES (13, 'Giove IV (Callisto)', 5, 1700, 1, 1);
INSERT INTO public.moon VALUES (14, 'Titano I (Mimas)', 6, 1800, 1, 1);
INSERT INTO public.moon VALUES (15, 'Titano II (Enceladus)', 6, 1900, 1, 1);
INSERT INTO public.moon VALUES (16, 'Titano III (Tethys)', 6, 2000, 1, 1);
INSERT INTO public.moon VALUES (17, 'Titano IV (Dione)', 6, 2100, 1, 1);
INSERT INTO public.moon VALUES (18, 'Titano V (Rhea)', 6, 2200, 1, 1);
INSERT INTO public.moon VALUES (19, 'Titano VI (Titan)', 6, 2300, 1, 1);
INSERT INTO public.moon VALUES (20, 'Titano VII (Iapetus)', 6, 2400, 1, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 4.6, 77, 'Mercurio è il pianeta più vicino al Sole', false, 1);
INSERT INTO public.planet VALUES (2, 'Venere', 4.6, 38, 'Venere è spesso chiamato il gemello della Terra', false, 1);
INSERT INTO public.planet VALUES (3, 'Terra', 4.6, 0, 'La Terra è il nostro pianeta', true, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 4.6, 55, 'Marte è noto come il pianeta rosso', true, 1);
INSERT INTO public.planet VALUES (5, 'Giove', 4.6, 588, 'Giove è il più grande pianeta del sistema solare', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 4.6, 1200, 'Saturno è noto per i suoi anelli spettacolari', false, 1);
INSERT INTO public.planet VALUES (7, 'Urano', 4.6, 2600, 'Urano è un gigante gassoso', false, 1);
INSERT INTO public.planet VALUES (8, 'Nettuno', 4.6, 4300, 'Nettuno è il pianeta più esterno del sistema solare', false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-438 b', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (11, 'Gliese 3323 b', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 d', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (13, 'Ross 128 b', NULL, NULL, NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sole', 4.6, 0, 'Il Sole è una stella di medie dimensioni', 1);
INSERT INTO public.star VALUES (2, 'Sirio', 0.2, 8.6, 'Sirio è la stella più luminosa', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8.5, 724, 'Betelgeuse è una gigante rossa', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 6, 4.37, 'Alpha Centauri è un sistema stellare triplo', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4, 4.24, 'Proxima Centauri è una nana rossa', 1);
INSERT INTO public.star VALUES (6, 'Altair', 1.2, 16.8, 'Altair è una stella bianca', 1);
INSERT INTO public.star VALUES (7, 'Other', NULL, NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 4, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_column_int_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_column_int_key UNIQUE (column_int);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: planet unique_nam; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_nam UNIQUE (name);


--
-- Name: galaxy_type unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


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

