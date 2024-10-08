--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: check_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
	IF NEW.start_date < CURRENT_DATE OR NEW.end_date < CURRENT_DATE THEN
		RAISE EXCEPTION 'Entered Date cannot be before Current Date';
	END IF;
	RETURN NEW;
END;$$;


ALTER FUNCTION public.check_date() OWNER TO postgres;

--
-- Name: validate_phone_number(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_phone_number() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
BEGIN
	IF NEW.phone IS NOT NULL THEN
		IF NEW.phone !~ '^[0-9]{3}-[0-9]{3}-[0-9]{4}$' THEN
			RAISE EXCEPTION 'Invalid Phone Number Format';
		END IF;
	END IF;
	RETURN NEW;
END;
$_$;


ALTER FUNCTION public.validate_phone_number() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenities (
    amenitiesid bigint NOT NULL,
    roomid bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.amenities OWNER TO postgres;

--
-- Name: amenities_amenitiesID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."amenities_amenitiesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."amenities_amenitiesID_seq" OWNER TO postgres;

--
-- Name: amenities_amenitiesID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."amenities_amenitiesID_seq" OWNED BY public.amenities.amenitiesid;


--
-- Name: amenities_roomID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."amenities_roomID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."amenities_roomID_seq" OWNER TO postgres;

--
-- Name: amenities_roomID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."amenities_roomID_seq" OWNED BY public.amenities.roomid;


--
-- Name: archives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archives (
    archivesid bigint NOT NULL,
    rentingid bigint,
    additionaldetails character varying(255)
);


ALTER TABLE public.archives OWNER TO postgres;

--
-- Name: archives_archivesID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."archives_archivesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."archives_archivesID_seq" OWNER TO postgres;

--
-- Name: archives_archivesID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."archives_archivesID_seq" OWNED BY public.archives.archivesid;


--
-- Name: archives_rentingID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."archives_rentingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."archives_rentingID_seq" OWNER TO postgres;

--
-- Name: archives_rentingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."archives_rentingID_seq" OWNED BY public.archives.rentingid;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    bookingid bigint NOT NULL,
    customerid bigint NOT NULL,
    roomid bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_bookingID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."booking_bookingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."booking_bookingID_seq" OWNER TO postgres;

--
-- Name: booking_bookingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."booking_bookingID_seq" OWNED BY public.booking.bookingid;


--
-- Name: booking_customerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."booking_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."booking_customerID_seq" OWNER TO postgres;

--
-- Name: booking_customerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."booking_customerID_seq" OWNED BY public.booking.customerid;


--
-- Name: booking_roomID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."booking_roomID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."booking_roomID_seq" OWNER TO postgres;

--
-- Name: booking_roomID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."booking_roomID_seq" OWNED BY public.booking.roomid;


--
-- Name: checks_in; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.checks_in (
    customerid bigint NOT NULL,
    rentingid bigint NOT NULL,
    employeeid bigint NOT NULL
);


ALTER TABLE public.checks_in OWNER TO postgres;

--
-- Name: checks_in_customerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."checks_in_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."checks_in_customerID_seq" OWNER TO postgres;

--
-- Name: checks_in_customerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."checks_in_customerID_seq" OWNED BY public.checks_in.customerid;


--
-- Name: checks_in_employeeID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."checks_in_employeeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."checks_in_employeeID_seq" OWNER TO postgres;

--
-- Name: checks_in_employeeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."checks_in_employeeID_seq" OWNED BY public.checks_in.employeeid;


--
-- Name: checks_in_rentingID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."checks_in_rentingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."checks_in_rentingID_seq" OWNER TO postgres;

--
-- Name: checks_in_rentingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."checks_in_rentingID_seq" OWNED BY public.checks_in.rentingid;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customerid bigint NOT NULL,
    typeid integer NOT NULL,
    fullname character varying(255) NOT NULL,
    address character varying(255),
    password character varying(255) NOT NULL,
    registrationdate date DEFAULT CURRENT_DATE
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."customer_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."customer_customerID_seq" OWNER TO postgres;

--
-- Name: customer_customerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."customer_customerID_seq" OWNED BY public.customer.customerid;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeeid bigint NOT NULL,
    hotelid bigint NOT NULL,
    ssn_sin_type smallint,
    fullname character varying(255) NOT NULL,
    address character varying(255),
    roleposition character varying(255),
    password character varying(255) NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employeeID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."employee_employeeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."employee_employeeID_seq" OWNER TO postgres;

--
-- Name: employee_employeeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."employee_employeeID_seq" OWNED BY public.employee.employeeid;


--
-- Name: employee_hotelID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."employee_hotelID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."employee_hotelID_seq" OWNER TO postgres;

--
-- Name: employee_hotelID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."employee_hotelID_seq" OWNED BY public.employee.hotelid;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    hotelid bigint NOT NULL,
    room_number integer DEFAULT 0,
    chainid bigint NOT NULL,
    "hotelAddress" character varying(255),
    email character varying(255),
    hotelstar smallint,
    manager character varying(255),
    phone character varying(255)
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- Name: hotel_chain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel_chain (
    chainid bigint NOT NULL,
    hotel_number smallint DEFAULT 0,
    email character varying(255),
    phone character varying(255)
);


ALTER TABLE public.hotel_chain OWNER TO postgres;

--
-- Name: hotel_chainID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hotel_chainID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."hotel_chainID_seq" OWNER TO postgres;

--
-- Name: hotel_chainID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hotel_chainID_seq" OWNED BY public.hotel.chainid;


--
-- Name: hotel_chain_chainID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hotel_chain_chainID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."hotel_chain_chainID_seq" OWNER TO postgres;

--
-- Name: hotel_chain_chainID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hotel_chain_chainID_seq" OWNED BY public.hotel_chain.chainid;


--
-- Name: hotel_hotelID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hotel_hotelID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."hotel_hotelID_seq" OWNER TO postgres;

--
-- Name: hotel_hotelID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hotel_hotelID_seq" OWNED BY public.hotel.hotelid;


--
-- Name: hotel_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel_room (
    roomid smallint DEFAULT 0 NOT NULL,
    hotelid bigint NOT NULL,
    price real,
    extension boolean,
    damages boolean,
    capacity character varying(255),
    sea_mountainview character varying(255)
);


ALTER TABLE public.hotel_room OWNER TO postgres;

--
-- Name: hotel_room_hotelID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hotel_room_hotelID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."hotel_room_hotelID_seq" OWNER TO postgres;

--
-- Name: hotel_room_hotelID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hotel_room_hotelID_seq" OWNED BY public.hotel_room.hotelid;


--
-- Name: renting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.renting (
    rentingid bigint NOT NULL,
    customerid bigint NOT NULL,
    roomid bigint NOT NULL,
    payment integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);


ALTER TABLE public.renting OWNER TO postgres;

--
-- Name: renting_customerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."renting_customerID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."renting_customerID_seq" OWNER TO postgres;

--
-- Name: renting_customerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."renting_customerID_seq" OWNED BY public.renting.customerid;


--
-- Name: renting_rentingID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."renting_rentingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."renting_rentingID_seq" OWNER TO postgres;

--
-- Name: renting_rentingID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."renting_rentingID_seq" OWNED BY public.renting.rentingid;


--
-- Name: renting_roomID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."renting_roomID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."renting_roomID_seq" OWNER TO postgres;

--
-- Name: renting_roomID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."renting_roomID_seq" OWNED BY public.renting.roomid;


--
-- Name: view_1_available_rooms_hotel; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_1_available_rooms_hotel AS
 SELECT hotel_room.hotelid AS "hotelID",
    count(*) AS available_rooms
   FROM ((public.hotel_room
     LEFT JOIN public.renting ON ((hotel_room.roomid = renting.roomid)))
     LEFT JOIN public.booking ON ((hotel_room.roomid = booking.roomid)))
  WHERE (((booking.bookingid IS NULL) AND (renting.rentingid IS NULL)) OR ((NOT ((booking.start_date <= CURRENT_DATE) AND (CURRENT_DATE <= booking.end_date))) AND (booking.bookingid IS NOT NULL)) OR ((NOT ((renting.start_date <= CURRENT_DATE) AND (CURRENT_DATE <= renting.end_date))) AND (renting.rentingid IS NOT NULL)))
  GROUP BY hotel_room.hotelid
  ORDER BY hotel_room.hotelid;


ALTER VIEW public.view_1_available_rooms_hotel OWNER TO postgres;

--
-- Name: view_2_aggregated_capacity_hotel; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_2_aggregated_capacity_hotel AS
 SELECT hotelid AS "hotelID",
    sum(
        CASE
            WHEN ((capacity)::text = 'Single'::text) THEN 1
            WHEN ((capacity)::text = 'Double'::text) THEN 2
            WHEN ((capacity)::text = 'Queen'::text) THEN 2
            WHEN ((capacity)::text = 'King'::text) THEN 2
            WHEN ((capacity)::text = 'Suite'::text) THEN 4
            ELSE 0
        END) AS total_capacity
   FROM public.hotel_room
  GROUP BY hotelid
  ORDER BY hotelid;


ALTER VIEW public.view_2_aggregated_capacity_hotel OWNER TO postgres;

--
-- Name: amenities amenitiesid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities ALTER COLUMN amenitiesid SET DEFAULT nextval('public."amenities_amenitiesID_seq"'::regclass);


--
-- Name: amenities roomid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities ALTER COLUMN roomid SET DEFAULT nextval('public."amenities_roomID_seq"'::regclass);


--
-- Name: archives archivesid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives ALTER COLUMN archivesid SET DEFAULT nextval('public."archives_archivesID_seq"'::regclass);


--
-- Name: archives rentingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives ALTER COLUMN rentingid SET DEFAULT nextval('public."archives_rentingID_seq"'::regclass);


--
-- Name: booking bookingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN bookingid SET DEFAULT nextval('public."booking_bookingID_seq"'::regclass);


--
-- Name: booking customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN customerid SET DEFAULT nextval('public."booking_customerID_seq"'::regclass);


--
-- Name: booking roomid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN roomid SET DEFAULT nextval('public."booking_roomID_seq"'::regclass);


--
-- Name: checks_in customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in ALTER COLUMN customerid SET DEFAULT nextval('public."checks_in_customerID_seq"'::regclass);


--
-- Name: checks_in rentingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in ALTER COLUMN rentingid SET DEFAULT nextval('public."checks_in_rentingID_seq"'::regclass);


--
-- Name: checks_in employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in ALTER COLUMN employeeid SET DEFAULT nextval('public."checks_in_employeeID_seq"'::regclass);


--
-- Name: customer customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customerid SET DEFAULT nextval('public."customer_customerID_seq"'::regclass);


--
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public."employee_employeeID_seq"'::regclass);


--
-- Name: employee hotelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN hotelid SET DEFAULT nextval('public."employee_hotelID_seq"'::regclass);


--
-- Name: hotel hotelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel ALTER COLUMN hotelid SET DEFAULT nextval('public."hotel_hotelID_seq"'::regclass);


--
-- Name: hotel chainid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel ALTER COLUMN chainid SET DEFAULT nextval('public."hotel_chainID_seq"'::regclass);


--
-- Name: hotel_chain chainid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_chain ALTER COLUMN chainid SET DEFAULT nextval('public."hotel_chain_chainID_seq"'::regclass);


--
-- Name: hotel_room hotelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_room ALTER COLUMN hotelid SET DEFAULT nextval('public."hotel_room_hotelID_seq"'::regclass);


--
-- Name: renting rentingid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renting ALTER COLUMN rentingid SET DEFAULT nextval('public."renting_rentingID_seq"'::regclass);


--
-- Name: renting customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renting ALTER COLUMN customerid SET DEFAULT nextval('public."renting_customerID_seq"'::regclass);


--
-- Name: renting roomid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renting ALTER COLUMN roomid SET DEFAULT nextval('public."renting_roomID_seq"'::regclass);


--
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenities (amenitiesid, roomid, name) FROM stdin;
\.


--
-- Data for Name: archives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archives (archivesid, rentingid, additionaldetails) FROM stdin;
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (bookingid, customerid, roomid, start_date, end_date) FROM stdin;
\.


--
-- Data for Name: checks_in; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checks_in (customerid, rentingid, employeeid) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customerid, typeid, fullname, address, password, registrationdate) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employeeid, hotelid, ssn_sin_type, fullname, address, roleposition, password) FROM stdin;
\.


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (hotelid, room_number, chainid, "hotelAddress", email, hotelstar, manager, phone) FROM stdin;
1	11	1	12 1st Avenue	hotel1_1@gmail.com	1	Becky Spence	613-123-1234
2	17	1	75 1st Avenue	hotel1_2@gmail.com	2	Tyrone Hurst	613-742-9090
3	15	1	123 5th Avenue	hotel1_3@gmail.com	3	Todd Hart	613-853-3957
4	6	1	24 43rd Avenue	hotel1_4@gmail.com	4	Lennox Linden	613-257-4076
5	11	1	56 23rd Avenue	hotel1_5@gmail.com	5	Steve Levitt	613-757-2753
6	11	1	47 3rd Avenue	hotel1_6@gmail.com	4	Cynthia Arrington	613-000-0001
7	8	1	924 4th Avenue	hotel1_7@gmail.com	5	Eliott Reeve	613-000-0002
8	8	1	78 6th Avenue	hotel1_8@gmail.com	2	Cybill Derby	613-000-0003
9	11	2	79 7th Avenue	hotel2_1@gmail.com	1	Bristol Firmin	613-000-0004
10	9	2	80 8th Avenue	hotel2_2@gmail.com	2	Kellie Davies	613-000-0005
11	14	2	81 9th Avenue	hotel2_3@gmail.com	3	Rayner Patrick	613-000-0006
12	9	2	82 10th Avenue	hotel2_4@gmail.com	4	Maggie Harrelson	613-000-0007
13	11	2	83 11th Avenue	hotel2_5@gmail.com	5	Eddy Womack	613-000-0008
14	8	2	84 12th Avenue	hotel2_6@gmail.com	4	Jayden Mitchell	613-000-0009
15	10	2	85 13th Avenue	hotel2_7@gmail.com	5	Carry Spurling	613-000-0010
16	8	2	86 14th Avenue	hotel2_8@gmail.com	3	Pete Stevens	613-000-0011
17	13	3	87 15th Avenue	hotel3_1@gmail.com	1	Glory Wilbur	613-000-0012
18	10	3	88 16th Avenue	hotel3_2@gmail.com	2	Barrie Russell	613-000-0013
19	12	3	89 17th Avenue	hotel3_3@gmail.com	3	Yvette Summers	613-000-0014
20	7	3	90 20th Avenue	hotel3_4@gmail.com	4	Candice Pearson	613-000-0015
21	8	3	91 21st Avenue	hotel3_5@gmail.com	5	Dolores Waller	613-000-0016
22	7	3	92 22nd Avenue	hotel3_6@gmail.com	5	Reene Moses	613-000-0017
23	11	3	93 23rd Avenue	hotel3_7@gmail.com	5	Allegra Sanford	613-000-0018
24	9	3	94 24th Avenue	hotel3_8@gmail.com	1	Addyson Brock	613-000-0019
25	11	4	95 25th Avenue	hotel4_1@gmail.com	1	Cliff Edwards	613-000-0020
26	8	4	96 26th Avenue	hotel4_2@gmail.com	2	Clarinda Burnett	613-000-0021
27	12	4	97 27th Avenue	hotel4_3@gmail.com	3	Elle Combs	613-000-0022
28	9	4	98 28th Avenue	hotel4_4@gmail.com	4	Ernestine Dickenson	613-000-0023
29	7	4	99 29th Avenue	hotel4_5@gmail.com	5	Tristin Bell	613-000-0024
30	9	4	100 30th Avenue	hotel4_6@gmail.com	1	Callahan Montgomery	613-000-0025
31	6	4	101 31st Avenue	hotel4_7@gmail.com	2	Cymone Johns	613-000-0026
32	12	4	102 32nd Avenue	hotel4_8@gmail.com	3	Faithe Bennet	613-000-0027
33	15	5	103 33rd Avenue	hotel5_1@gmail.com	1	Aaliyah Hathway	613-000-0028
34	12	5	104 34th Avenue	hotel5_2@gmail.com	2	Sally Howe	613-000-0029
35	7	5	105 35th Avenue	hotel5_3@gmail.com	3	Marni Winthrop	613-000-0030
36	11	5	106 36th Avenue	hotel5_4@gmail.com	4	William Longstaff	613-000-0031
37	9	5	107 37th Avenue	hotel5_5@gmail.com	5	Faye Lovel	613-000-0032
38	11	5	108 38th Avenue	hotel5_6@gmail.com	4	Nevil Christianson	613-000-0033
39	7	5	109 39th Avenue	hotel5_7@gmail.com	3	Davida Wheatley	613-000-0034
40	10	5	110 40th Avenue	hotel5_8@gmail.com	3	Thane Bisset	613-000-0035
\.


