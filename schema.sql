--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Debian 14.11-1.pgdg100+1)
-- Dumped by pg_dump version 14.9 (Debian 14.9-1.pgdg100+1)

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

ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkk;
ALTER TABLE ONLY public.persons DROP CONSTRAINT persons_pk;
ALTER TABLE public.transactions ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.transactions1_id_seq;
DROP TABLE public.transactions;
DROP TABLE public.persons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: persons; Type: TABLE; Schema: public; Owner: fkr
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    name text NOT NULL,
    balance integer NOT NULL
);


ALTER TABLE public.persons OWNER TO fkr;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: fkr
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    person_id integer NOT NULL,
    dt timestamp with time zone NOT NULL,
    delta integer NOT NULL
);


ALTER TABLE public.transactions OWNER TO fkr;

--
-- Name: transactions1_id_seq; Type: SEQUENCE; Schema: public; Owner: fkr
--

CREATE SEQUENCE public.transactions1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions1_id_seq OWNER TO fkr;

--
-- Name: transactions1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fkr
--

ALTER SEQUENCE public.transactions1_id_seq OWNED BY public.transactions.id;


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: fkr
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions1_id_seq'::regclass);


--
-- Name: persons persons_pk; Type: CONSTRAINT; Schema: public; Owner: fkr
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pk PRIMARY KEY (id);


--
-- Name: transactions transactions_pkk; Type: CONSTRAINT; Schema: public; Owner: fkr
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

