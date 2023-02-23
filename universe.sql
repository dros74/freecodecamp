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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_year integer NOT NULL,
    mass_in_kg integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    distance_from_earth_in_ly numeric NOT NULL,
    description text
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
    planet_id integer,
    name character varying(20) NOT NULL,
    life_detected boolean NOT NULL,
    description text
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
    star_id integer,
    name character varying(20) NOT NULL,
    life_detected boolean NOT NULL,
    nr_know_moons_orbiting integer,
    description text
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
    galaxy_id integer,
    name character varying(20) NOT NULL,
    star_class character varying(1),
    nr_know_planets_orbiting integer,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley’s Comet', 1705, 2214, 'A periodic comet visible from Earth every 76 years');
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 1995, 2219, 'A bright comet visible to the naked eye in 1997');
INSERT INTO public.comet VALUES (3, 'Comet Shoemaker-Levy 9', 1993, 5313, 'A comet that collided with Jupiter in 1994, leaving a visible impact scar on the planet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 0, 'The galaxy that the sun is part of');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 2.5, 'The closest galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'irregular', 25000, 'Member of the Local Group galaxies that the Milky Way is part of');
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 'eliptical', 760000000, 'One of the strongest radio sources in the sky');
INSERT INTO public.galaxy VALUES (5, 'Virgo A', 'eliptical', 53000000, 'aka M87, one of the largest massive galaxies in the local universe');
INSERT INTO public.galaxy VALUES (6, 'Lg Magellanic Cloud', 'spiral', 160000, 'aka LMC, is a satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (7, 'Sm Magellanic Cloud', 'irregular', 200000, 'aka SMC, is a satellite galaxy of the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 'Luna', false, 'The Moon of Earth');
INSERT INTO public.moon VALUES (2, NULL, 'Phobos', false, 'The larger moon of Mars');
INSERT INTO public.moon VALUES (3, NULL, 'Deimos', false, 'The smaller moon of Mars');
INSERT INTO public.moon VALUES (4, NULL, 'Ganymede', false, 'The largest moon in the solar system');
INSERT INTO public.moon VALUES (5, NULL, 'Callisto', false, 'The second largest moon in the solar system');
INSERT INTO public.moon VALUES (6, NULL, 'Io', false, 'The innermost of the four Galilean moons of Jupiter');
INSERT INTO public.moon VALUES (7, NULL, 'Europa', false, 'Evidence of subsurface ocean, possibly harboring life');
INSERT INTO public.moon VALUES (8, NULL, 'Titan', false, 'The only moon with a dense atmosphere, larger than Mercury');
INSERT INTO public.moon VALUES (9, NULL, 'Enceladus', false, 'Evidence of subsurface ocean, possibly harboring life');
INSERT INTO public.moon VALUES (10, NULL, 'Mimas', false, 'The smallest and innermost of Saturn’s major moons');
INSERT INTO public.moon VALUES (11, NULL, 'Hyperion', false, 'An irregularly shaped moon of Saturn');
INSERT INTO public.moon VALUES (12, NULL, 'Iapetus', false, 'Two-faced moon of Saturn');
INSERT INTO public.moon VALUES (13, NULL, 'Miranda', false, 'The smallest and innermost of Uranus’ five major moons');
INSERT INTO public.moon VALUES (14, NULL, 'Ariel', false, 'The brightest and fourth-largest of Uranus’ five major moons');
INSERT INTO public.moon VALUES (15, NULL, 'Umbriel', false, 'The third-largest of Uranus’ five major moons');
INSERT INTO public.moon VALUES (16, NULL, 'Titania', false, 'The largest of Uranus’ five major moons');
INSERT INTO public.moon VALUES (17, NULL, 'Oberon', false, 'The second-largest of Uranus’ five major moons');
INSERT INTO public.moon VALUES (18, NULL, 'Triton', true, 'The largest moon of Neptune, orbits in the opposite direction of Neptune’s rotation');
INSERT INTO public.moon VALUES (19, NULL, 'Proteus', false, 'The second-largest moon of Neptune');
INSERT INTO public.moon VALUES (20, NULL, 'Nereid', false, 'The third-largest moon of Neptune, highly eccentric orbit');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, NULL, 'Mercury', false, 0, 'The smallest and closest planet to the Sun');
INSERT INTO public.planet VALUES (10, NULL, 'Venus', false, 0, 'The second planet from the Sun and the hottest planet in our solar system');
INSERT INTO public.planet VALUES (11, NULL, 'Earth', true, 1, 'The only known planet to support life and the third planet from the Sun');
INSERT INTO public.planet VALUES (12, NULL, 'Mars', false, 2, 'The fourth planet from the Sun and also known as the "Red Planet"');
INSERT INTO public.planet VALUES (13, NULL, 'Jupiter', false, 79, 'The largest planet in our solar system and fifth planet from the Sun');
INSERT INTO public.planet VALUES (14, NULL, 'Saturn', false, 82, 'The sixth planet from the Sun and known for its rings');
INSERT INTO public.planet VALUES (15, NULL, 'Uranus', false, 27, 'The seventh planet from the Sun and tilted on its side');
INSERT INTO public.planet VALUES (16, NULL, 'Neptune', false, 14, 'The eighth planet from the Sun and the farthest planet from the Sun');
INSERT INTO public.planet VALUES (17, NULL, 'Kepler-22b', false, 0, 'The first exoplanet discovered in the habitable zone of a Sun-like star');
INSERT INTO public.planet VALUES (18, NULL, 'HD 209458 b', false, 0, 'The first exoplanet detected passing in front of its star');
INSERT INTO public.planet VALUES (19, NULL, 'Proxima Centauri b', false, 0, 'The closest exoplanet to Earth in the habitable zone of its star');
INSERT INTO public.planet VALUES (20, NULL, 'TRAPPIST-1e', false, 0, 'An Earth-sized exoplanet in the habitable zone of the ultracool dwarf star TRAPPIST-1');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, 'Rigel', 'B', 0, 'blue supergiant star in the constellation of Orion');
INSERT INTO public.star VALUES (2, NULL, 'Altair', 'A', 0, 'the brightest star in the constellation of Aquila');
INSERT INTO public.star VALUES (3, NULL, 'Proxima Centauri', 'M', 0, 'red dwarf star with a mass about 12.5% of the Sun’s mass');
INSERT INTO public.star VALUES (4, NULL, 'Epsilon Indi', 'K', 1, 'has only about three-fourths the mass of the Sun');
INSERT INTO public.star VALUES (5, NULL, 'Sun', 'G', 8, 'the center of our solar system');
INSERT INTO public.star VALUES (6, NULL, 'Procyon A', 'F', 0, 'the brightest star in the constellation of Canis Minor');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