--
-- Data for Name: hotel_chain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel_chain (chainid, hotel_number, email, phone) FROM stdin;
1	8	hotel1@gmail.com	613-111-1111
2	8	hotel2@gmail.com	613-222-2222
3	8	hotel3@gmail.com	613-333-3333
4	8	hotel4@gmail.com	613-444-4444
5	8	hotel5@gmail.com	613-555-5555
\.


--
-- Data for Name: hotel_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel_room (roomid, hotelid, price, extension, damages, capacity, sea_mountainview) FROM stdin;
1	1	132	t	t	Double	Sea
2	1	291	f	f	Queen	Mountain
3	1	137	t	f	King	none
4	1	489	t	t	Suite	Mountain
5	1	321	f	t	Single	Mountain
6	2	324	f	f	Double	Mountain
7	2	165	t	t	Queen	Sea
8	2	346	f	f	King	Sea
9	2	392	t	f	Suite	none
10	2	312	f	t	Single	none
11	3	417	f	f	Double	Mountain
12	3	417	t	f	Queen	Sea
13	3	332	t	f	King	Mountain
14	3	425	t	t	Suite	Sea
15	3	279	t	t	Single	Sea
16	4	464	f	t	Double	Sea
17	4	285	t	f	Queen	none
18	4	215	t	t	King	Mountain
19	4	173	f	f	Suite	none
20	4	372	f	f	Single	Mountain
21	5	330	t	t	Double	Mountain
22	5	432	f	f	Queen	Mountain
23	5	279	t	f	King	Sea
24	5	226	f	t	Suite	none
25	5	316	f	t	Single	none
26	6	293	f	t	Double	none
27	6	315	f	f	Queen	Sea
28	6	494	t	t	King	none
29	6	221	f	f	Suite	Mountain
30	6	292	t	f	Single	Sea
31	7	320	f	f	Double	none
32	7	399	f	t	Queen	none
33	7	401	t	t	King	Sea
34	7	314	f	t	Suite	Mountain
35	7	394	t	t	Single	Mountain
36	8	126	f	f	Double	none
37	8	397	t	t	Queen	Sea
38	8	227	t	t	King	none
39	8	432	t	t	Suite	none
40	8	445	t	f	Single	Sea
41	9	481	f	t	Double	Mountain
42	9	390	f	f	Queen	Sea
43	9	140	t	f	King	Sea
44	9	122	t	f	Suite	Mountain
45	9	127	f	t	Single	Mountain
46	10	180	f	t	Double	none
47	10	483	t	f	Queen	Sea
48	10	291	t	f	King	none
49	10	142	t	t	Suite	none
50	10	494	t	f	Single	none
51	11	318	t	t	Double	Mountain
52	11	349	f	t	Queen	Mountain
53	11	210	f	f	King	none
54	11	192	t	t	Suite	none
55	11	159	t	f	Single	none
56	12	157	t	t	Double	Mountain
57	12	168	t	f	Queen	Mountain
58	12	431	t	f	King	none
59	12	458	t	f	Suite	Mountain
60	12	248	f	t	Single	none
61	13	381	f	t	Double	Mountain
62	13	169	f	t	Queen	none
63	13	168	t	f	King	none
64	13	181	t	f	Suite	Mountain
65	13	285	t	t	Single	Mountain
66	14	196	t	f	Double	Mountain
67	14	484	f	t	Queen	Sea
68	14	368	t	f	King	Mountain
69	14	111	f	t	Suite	Sea
70	14	423	f	t	Single	Sea
71	15	324	t	t	Double	Sea
72	15	224	f	f	Queen	Mountain
73	15	411	t	f	King	Mountain
74	15	431	t	f	Suite	Sea
75	15	451	f	t	Single	Sea
76	16	271	t	t	Double	Mountain
77	16	434	f	f	Queen	Mountain
78	16	134	t	t	King	none
79	16	309	f	f	Suite	Mountain
80	16	146	f	t	Single	Mountain
81	17	140	f	f	Double	Sea
82	17	295	f	t	Queen	Mountain
83	17	401	f	t	King	Mountain
84	17	272	t	f	Suite	none
85	17	109	f	t	Single	none
86	18	334	f	t	Double	none
87	18	160	f	t	Queen	Mountain
88	18	414	t	f	King	none
89	18	146	f	t	Suite	Sea
90	18	434	t	t	Single	none
91	19	366	f	t	Double	none
92	19	341	f	f	Queen	Sea
93	19	146	f	f	King	Mountain
94	19	491	t	t	Suite	none
95	19	273	f	t	Single	none
96	20	174	t	t	Double	none
97	20	416	t	t	Queen	Mountain
98	20	500	f	f	King	none
99	20	141	t	t	Suite	none
100	20	302	f	t	Single	Mountain
101	21	409	f	t	Double	none
102	21	337	f	t	Queen	none
103	21	252	t	f	King	none
104	21	452	f	t	Suite	Mountain
105	21	141	f	f	Single	none
106	22	226	f	t	Double	none
107	22	197	f	t	Queen	Mountain
108	22	371	t	f	King	Sea
109	22	261	f	f	Suite	Sea
110	22	308	f	t	Single	none
111	23	419	f	f	Double	Sea
112	23	391	t	f	Queen	Sea
113	23	246	t	t	King	Sea
114	23	347	f	f	Suite	none
115	23	499	t	f	Single	Mountain
116	24	213	f	t	Double	Mountain
117	24	428	t	t	Queen	Sea
118	24	145	t	t	King	Mountain
119	24	119	f	f	Suite	Sea
120	24	338	t	f	Single	Sea
121	25	181	t	f	Double	none
122	25	471	t	f	Queen	Sea
123	25	249	t	f	King	none
124	25	262	t	t	Suite	Mountain
125	25	210	f	t	Single	Sea
126	26	104	f	t	Double	Mountain
127	26	321	t	f	Queen	Sea
128	26	342	t	t	King	Mountain
129	26	290	t	t	Suite	Mountain
130	26	419	f	f	Single	Mountain
131	27	107	t	t	Double	Sea
132	27	330	f	f	Queen	none
133	27	189	f	f	King	none
134	27	457	t	f	Suite	none
135	27	119	f	f	Single	Sea
136	28	390	f	t	Double	Sea
137	28	436	t	t	Queen	Mountain
138	28	374	t	f	King	none
139	28	179	t	t	Suite	Sea
140	28	494	f	f	Single	none
141	29	121	f	t	Double	Sea
142	29	112	f	f	Queen	Mountain
143	29	148	t	t	King	none
144	29	210	f	f	Suite	Sea
145	29	472	t	f	Single	none
146	30	458	f	f	Double	Sea
147	30	229	t	f	Queen	Mountain
148	30	128	f	t	King	Mountain
149	30	496	f	f	Suite	Mountain
150	30	423	t	t	Single	Sea
151	31	499	t	f	Double	Sea
152	31	200	t	f	Queen	none
153	31	239	t	f	King	Mountain
154	31	161	t	t	Suite	Mountain
155	31	134	t	t	Single	none
156	32	444	f	t	Double	Sea
157	32	110	t	t	Queen	Mountain
158	32	157	t	t	King	Sea
159	32	159	t	t	Suite	Sea
160	32	265	t	f	Single	Sea
161	33	379	t	t	Double	Mountain
162	33	434	t	t	Queen	Mountain
163	33	286	t	t	King	none
164	33	409	t	t	Suite	none
165	33	143	f	f	Single	Sea
166	34	334	t	f	Double	Mountain
167	34	417	t	f	Queen	Mountain
168	34	473	f	f	King	none
169	34	208	t	t	Suite	Sea
170	34	228	f	f	Single	Mountain
171	35	356	f	t	Double	Mountain
172	35	453	f	f	Queen	Sea
173	35	294	f	f	King	none
174	35	313	f	t	Suite	none
175	35	221	f	t	Single	Sea
176	36	458	f	t	Double	Mountain
177	36	457	t	f	Queen	Sea
178	36	439	f	f	King	Mountain
179	36	355	f	f	Suite	Mountain
180	36	376	f	f	Single	Mountain
181	37	200	f	f	Double	none
182	37	243	f	f	Queen	none
183	37	308	t	t	King	Mountain
184	37	209	f	t	Suite	Sea
185	37	464	f	f	Single	Mountain
186	38	463	f	t	Double	Sea
187	38	237	f	f	Queen	Sea
188	38	352	t	f	King	Mountain
189	38	445	t	t	Suite	Sea
190	38	382	f	f	Single	none
191	39	241	t	f	Double	Sea
192	39	136	f	f	Queen	none
193	39	360	f	t	King	Mountain
194	39	421	t	t	Suite	Mountain
195	39	179	t	t	Single	Mountain
196	40	408	f	t	Double	Sea
197	40	428	f	t	Queen	none
198	40	311	f	f	King	Sea
199	40	361	t	t	Suite	none
200	40	479	t	f	Single	Sea
201	2	373	t	t	Double	Mountain
202	1	229	f	t	Queen	Mountain
203	25	322	f	t	King	Sea
204	2	460	t	t	Suite	Sea
205	32	319	t	t	Single	Mountain
206	30	469	f	f	Double	Mountain
207	11	484	t	f	Queen	none
208	31	482	t	t	King	Sea
209	19	145	f	f	Suite	Sea
210	36	404	t	f	Single	none
211	22	191	f	t	Double	Sea
212	13	384	t	f	Queen	none
213	33	393	t	t	King	Mountain
214	33	346	f	t	Suite	none
215	20	423	t	f	Single	Mountain
216	19	488	f	f	Double	Sea
217	3	464	f	t	Queen	Sea
218	34	485	t	f	King	none
219	12	425	f	t	Suite	Sea
220	3	117	f	f	Single	none
221	17	453	f	f	Double	Sea
222	9	242	f	t	Queen	none
223	21	479	f	f	King	none
224	15	171	t	f	Suite	none
225	6	433	t	f	Single	none
226	8	448	t	t	Double	Sea
227	6	447	f	f	Queen	none
228	12	182	f	t	King	Mountain
229	24	328	f	t	Suite	Mountain
230	5	403	f	t	Single	Mountain
231	11	397	f	t	Double	Mountain
232	27	468	t	t	Queen	Mountain
233	11	473	t	f	King	none
234	16	433	f	t	Suite	Mountain
235	13	231	t	t	Single	Sea
236	16	380	f	f	Double	Mountain
237	11	424	f	t	Queen	Mountain
238	23	149	f	t	King	Sea
239	27	195	f	t	Suite	none
240	8	243	f	f	Single	Sea
241	2	379	f	t	Double	Mountain
242	32	105	f	f	Queen	Mountain
243	27	396	f	f	King	Sea
244	5	225	f	t	Suite	none
245	17	166	f	t	Single	Sea
246	32	497	t	t	Double	none
247	8	405	t	f	Queen	Sea
248	19	416	f	f	King	Mountain
249	23	276	t	t	Suite	none
250	28	392	f	t	Single	none
251	2	397	t	f	Double	Sea
252	11	363	t	f	Queen	Mountain
253	32	394	t	t	King	none
254	13	167	t	f	Suite	none
255	1	145	f	f	Single	none
256	11	373	t	t	Double	none
257	9	418	f	f	Queen	none
258	7	375	t	f	King	Mountain
259	1	406	t	f	Suite	none
260	10	320	t	t	Single	Sea
261	40	151	t	t	Double	Sea
262	26	410	t	f	Queen	none
263	36	179	f	f	King	Mountain
264	14	477	t	f	Suite	none
265	27	125	t	t	Single	Mountain
266	36	379	t	f	Double	none
267	28	220	t	f	Queen	Mountain
268	9	121	t	t	King	none
269	34	294	t	t	Suite	none
270	24	359	f	f	Single	Mountain
271	30	207	f	t	Double	Mountain
272	15	406	f	f	Queen	Sea
273	17	283	t	t	King	Mountain
274	12	202	t	f	Suite	Sea
275	25	276	f	f	Single	Sea
276	14	266	t	t	Double	Sea
277	7	444	t	t	Queen	Sea
278	33	238	f	t	King	none
279	18	424	f	f	Suite	none
280	22	370	f	t	Single	none
281	36	266	t	t	Double	Sea
282	9	294	f	f	Queen	Mountain
283	34	365	f	f	King	Sea
284	5	178	f	t	Suite	none
285	27	344	t	t	Single	none
286	11	314	t	t	Double	none
287	2	251	f	t	Queen	none
288	40	500	f	f	King	Mountain
289	33	270	t	f	Suite	none
290	33	171	t	t	Single	none
291	25	491	f	t	Double	none
292	16	371	t	t	Queen	Mountain
293	36	131	t	t	King	Sea
294	15	425	f	t	Suite	Sea
295	33	103	f	f	Single	none
296	3	161	f	t	Double	Mountain
297	18	245	t	f	Queen	Sea
298	6	270	f	t	King	none
299	7	129	t	t	Suite	none
300	1	210	t	t	Single	Sea
301	5	295	t	t	Double	Mountain
302	38	296	f	f	Queen	Mountain
303	18	406	t	t	King	none
304	6	367	f	t	Suite	none
305	34	233	t	f	Single	none
306	36	308	f	t	Double	none
307	3	179	t	t	Queen	none
308	28	296	f	f	King	none
309	25	273	f	f	Suite	Sea
310	40	336	f	f	Single	none
311	34	334	t	t	Double	Sea
312	19	299	f	t	Queen	none
313	19	285	t	t	King	Mountain
314	29	251	f	t	Suite	Sea
315	2	344	t	f	Single	Sea
316	30	312	t	t	Double	Mountain
317	27	205	t	f	Queen	none
318	19	203	f	t	King	Sea
319	9	434	f	f	Suite	Sea
320	39	362	f	f	Single	Mountain
321	2	196	t	t	Double	Mountain
322	32	205	t	f	Queen	Sea
323	17	408	t	t	King	Sea
324	27	164	t	f	Suite	none
325	11	397	t	f	Single	Mountain
326	14	390	t	f	Double	Sea
327	30	221	t	t	Queen	Sea
328	11	390	f	t	King	Sea
329	2	396	f	t	Suite	Sea
330	38	217	t	f	Single	none
331	23	305	f	f	Double	Sea
332	13	239	f	t	Queen	Mountain
333	25	478	f	t	King	Sea
334	33	194	f	f	Suite	none
335	3	230	f	t	Single	Mountain
336	3	378	f	f	Double	none
337	1	355	f	t	Queen	Sea
338	13	480	t	t	King	Sea
339	35	381	f	t	Suite	Mountain
340	2	455	t	f	Single	Mountain
341	25	313	t	t	Double	Sea
342	17	481	t	f	Queen	Sea
343	23	290	f	f	King	Sea
344	39	266	f	f	Suite	Mountain
345	5	296	t	t	Single	Mountain
346	3	232	f	t	Double	Sea
347	38	146	f	t	Queen	none
348	24	264	f	t	King	Mountain
349	33	339	f	f	Suite	Mountain
350	5	496	f	t	Single	Mountain
351	15	314	f	f	Double	Mountain
352	6	474	t	f	Queen	Sea
353	2	282	t	t	King	none
354	40	226	f	t	Suite	Sea
355	4	244	f	t	Single	Sea
356	17	355	t	f	Double	none
357	2	265	t	f	Queen	Mountain
358	32	483	f	t	King	none
359	10	296	f	t	Suite	Sea
360	21	285	t	f	Single	Mountain
361	18	296	f	f	Double	none
362	2	194	f	t	Queen	Sea
363	35	275	t	f	King	Mountain
364	10	372	f	t	Suite	Sea
365	26	261	t	t	Single	none
366	26	112	f	f	Double	Mountain
367	20	446	f	f	Queen	Sea
368	12	304	f	f	King	none
369	3	177	t	t	Suite	none
370	3	126	t	t	Single	none
371	37	256	f	t	Double	Sea
372	21	351	t	t	Queen	Mountain
373	37	107	f	f	King	Mountain
374	9	116	f	t	Suite	Mountain
375	29	203	t	f	Single	Mountain
376	38	490	f	f	Double	Mountain
377	33	409	f	t	Queen	none
378	17	284	t	t	King	Sea
379	40	342	t	f	Suite	none
380	23	287	t	f	Single	none
381	15	326	t	f	Double	Sea
382	37	116	t	f	Queen	Mountain
383	17	475	t	t	King	Mountain
384	3	430	t	f	Suite	none
385	19	214	f	f	Single	Sea
386	10	492	t	t	Double	Mountain
387	34	322	t	t	Queen	Mountain
388	38	136	f	f	King	none
389	18	227	f	f	Suite	Mountain
390	33	328	f	t	Single	Sea
391	28	390	f	t	Double	Sea
392	24	361	t	t	Queen	Sea
393	37	161	t	f	King	Sea
394	23	101	f	f	Suite	Sea
395	1	374	f	t	Single	Sea
396	32	325	f	f	Double	none
397	38	313	f	f	Queen	Mountain
398	34	224	t	t	King	none
399	6	285	f	f	Suite	none
400	13	126	f	t	Single	Mountain
\.


