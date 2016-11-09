--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-10-31 21:28:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 184 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 76342)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE avaliacao (
    id bigint NOT NULL,
    id_usuario bigint,
    id_cliente bigint,
    id_colaborador bigint,
    numero_chamado character varying(10),
    data_avaliacao timestamp without time zone,
    data_atendimento timestamp without time zone,
    data_finalizado timestamp without time zone,
    nivel smallint,
    historico text,
    analise_gestor text
);


ALTER TABLE avaliacao OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 76340)
-- Name: avaliacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE avaliacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE avaliacao_id_seq OWNER TO postgres;

--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 180
-- Name: avaliacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE avaliacao_id_seq OWNED BY avaliacao.id;


--
-- TOC entry 173 (class 1259 OID 76263)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    id bigint NOT NULL,
    cnpj_cpf character varying(18),
    razao_social character varying(250)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 76261)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 172
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 179 (class 1259 OID 76322)
-- Name: colaborador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE colaborador (
    id bigint NOT NULL,
    id_setor bigint,
    nome character varying(250),
    id_modulo bigint
);


ALTER TABLE colaborador OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 76320)
-- Name: colaborador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE colaborador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colaborador_id_seq OWNER TO postgres;

--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 178
-- Name: colaborador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE colaborador_id_seq OWNED BY colaborador.id;


--
-- TOC entry 183 (class 1259 OID 76374)
-- Name: modulo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE modulo (
    id bigint NOT NULL,
    descricao character varying(100)
);


ALTER TABLE modulo OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 76372)
-- Name: modulo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modulo_id_seq OWNER TO postgres;

--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 182
-- Name: modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modulo_id_seq OWNED BY modulo.id;


--
-- TOC entry 175 (class 1259 OID 76287)
-- Name: setor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE setor (
    id bigint NOT NULL,
    descricao character varying(100)
);


ALTER TABLE setor OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 76285)
-- Name: setor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE setor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE setor_id_seq OWNER TO postgres;

--
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 174
-- Name: setor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE setor_id_seq OWNED BY setor.id;


--
-- TOC entry 177 (class 1259 OID 76303)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    id_cliente bigint,
    nome character varying(50),
    usuario character varying(30),
    senha character varying(70),
    perfil character varying(30)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 76301)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 1916 (class 2604 OID 76345)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao ALTER COLUMN id SET DEFAULT nextval('avaliacao_id_seq'::regclass);


--
-- TOC entry 1912 (class 2604 OID 76266)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 1915 (class 2604 OID 76325)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY colaborador ALTER COLUMN id SET DEFAULT nextval('colaborador_id_seq'::regclass);


--
-- TOC entry 1917 (class 2604 OID 76377)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modulo ALTER COLUMN id SET DEFAULT nextval('modulo_id_seq'::regclass);


--
-- TOC entry 1913 (class 2604 OID 76290)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY setor ALTER COLUMN id SET DEFAULT nextval('setor_id_seq'::regclass);


--
-- TOC entry 1914 (class 2604 OID 76306)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2055 (class 0 OID 76342)
-- Dependencies: 181
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY avaliacao (id, id_usuario, id_cliente, id_colaborador, numero_chamado, data_avaliacao, data_atendimento, data_finalizado, nivel, historico, analise_gestor) FROM stdin;
\.


--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 180
-- Name: avaliacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('avaliacao_id_seq', 1, false);


--
-- TOC entry 2047 (class 0 OID 76263)
-- Dependencies: 173
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (id, cnpj_cpf, razao_social) FROM stdin;
1	00.000.000/0000-00	HOSCAR - HOPITAL CARABINEIROS DO CHILE
2	00.000.000/0000-01	HOSPITAL SÃO LUCAS - REDE IMPAR
3	00.000.000/0000-02	HOSPITAL SANTA ISABEL
\.


--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 172
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 3, true);


--
-- TOC entry 2053 (class 0 OID 76322)
-- Dependencies: 179
-- Data for Name: colaborador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY colaborador (id, id_setor, nome, id_modulo) FROM stdin;
1	1	ARTHUR PAIXÃO	1
2	1	PAULO AGUIAR	1
\.


--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 178
-- Name: colaborador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('colaborador_id_seq', 2, true);


--
-- TOC entry 2057 (class 0 OID 76374)
-- Dependencies: 183
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY modulo (id, descricao) FROM stdin;
1	IMV
2	MGES
3	MGCO
4	PAGU
5	PEP
6	NFE
7	NFSE
8	MOBILE
9	FATUR-SUS
10	FATUR-CONV
11	INFRA
\.


--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 182
-- Name: modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('modulo_id_seq', 11, true);


--
-- TOC entry 2049 (class 0 OID 76287)
-- Dependencies: 175
-- Data for Name: setor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY setor (id, descricao) FROM stdin;
1	DESENVOLVIMENTO
2	SUPORTE AO CLIENTE
3	SUPORTE A INFRAESTRUTURA
4	SUPORTE APOIO
\.


--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 174
-- Name: setor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('setor_id_seq', 4, true);


--
-- TOC entry 2051 (class 0 OID 76303)
-- Dependencies: 177
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, id_cliente, nome, usuario, senha, perfil) FROM stdin;
1	1	ITALO GUSTAVO BORBA TEIXEIRA	italo.teixeira	$2a$08$jcLjRXbjJ0ThXRO90Hk2DuaCMHAvOyGu5c7nXwCTQWHCI.homYuX6	GESTOR
2	1	AVALIADOR TESTE	avaliador.teste	$2a$08$jcLjRXbjJ0ThXRO90Hk2DuaCMHAvOyGu5c7nXwCTQWHCI.homYuX6	AVALIADOR
\.


--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 2, true);


--
-- TOC entry 1928 (class 2606 OID 76350)
-- Name: avaliacao_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT avaliacao_id_pkey PRIMARY KEY (id);


--
-- TOC entry 1919 (class 2606 OID 76268)
-- Name: cliente_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_id_pkey PRIMARY KEY (id);


--
-- TOC entry 1925 (class 2606 OID 76327)
-- Name: colaborador_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY colaborador
    ADD CONSTRAINT colaborador_id_pkey PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 76379)
-- Name: modulo_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_id_pkey PRIMARY KEY (id);


--
-- TOC entry 1921 (class 2606 OID 76292)
-- Name: setor_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY setor
    ADD CONSTRAINT setor_id_pkey PRIMARY KEY (id);


--
-- TOC entry 1923 (class 2606 OID 76308)
-- Name: usuario_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_id_pkey PRIMARY KEY (id);


--
-- TOC entry 1926 (class 1259 OID 76356)
-- Name: fki_colaborador_id_setor_fkey; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_colaborador_id_setor_fkey ON colaborador USING btree (id_setor);


--
-- TOC entry 1935 (class 2606 OID 76367)
-- Name: avaliacao_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT avaliacao_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1936 (class 2606 OID 76385)
-- Name: avaliacao_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT avaliacao_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES colaborador(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1934 (class 2606 OID 76362)
-- Name: avaliacao_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT avaliacao_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1933 (class 2606 OID 76390)
-- Name: colaborador_id_modulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY colaborador
    ADD CONSTRAINT colaborador_id_modulo_fkey FOREIGN KEY (id_modulo) REFERENCES modulo(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1932 (class 2606 OID 76351)
-- Name: colaborador_id_setor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY colaborador
    ADD CONSTRAINT colaborador_id_setor_fkey FOREIGN KEY (id_setor) REFERENCES setor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1931 (class 2606 OID 76357)
-- Name: usuario_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-10-31 21:28:06

--
-- PostgreSQL database dump complete
--

