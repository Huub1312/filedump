
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
    name character varying(30) NOT NULL,
    size integer,
    has_black_hole boolean,
    tastes_like_cheese boolean,
    nr_of_doomsday_devices numeric
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer,
    has_life boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    number_of_moons numeric,
    atmosphere text DEFAULT 'Unknown'::text,
    star_id integer
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
    name character varying(30) NOT NULL,
    temperature_k integer,
    is_supernova boolean,
    galaxy_id integer,
    system_id integer
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxyA', 10, true, false, 0);
INSERT INTO public.galaxy VALUES (2, 'galaxyB', 20, false, false, 0);
INSERT INTO public.galaxy VALUES (3, 'galaxyC', 30, true, false, 0);
INSERT INTO public.galaxy VALUES (4, 'galaxyD', 25, true, false, 0);
INSERT INTO public.galaxy VALUES (5, 'galaxyE', 12, true, false, 0);
INSERT INTO public.galaxy VALUES (6, 'galaxyF', 43, true, false, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moonA1', 1800, false, 1);
INSERT INTO public.moon VALUES (2, 'moonA2', 1900, false, 1);
INSERT INTO public.moon VALUES (3, 'moonA3', 1200, false, 1);
INSERT INTO public.moon VALUES (4, 'moonB1', 2800, false, 2);
INSERT INTO public.moon VALUES (5, 'moonA2', 1600, false, 2);
INSERT INTO public.moon VALUES (6, 'moonC1', 3800, true, 3);
INSERT INTO public.moon VALUES (7, 'moonD1', 2000, false, 44);
INSERT INTO public.moon VALUES (8, 'moonE1', 2500, true, 45);
INSERT INTO public.moon VALUES (9, 'moonF1', 1800, false, 46);
INSERT INTO public.moon VALUES (10, 'moonG1', 3000, false, 47);
INSERT INTO public.moon VALUES (11, 'moonH1', 2200, false, 48);
INSERT INTO public.moon VALUES (12, 'moonI1', 2600, true, 49);
INSERT INTO public.moon VALUES (13, 'moonJ1', 3200, false, 50);
INSERT INTO public.moon VALUES (14, 'moonK1', 2800, false, 51);
INSERT INTO public.moon VALUES (15, 'moonL1', 2400, false, 52);
INSERT INTO public.moon VALUES (16, 'moonM1', 1800, false, 53);
INSERT INTO public.moon VALUES (17, 'moonN1', 2100, true, 54);
INSERT INTO public.moon VALUES (18, 'moonO1', 2900, false, 55);
INSERT INTO public.moon VALUES (19, 'moonP1', 2700, false, 56);
INSERT INTO public.moon VALUES (20, 'moonQ1', 2300, false, 57);
INSERT INTO public.moon VALUES (21, 'moonR1', 2600, false, 58);
INSERT INTO public.moon VALUES (22, 'moonS1', 3100, true, 59);
INSERT INTO public.moon VALUES (23, 'moonT1', 2000, false, 60);
INSERT INTO public.moon VALUES (24, 'moonU1', 2400, false, 61);
INSERT INTO public.moon VALUES (25, 'moonV1', 2800, false, 62);
INSERT INTO public.moon VALUES (26, 'moonW1', 2500, false, 63);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planetA', 3, 'Nitrogen', 1);
INSERT INTO public.planet VALUES (2, 'planetB', 2, 'Helium', 2);
INSERT INTO public.planet VALUES (3, 'planetC', 1, 'Nitrous Oxide', 3);
INSERT INTO public.planet VALUES (44, 'planetD', 2, 'Amyl Nitrite', 3);
INSERT INTO public.planet VALUES (45, 'planetC', 4, 'Gas', 5);
INSERT INTO public.planet VALUES (46, 'planetD', 3, 'Gas', 5);
INSERT INTO public.planet VALUES (47, 'planetE', 2, 'Gas', 6);
INSERT INTO public.planet VALUES (48, 'planetF', 1, 'Gas', 7);
INSERT INTO public.planet VALUES (49, 'planetG', 2, 'Gas', 8);
INSERT INTO public.planet VALUES (50, 'planetH', 2, 'Gas', 9);
INSERT INTO public.planet VALUES (51, 'planetI', 4, 'Gas', 10);
INSERT INTO public.planet VALUES (52, 'planetJ', 3, 'Gas', 11);
INSERT INTO public.planet VALUES (53, 'planetK', 2, 'Gas', 1);
INSERT INTO public.planet VALUES (54, 'planetL', 1, 'Gas', 2);
INSERT INTO public.planet VALUES (55, 'planetM', 5, 'Gas', 3);
INSERT INTO public.planet VALUES (56, 'planetN', 6, 'Gas', 3);
INSERT INTO public.planet VALUES (57, 'planetO', 1, 'Gas', 5);
INSERT INTO public.planet VALUES (58, 'planetP', 3, 'Gas', 6);
INSERT INTO public.planet VALUES (59, 'planetQ', 1, 'Gas', 7);
INSERT INTO public.planet VALUES (60, 'planetR', 9, 'Gas', 8);
INSERT INTO public.planet VALUES (61, 'planetS', 7, 'Gas', 9);
INSERT INTO public.planet VALUES (62, 'planetT', 4, 'Gas', 10);
INSERT INTO public.planet VALUES (63, 'planetU', 4, 'Gas', 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'starA', 50000, false, 1, 1);
INSERT INTO public.star VALUES (2, 'starB', 75000, false, 2, 2);
INSERT INTO public.star VALUES (3, 'starC', 10000, true, 3, 3);
INSERT INTO public.star VALUES (5, 'starD', 60000, false, 4, 4);
INSERT INTO public.star VALUES (6, 'starE', 60000, false, 5, 5);
INSERT INTO public.star VALUES (7, 'starF', 65000, false, 6, 6);
INSERT INTO public.star VALUES (8, 'starF', 55000, false, 1, 7);
INSERT INTO public.star VALUES (9, 'starG', 67000, false, 2, 8);
INSERT INTO public.star VALUES (10, 'starH', 69000, false, 3, 9);
INSERT INTO public.star VALUES (11, 'starI', 70000, true, 4, 10);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'systemA', 1);
INSERT INTO public.system VALUES (2, 'systemB', 2);
INSERT INTO public.system VALUES (3, 'systemC', 3);
INSERT INTO public.system VALUES (4, 'systemD', 4);
INSERT INTO public.system VALUES (5, 'systemE', 5);
INSERT INTO public.system VALUES (6, 'systemF', 6);
INSERT INTO public.system VALUES (7, 'systemG', 1);
INSERT INTO public.system VALUES (8, 'systemH', 2);
INSERT INTO public.system VALUES (9, 'systemI', 3);
INSERT INTO public.system VALUES (10, 'systemJ', 4);
INSERT INTO public.system VALUES (11, 'systemK', 5);
INSERT INTO public.system VALUES (12, 'systemL', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 63, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 12, true);


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
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: system unique_system_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT unique_system_id UNIQUE (system_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_star_system; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_system FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: system fk_system_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT fk_system_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