--
-- Data for Name: renting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.renting (rentingid, customerid, roomid, payment, start_date, end_date) FROM stdin;
\.


--
-- Name: amenities_amenitiesID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."amenities_amenitiesID_seq"', 1, false);


--
-- Name: amenities_roomID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."amenities_roomID_seq"', 1, false);


--
-- Name: archives_archivesID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."archives_archivesID_seq"', 1, false);


--
-- Name: archives_rentingID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."archives_rentingID_seq"', 1, false);


--
-- Name: booking_bookingID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."booking_bookingID_seq"', 1, false);


--
-- Name: booking_customerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."booking_customerID_seq"', 1, false);


--
-- Name: booking_roomID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."booking_roomID_seq"', 1, false);


--
-- Name: checks_in_customerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."checks_in_customerID_seq"', 1, false);


--
-- Name: checks_in_employeeID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."checks_in_employeeID_seq"', 1, false);


--
-- Name: checks_in_rentingID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."checks_in_rentingID_seq"', 1, false);


--
-- Name: customer_customerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."customer_customerID_seq"', 1, false);


--
-- Name: employee_employeeID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."employee_employeeID_seq"', 1, false);


--
-- Name: employee_hotelID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."employee_hotelID_seq"', 1, false);


--
-- Name: hotel_chainID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hotel_chainID_seq"', 1, false);


