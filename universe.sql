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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer,
    name character varying(50) NOT NULL,
    mass numeric(15,2) NOT NULL,
    distance integer NOT NULL,
    num_of_craters integer NOT NULL,
    is_gigant boolean,
    has_life boolean,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric(15,2) NOT NULL,
    distance integer NOT NULL,
    num_of_stars integer,
    is_spiral boolean,
    is_elliptical boolean,
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
    name character varying(50) NOT NULL,
    mass numeric(15,2) NOT NULL,
    distance integer NOT NULL,
    num_of_craters integer NOT NULL,
    is_gigant boolean,
    has_life boolean,
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
    name character varying(50) NOT NULL,
    mass numeric(15,2) NOT NULL,
    distance integer NOT NULL,
    num_of_moons integer NOT NULL,
    has_life boolean,
    has_rings boolean,
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
    name character varying(50) NOT NULL,
    mass numeric(15,2) NOT NULL,
    distance integer NOT NULL,
    num_of_planets integer NOT NULL,
    is_gigant boolean,
    is_neutron boolean,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, 'Aethra', 6363.00, 85436, 1083, false, false, 'spotted with craters');
INSERT INTO public.asteroid VALUES (2, 2, 'Crithor', 6363.00, 85436, 1083, false, false, 'ash-colored and dim');
INSERT INTO public.asteroid VALUES (3, 5, 'Mira', 6363.00, 85436, 1083, false, false, 'glimmering faintly in red');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Eldrisia Veil', 433454747547.00, 2352343, 2436346, true, false, 'The Eldrisia Veil is a galaxy shrouded in myth and magic, where stars glow with ethereal, bluish-green light and nebulae shimmer like distant auroras. Ancient scholars believe it to be a sanctuary of celestial beings, its planets hosting enchanted forests, crystalline oceans, and skies filled with floating islands and moonlit forests.');
INSERT INTO public.galaxy VALUES (2, 'Karythis Spiral', 23563546.00, 34634, 34657567, false, true, 'A brilliant, tightly bound spiral of golden and silver stars, the Karythis Spiral is known for its harmonious worlds, each home to creatures of immense wisdom and grace. Some planets host floating cities, where the air hums with magical energy, while others are surrounded by oceans of liquid starlight that spill into space.');
INSERT INTO public.galaxy VALUES (3, 'Orryx Expanse', 8385636.00, 5475437, 74374734, true, false, 'The Orryx Expanse is a galaxy scarred by ancient cosmic conflicts, marked by dark regions of twisted space and nebulas pulsing with fiery red light. Its planets are rugged and perilous, inhabited by fearsome creatures and ruled by dark sorcery. Here, broken moons and rings of debris circle worlds scorched by red suns.');
INSERT INTO public.galaxy VALUES (4, 'Tandris Myriads', 346363.00, 3467235, 2356252, true, false, 'Known for its countless and vibrant star clusters, the Tandris Myriads is a chaotic yet beautiful galaxy, dotted with worlds of constant change. On some planets, days can last a thousand years, while others have skies alive with glowing storms of color. This galaxy is a haven for adventurers seeking rare materials and hidden wonders.');
INSERT INTO public.galaxy VALUES (5, 'Lothrion Shroud', 7474.00, 4574574, 3467457, true, false, 'Enveloped in a faint, ghostly haze, the Lothrion Shroud is a place of mystery and cosmic secrets, where time and space seem to warp and blend. It is home to worlds covered in perpetual mist, with ancient ruins and crystalline structures hidden beneath. Stars flicker like watchful eyes, and rumors speak of timeless entities guarding knowledge beyond mortal understanding.');
INSERT INTO public.galaxy VALUES (6, 'Shroud Lothrion ', 7474.00, 4574574, 3467457, true, false, 'Enveloped in a faint, ghostly haze, the Lothrion Shroud is a place of mystery and cosmic secrets, where time and space seem to warp and blend. It is home to worlds covered in perpetual mist, with ancient ruins and crystalline structures hidden beneath. Stars flicker like watchful eyes, and rumors speak of timeless entities guarding knowledge beyond mortal understanding.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Feyluna', 6363.00, 85436, 1083, false, false, 'covered in silver forests');
INSERT INTO public.moon VALUES (2, 1, 'Vaelan', 6363.00, 85436, 1083, false, false, 'pale lavender and shrouded in mist');
INSERT INTO public.moon VALUES (3, 2, 'Orris', 6363.00, 85436, 1083, false, false, 'turquoise-tinted, with vast canyons');
INSERT INTO public.moon VALUES (4, 2, 'Seraphim', 6363.00, 85436, 1083, false, false, 'reflects a golden hue');
INSERT INTO public.moon VALUES (5, 3, 'Lyra', 6363.00, 85436, 1083, false, false, 'shimmers like an opal');
INSERT INTO public.moon VALUES (6, 3, 'Douran', 6363.00, 85436, 1083, false, false, 'marked by phosphorescent dust clouds');
INSERT INTO public.moon VALUES (7, 4, 'Snowtide', 6363.00, 85436, 1083, false, false, 'perpetually snow-covered');
INSERT INTO public.moon VALUES (8, 4, 'Azka', 6363.00, 85436, 1083, false, false, 'icy cliffs and deep crevasses');
INSERT INTO public.moon VALUES (9, 5, 'Shirin', 6363.00, 85436, 1083, false, false, 'emerald-streaked');
INSERT INTO public.moon VALUES (10, 5, 'Torir', 6363.00, 85436, 1083, false, false, 'fiery red, with volcanic plains');
INSERT INTO public.moon VALUES (11, 6, 'Gallica', 6363.00, 85436, 1083, false, false, 'covered in red canyons');
INSERT INTO public.moon VALUES (12, 6, 'Veilis', 6363.00, 85436, 1083, false, false, 'reflective silver surface');
INSERT INTO public.moon VALUES (13, 7, 'Halith', 6363.00, 85436, 1083, false, false, 'marbled blue and purple');
INSERT INTO public.moon VALUES (14, 7, 'Dorea', 6363.00, 85436, 1083, false, false, 'covered in floating islands');
INSERT INTO public.moon VALUES (15, 8, 'Pelorin', 6363.00, 85436, 1083, false, false, 'pearl-white and luminous');
INSERT INTO public.moon VALUES (16, 8, 'Melira', 6363.00, 85436, 1083, false, false, 'dark blue and covered in magical flora');
INSERT INTO public.moon VALUES (17, 9, 'Arlya', 6363.00, 85436, 1083, false, false, 'soft green with mild weather');
INSERT INTO public.moon VALUES (18, 9, 'Eldwyn', 6363.00, 85436, 1083, false, false, 'partially cloaked in a mysterious fog');
INSERT INTO public.moon VALUES (19, 10, 'Flama', 6363.00, 85436, 1083, false, false, 'warm orange glow');
INSERT INTO public.moon VALUES (20, 10, 'Sulivis', 6363.00, 85436, 1083, false, false, 'blackened and crater-filled');
INSERT INTO public.moon VALUES (21, 11, 'Serrak', 6363.00, 85436, 1083, false, false, 'scarred and cratered');
INSERT INTO public.moon VALUES (22, 11, 'Fellon', 6363.00, 85436, 1083, false, false, 'dark and barely reflective');
INSERT INTO public.moon VALUES (23, 12, 'Grimblade', 6363.00, 85436, 1083, false, false, 'ashen and stormy');
INSERT INTO public.moon VALUES (24, 12, 'Riven', 6363.00, 85436, 1083, false, false, 'blackened and volcanic');
INSERT INTO public.moon VALUES (25, 13, 'Vorith', 6363.00, 85436, 1083, false, false, 'icy and desolate,');
INSERT INTO public.moon VALUES (26, 13, 'Lorn', 6363.00, 85436, 1083, false, false, 'gray with occasional flickers of light');
INSERT INTO public.moon VALUES (27, 14, 'Ashka', 6363.00, 85436, 1083, false, false, 'caked with ash');
INSERT INTO public.moon VALUES (28, 14, 'Drith', 6363.00, 85436, 1083, false, false, 'dry and barren, with deep cracks');
INSERT INTO public.moon VALUES (29, 15, 'Sable', 6363.00, 85436, 1083, false, false, 'charcoal-black');
INSERT INTO public.moon VALUES (30, 15, 'Fexan', 6363.00, 85436, 1083, false, false, 'flickering with red magma');
INSERT INTO public.moon VALUES (31, 16, 'Tempesta', 6363.00, 85436, 1083, false, false, 'whipped with cloud formations');
INSERT INTO public.moon VALUES (32, 16, 'Zora', 6363.00, 85436, 1083, false, false, 'green, rocky, and rough');
INSERT INTO public.moon VALUES (33, 17, 'Verith', 6363.00, 85436, 1083, false, false, 'lush green, like a mini-forest');
INSERT INTO public.moon VALUES (34, 17, 'Frael', 6363.00, 85436, 1083, false, false, 'purple haze surrounds it');
INSERT INTO public.moon VALUES (35, 18, 'Maleth', 6363.00, 85436, 1083, false, false, 'green, spotted with ancient ruins');
INSERT INTO public.moon VALUES (36, 18, 'Siren', 6363.00, 85436, 1083, false, false, 'crystalline, sings a strange tune');
INSERT INTO public.moon VALUES (37, 19, 'Aurae', 6363.00, 85436, 1083, false, false, 'reflects rainbow light');
INSERT INTO public.moon VALUES (38, 19, 'Teren', 6363.00, 85436, 1083, false, false, 'dense forests of alien trees');
INSERT INTO public.moon VALUES (39, 20, 'Zephyr', 6363.00, 85436, 1083, false, false, 'fiery red with storms');
INSERT INTO public.moon VALUES (40, 20, 'Omira', 6363.00, 85436, 1083, false, false, 'desert-like, with rolling dunes');
INSERT INTO public.moon VALUES (41, 21, 'Veilith', 6363.00, 85436, 1083, false, false, 'hazy with deep fog');
INSERT INTO public.moon VALUES (42, 21, 'Orryn', 6363.00, 85436, 1083, false, false, 'high crags and peaks');
INSERT INTO public.moon VALUES (43, 22, 'Korra', 6363.00, 85436, 1083, false, false, 'barely reflective, ghostly');
INSERT INTO public.moon VALUES (44, 22, 'Lumir', 6363.00, 85436, 1083, false, false, 'pale and cratered');
INSERT INTO public.moon VALUES (45, 23, 'Shirza', 6363.00, 85436, 1083, false, false, 'gray with rough terrain');
INSERT INTO public.moon VALUES (46, 23, 'Fairos', 6363.00, 85436, 1083, false, false, 'covered in thin, white mist');
INSERT INTO public.moon VALUES (47, 24, 'Nilith', 6363.00, 85436, 1083, false, false, 'wisps of clouds');
INSERT INTO public.moon VALUES (48, 24, 'Aethra', 6363.00, 85436, 1083, false, false, 'spotted with craters');
INSERT INTO public.moon VALUES (49, 25, 'Crithor', 6363.00, 85436, 1083, false, false, 'ash-colored and dim');
INSERT INTO public.moon VALUES (50, 25, 'Mira', 6363.00, 85436, 1083, false, false, 'glimmering faintly in red');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Thalorra', 4534.00, 47, 4, true, true, 'A lush planet covered in vast, bioluminescent forests and crystal rivers.');
INSERT INTO public.planet VALUES (2, 1, 'Mirien', 4534.00, 47, 4, true, true, 'A water world with floating crystal cities and massive oceanic fauna.');
INSERT INTO public.planet VALUES (3, 2, 'Astralis', 4534.00, 47, 4, true, true, 'A world of magical deserts, shifting with sand patterns resembling arcane symbols.');
INSERT INTO public.planet VALUES (4, 2, 'Celador', 4534.00, 47, 4, true, true, 'A wintery, icy realm with towering auroras and mysterious ice creatures.');
INSERT INTO public.planet VALUES (5, 2, 'Nimrion', 4534.00, 47, 4, true, true, 'A jewel-like world with cities made of crystal, where magic flows like water.');
INSERT INTO public.planet VALUES (6, 3, 'Solarin', 4534.00, 47, 4, true, true, 'A golden desert planet with oases of precious metals and radiant sand dunes.');
INSERT INTO public.planet VALUES (7, 3, 'Zerin', 4534.00, 47, 4, true, true, 'A gas giant with intricate cloud patterns and massive floating spires of crystal.');
INSERT INTO public.planet VALUES (8, 4, 'Nymeris', 4534.00, 47, 4, true, true, 'Known as the "Sanctuary Planet," with landscapes of glimmering white sands and quiet valleys.');
INSERT INTO public.planet VALUES (9, 4, 'Galdaris', 4534.00, 47, 4, true, true, 'A tranquil planet with vast fields of silver flowers and rainforests that shimmer at dusk.');
INSERT INTO public.planet VALUES (10, 4, 'Celeste', 4534.00, 47, 4, true, true, 'A volcanic world with cities shielded in glass domes to protect from constant lava flows.');
INSERT INTO public.planet VALUES (11, 5, 'Nexdor', 4534.00, 47, 4, true, true, 'A rocky planet with a landscape of canyons and ravines lit by crimson lava rivers.');
INSERT INTO public.planet VALUES (12, 5, 'Volkarra', 4534.00, 47, 4, true, true, 'Known for its jagged mountain ranges and dark forests.');
INSERT INTO public.planet VALUES (13, 6, 'Vathros', 4534.00, 47, 4, true, true, 'A frozen planet with jagged ice formations and ghostly apparitions.');
INSERT INTO public.planet VALUES (14, 6, 'Caldros', 4534.00, 47, 4, true, true, 'An ancient, desert-like world with crumbling ruins and dark temples.');
INSERT INTO public.planet VALUES (15, 6, 'Ghriess', 4534.00, 47, 4, true, true, 'A desolate planet with shifting sandstorms and dried-up riverbeds.');
INSERT INTO public.planet VALUES (16, 7, 'Rilya', 4534.00, 47, 4, true, true, 'A watery world with storms that rage across its many seas and floating mountain islands.');
INSERT INTO public.planet VALUES (17, 7, 'Serenna', 4534.00, 47, 4, true, true, 'A planet with glowing, phosphorescent jungles and enormous flying creatures.');
INSERT INTO public.planet VALUES (18, 8, 'Galatia', 4534.00, 47, 4, true, true, 'An ocean world dotted with islands that move and shift with tides.');
INSERT INTO public.planet VALUES (19, 8, 'Mirros', 4534.00, 47, 4, true, true, 'Known for its vast plains and herds of fantastical creatures.');
INSERT INTO public.planet VALUES (20, 8, 'Tornis', 4534.00, 47, 4, true, true, 'A land of molten rivers and copper mountains.');
INSERT INTO public.planet VALUES (21, 9, 'Erythra', 4534.00, 47, 4, true, true, 'A cold, misty world with endless mountain chains and hidden valleys.');
INSERT INTO public.planet VALUES (22, 9, 'Nyx', 4534.00, 47, 4, true, true, 'A dark, eerie planet filled with deep, shadowed forests and ancient ruins.');
INSERT INTO public.planet VALUES (23, 10, 'Silithar', 4534.00, 47, 4, true, true, 'A desert planet with ancient, unknown structures and swirling sands.');
INSERT INTO public.planet VALUES (24, 10, 'Vorath', 4534.00, 47, 4, true, true, 'A shattered world of fragmented continents, floating islands, and drifting landmasses.');
INSERT INTO public.planet VALUES (25, 10, 'Umbril', 4534.00, 47, 4, true, true, 'A volcanic planet with rivers of silver lava that glows eerily at night.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Azurea', 3252.00, 32532, 4, false, false, 'Known as the "Serene Star," Azurea has a soft, bluish-green glow that illuminates the Eldrisian realms. It’s said to inspire tranquility and magical insight on planets within its orbit.');
INSERT INTO public.star VALUES (2, 1, 'Lyrelith', 345652.00, 32932, 5, false, false, 'Known as the "Celestial Harp," Lyrelith emits musical vibrations throughout the galaxy, believed to be the harmonizing force of magic within Eldrisia.');
INSERT INTO public.star VALUES (3, 2, 'Aurelios', 345652.00, 32932, 5, false, false, 'Known as the "Golden Sun," Aurelios casts warm, golden light, fostering harmonious, prosperous civilizations on its planets.');
INSERT INTO public.star VALUES (4, 2, 'Elerius', 345652.00, 32932, 5, false, false, 'The "Silver Beacon," Elerius has a bright, silvery glow, known for its healing properties and association with wisdom.');
INSERT INTO public.star VALUES (5, 3, 'Nexaris', 345652.00, 32932, 5, false, false, 'The "Blood Star," Nexaris glows with a dark red hue, casting ominous light and symbolizing the galaxy’s chaotic energy.');
INSERT INTO public.star VALUES (6, 3, 'Zalkar', 345652.00, 32932, 5, false, false, 'The "Ashen Star," Zalkar’s light is pale and ghostly, creating an eerie atmosphere on its planets.');
INSERT INTO public.star VALUES (7, 4, 'Thessira', 345652.00, 32932, 5, false, false, 'Known as the "Storm Star," Thessira is a vibrant star with electric flares, associated with the unpredictable and chaotic.');
INSERT INTO public.star VALUES (8, 4, 'Veridan', 345652.00, 32932, 5, false, false, 'The "Emerald Sun," casting a greenish light that fosters strange flora and fauna on its planets.');
INSERT INTO public.star VALUES (9, 5, 'Murais', 345652.00, 32932, 5, false, false, 'Known as the "Ghost Star," Murais has a faint, bluish-white glow, illuminating its planets in a permanent ');
INSERT INTO public.star VALUES (10, 5, 'Xyphor', 345652.00, 32932, 5, false, false, 'The "Spectral Light," Xyphor’s starry haze gives off a dim but encompassing glow, said to be connected to ancient, arcane knowledge.');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 50, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