--
-- Name: hotel_chain_chainID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hotel_chain_chainID_seq"', 5, true);


--
-- Name: hotel_hotelID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hotel_hotelID_seq"', 1, false);


--
-- Name: hotel_room_hotelID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hotel_room_hotelID_seq"', 1, false);


--
-- Name: renting_customerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."renting_customerID_seq"', 1, false);


--
-- Name: renting_rentingID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."renting_rentingID_seq"', 1, false);


--
-- Name: renting_roomID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."renting_roomID_seq"', 1, false);


--
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (amenitiesid);


--
-- Name: archives archives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives
    ADD CONSTRAINT archives_pkey PRIMARY KEY (archivesid);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (bookingid);


--
-- Name: checks_in checks_in_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in
    ADD CONSTRAINT checks_in_pkey PRIMARY KEY (customerid, rentingid, employeeid);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customerid);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);


--
-- Name: hotel_chain hotel_chain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_chain
    ADD CONSTRAINT hotel_chain_pkey PRIMARY KEY (chainid);


--
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (hotelid);


--
-- Name: hotel_room hotel_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_room
    ADD CONSTRAINT hotel_room_pkey PRIMARY KEY (roomid);


--
-- Name: renting renting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (rentingid);


--
-- Name: Check_In_Date_Index_Booking; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Check_In_Date_Index_Booking" ON public.booking USING btree (start_date) INCLUDE (start_date) WITH (deduplicate_items='true');


--
-- Name: Check_In_Date_Index_Renting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Check_In_Date_Index_Renting" ON public.renting USING btree (start_date) INCLUDE (start_date) WITH (deduplicate_items='true');


--
-- Name: Check_Out_Date_Index_Booking; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Check_Out_Date_Index_Booking" ON public.booking USING btree (end_date) INCLUDE (end_date) WITH (deduplicate_items='true');


--
-- Name: Check_Out_Date_Index_Renting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Check_Out_Date_Index_Renting" ON public.renting USING btree (end_date) INCLUDE (end_date) WITH (deduplicate_items='true');


--
-- Name: CustomerID_Index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerID_Index" ON public.customer USING btree (customerid) INCLUDE (customerid) WITH (deduplicate_items='true');


--
-- Name: booking check_date_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER check_date_trigger BEFORE INSERT OR UPDATE ON public.booking FOR EACH ROW EXECUTE FUNCTION public.check_date();


--
-- Name: renting check_date_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER check_date_trigger BEFORE INSERT OR UPDATE ON public.renting FOR EACH ROW EXECUTE FUNCTION public.check_date();


--
-- Name: hotel validate_phone_number_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_phone_number_trigger BEFORE INSERT OR UPDATE ON public.hotel FOR EACH ROW EXECUTE FUNCTION public.validate_phone_number();


--
-- Name: hotel_chain validate_phone_number_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_phone_number_trigger BEFORE INSERT OR UPDATE ON public.hotel_chain FOR EACH ROW EXECUTE FUNCTION public.validate_phone_number();


--
-- Name: hotel chainID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT "chainID" FOREIGN KEY (chainid) REFERENCES public.hotel_chain(chainid) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: booking customerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "customerID" FOREIGN KEY (customerid) REFERENCES public.customer(customerid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: renting customerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renting
    ADD CONSTRAINT "customerID" FOREIGN KEY (customerid) REFERENCES public.customer(customerid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: checks_in customerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in
    ADD CONSTRAINT "customerID" FOREIGN KEY (customerid) REFERENCES public.customer(customerid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: checks_in employeeID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in
    ADD CONSTRAINT "employeeID" FOREIGN KEY (employeeid) REFERENCES public.employee(employeeid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employee hotelID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "hotelID" FOREIGN KEY (hotelid) REFERENCES public.hotel(hotelid) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: hotel_room hotelID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_room
    ADD CONSTRAINT "hotelID" FOREIGN KEY (hotelid) REFERENCES public.hotel(hotelid) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: checks_in rentingID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checks_in
    ADD CONSTRAINT "rentingID" FOREIGN KEY (rentingid) REFERENCES public.renting(rentingid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: archives rentingID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives
    ADD CONSTRAINT "rentingID" FOREIGN KEY (rentingid) REFERENCES public.renting(rentingid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: booking roomID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "roomID" FOREIGN KEY (roomid) REFERENCES public.hotel_room(roomid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: amenities roomID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT "roomID" FOREIGN KEY (roomid) REFERENCES public.hotel_room(roomid) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: renting roomID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.renting
    ADD CONSTRAINT "roomID" FOREIGN KEY (roomid) REFERENCES public.hotel_room(roomid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

