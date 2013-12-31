--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.1
-- Started on 2013-12-19 18:15:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 216 (class 1259 OID 16953)
-- Name: assemblies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE assemblies (
    id integer NOT NULL,
    master_item character varying(50),
    build_date date,
    item_description character varying(100),
    warranty_description character varying(255),
    wo_description character varying(255),
    proposal_description character varying(255),
    is_po boolean,
    is_wo boolean,
    unit_of_measurement character varying(255),
    total_material numeric(5,2),
    tax_rate_percentage numeric(5,2),
    total_tax numeric(5,2),
    total_labor numeric(5,2),
    total_cost numeric(5,2),
    markup_operator_percentage numeric(5,2),
    markup_total_amt numeric(5,2),
    total_price numeric(5,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.assemblies OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16951)
-- Name: assemblies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE assemblies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assemblies_id_seq OWNER TO postgres;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 215
-- Name: assemblies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE assemblies_id_seq OWNED BY assemblies.id;


--
-- TOC entry 218 (class 1259 OID 16964)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE company (
    id integer NOT NULL,
    name character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16962)
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO postgres;

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 217
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE company_id_seq OWNED BY company.id;


--
-- TOC entry 202 (class 1259 OID 16830)
-- Name: contact_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contact_types (
    id integer NOT NULL,
    contact_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.contact_types OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16828)
-- Name: contact_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_types_id_seq OWNER TO postgres;

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 201
-- Name: contact_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_types_id_seq OWNED BY contact_types.id;


--
-- TOC entry 172 (class 1259 OID 16681)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    type integer,
    lead_source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    street1 character varying(100),
    street2 character varying(100),
    city character varying(45),
    state character varying(30),
    zip character varying(10),
    home_phone character varying(15),
    mobile_phone character varying(15),
    work_phone character varying(15),
    work_phone_ext character varying(10),
    fax character varying(15),
    website character varying(100),
    misc character varying(500),
    company_id integer,
    sales_person_id integer,
    company_name character varying(100),
    title character varying(45),
    latitude numeric(10,8),
    longitude numeric(11,8),
    is_active smallint DEFAULT 1
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16679)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 171
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customer_id_seq OWNED BY customer.id;


--
-- TOC entry 174 (class 1259 OID 16697)
-- Name: customer_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_type (
    id integer NOT NULL,
    type character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.customer_type OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16695)
-- Name: customer_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_type_id_seq OWNER TO postgres;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 173
-- Name: customer_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customer_type_id_seq OWNED BY customer_type.id;


--
-- TOC entry 176 (class 1259 OID 16706)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    address character varying(100),
    city character varying(50),
    state character varying(25),
    zip character varying(10),
    phone character varying(15),
    is_active boolean,
    is_admin boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16704)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 175
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- TOC entry 178 (class 1259 OID 16714)
-- Name: estimate_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estimate_types (
    id integer NOT NULL,
    estimate_type character varying(50),
    default_overhead character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.estimate_types OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16712)
-- Name: estimate_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estimate_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estimate_types_id_seq OWNER TO postgres;

--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 177
-- Name: estimate_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estimate_types_id_seq OWNED BY estimate_types.id;


--
-- TOC entry 180 (class 1259 OID 16722)
-- Name: item_codes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item_codes (
    id integer NOT NULL,
    item_code character varying(20),
    item_name character varying(100),
    uom character varying(100),
    item_cost numeric(5,2),
    material_cost numeric(5,2),
    material_w_tax numeric(5,2),
    labor_rate numeric(5,2),
    retail_price numeric(5,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.item_codes OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16720)
-- Name: item_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE item_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_codes_id_seq OWNER TO postgres;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 179
-- Name: item_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE item_codes_id_seq OWNED BY item_codes.id;


--
-- TOC entry 204 (class 1259 OID 16838)
-- Name: job_call_notes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_call_notes (
    id integer NOT NULL,
    job_site_id integer,
    call_notes character varying(255),
    employee_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    call_time character varying(10),
    call_date date
);


ALTER TABLE public.job_call_notes OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16836)
-- Name: job_call_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_call_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_call_notes_id_seq OWNER TO postgres;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 203
-- Name: job_call_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_call_notes_id_seq OWNED BY job_call_notes.id;


--
-- TOC entry 208 (class 1259 OID 16854)
-- Name: job_change_orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_change_orders (
    id integer NOT NULL,
    job_site_id integer,
    co_number character varying(255),
    co_total character varying(255),
    notes character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_change_orders OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16852)
-- Name: job_change_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_change_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_change_orders_id_seq OWNER TO postgres;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 207
-- Name: job_change_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_change_orders_id_seq OWNED BY job_change_orders.id;


--
-- TOC entry 210 (class 1259 OID 16865)
-- Name: job_contacts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_contacts (
    id integer NOT NULL,
    job_site_id integer,
    first_name character varying(255),
    last_name character varying(255),
    contact_type_id integer,
    contact_phone character varying(255),
    contact_email character varying(255),
    contact_notes character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_contacts OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16863)
-- Name: job_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_contacts_id_seq OWNER TO postgres;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 209
-- Name: job_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_contacts_id_seq OWNED BY job_contacts.id;


--
-- TOC entry 214 (class 1259 OID 16887)
-- Name: job_costings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_costings (
    id integer NOT NULL,
    job_site_id integer,
    materials character varying(255),
    labor character varying(255),
    job_cost numeric,
    overhead numeric,
    overhead_percentage integer,
    net_profit numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_costings OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16885)
-- Name: job_costings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_costings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_costings_id_seq OWNER TO postgres;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 213
-- Name: job_costings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_costings_id_seq OWNED BY job_costings.id;


--
-- TOC entry 212 (class 1259 OID 16876)
-- Name: job_documents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_documents (
    id integer NOT NULL,
    job_site_id integer,
    doc_name character varying(255),
    doc_desc character varying(255),
    doc_link character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_documents OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16874)
-- Name: job_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_documents_id_seq OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 211
-- Name: job_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_documents_id_seq OWNED BY job_documents.id;


--
-- TOC entry 182 (class 1259 OID 16730)
-- Name: job_estimates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_estimates (
    id integer NOT NULL,
    job_site_id integer NOT NULL,
    step integer,
    master_item_id integer,
    qty integer,
    proposal_desc character varying(100),
    warranty_desc character varying(100),
    retail_price numeric(5,2),
    item_extended character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_estimates OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16728)
-- Name: job_estimates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_estimates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_estimates_id_seq OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 181
-- Name: job_estimates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_estimates_id_seq OWNED BY job_estimates.id;


--
-- TOC entry 184 (class 1259 OID 16740)
-- Name: job_service_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_service_types (
    id integer NOT NULL,
    job_id integer NOT NULL,
    service_type_id integer NOT NULL
);


ALTER TABLE public.job_service_types OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16738)
-- Name: job_service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_service_types_id_seq OWNER TO postgres;

--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 183
-- Name: job_service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_service_types_id_seq OWNED BY job_service_types.id;


--
-- TOC entry 186 (class 1259 OID 16750)
-- Name: job_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_site (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    company_name character varying(100),
    contact_name character varying(100) NOT NULL,
    phone character varying(15),
    work_phone character varying(15),
    work_phone_ext character varying(10),
    mobile_phone character varying(15),
    fax character varying(15),
    website character varying(100),
    street1 character varying(100),
    street2 character varying(100),
    city character varying(15),
    state character varying(15),
    zip character varying(10),
    is_active smallint DEFAULT 1,
    latitude numeric(10,8),
    longitude numeric(11,8),
    job_start_date date,
    job_status_id integer,
    how_many_stories character varying(255),
    existing_roof_type_id integer,
    new_roof_type_id integer,
    product_type_id integer,
    product_color_id integer,
    sales_rep_id integer,
    estimate_type_id integer,
    contract_price character varying(255),
    deposit_due character varying(255),
    deposit_method character varying(255),
    date_completed date,
    job_notes character varying(255),
    lead_sheet_note character varying(255),
    info_taken_by_id integer,
    assign_to_id integer,
    date_taken date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_site OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16748)
-- Name: job_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_site_id_seq OWNER TO postgres;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 185
-- Name: job_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_site_id_seq OWNED BY job_site.id;


--
-- TOC entry 188 (class 1259 OID 16772)
-- Name: job_statuses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_statuses (
    id integer NOT NULL,
    job_status character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_statuses OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16770)
-- Name: job_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 187
-- Name: job_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_statuses_id_seq OWNED BY job_statuses.id;


--
-- TOC entry 206 (class 1259 OID 16846)
-- Name: job_tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_tasks (
    id integer NOT NULL,
    job_site_id integer,
    task_type_id integer,
    task_note character varying(255),
    target_date date,
    entered_by_id integer,
    date_completed date,
    completed_by_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_tasks OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16844)
-- Name: job_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_tasks_id_seq OWNER TO postgres;

--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 205
-- Name: job_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_tasks_id_seq OWNED BY job_tasks.id;


--
-- TOC entry 190 (class 1259 OID 16780)
-- Name: lead_source; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lead_source (
    id integer NOT NULL,
    source character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.lead_source OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16778)
-- Name: lead_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lead_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lead_source_id_seq OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 189
-- Name: lead_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lead_source_id_seq OWNED BY lead_source.id;


--
-- TOC entry 192 (class 1259 OID 16789)
-- Name: product_colors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_colors (
    id integer NOT NULL,
    product_color character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.product_colors OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16787)
-- Name: product_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_colors_id_seq OWNER TO postgres;

--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 191
-- Name: product_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_colors_id_seq OWNED BY product_colors.id;


--
-- TOC entry 194 (class 1259 OID 16797)
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product_types (
    id integer NOT NULL,
    product_type character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16795)
-- Name: product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_types_id_seq OWNER TO postgres;

--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 193
-- Name: product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_types_id_seq OWNED BY product_types.id;


--
-- TOC entry 196 (class 1259 OID 16805)
-- Name: roof_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roof_types (
    id integer NOT NULL,
    roof_type character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.roof_types OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16803)
-- Name: roof_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roof_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roof_types_id_seq OWNER TO postgres;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 195
-- Name: roof_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roof_types_id_seq OWNED BY roof_types.id;


--
-- TOC entry 170 (class 1259 OID 16401)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16813)
-- Name: service_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service_types (
    id integer NOT NULL,
    service_type character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.service_types OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16811)
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE service_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_types_id_seq OWNER TO postgres;

--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 197
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE service_types_id_seq OWNED BY service_types.id;


--
-- TOC entry 200 (class 1259 OID 16822)
-- Name: task_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_types (
    id integer NOT NULL,
    task_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.task_types OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16820)
-- Name: task_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE task_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_types_id_seq OWNER TO postgres;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 199
-- Name: task_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE task_types_id_seq OWNED BY task_types.id;


--
-- TOC entry 1997 (class 2604 OID 16956)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assemblies ALTER COLUMN id SET DEFAULT nextval('assemblies_id_seq'::regclass);


--
-- TOC entry 1998 (class 2604 OID 16967)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY company ALTER COLUMN id SET DEFAULT nextval('company_id_seq'::regclass);


--
-- TOC entry 1990 (class 2604 OID 16833)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact_types ALTER COLUMN id SET DEFAULT nextval('contact_types_id_seq'::regclass);


--
-- TOC entry 1973 (class 2604 OID 16684)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer ALTER COLUMN id SET DEFAULT nextval('customer_id_seq'::regclass);


--
-- TOC entry 1975 (class 2604 OID 16700)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer_type ALTER COLUMN id SET DEFAULT nextval('customer_type_id_seq'::regclass);


--
-- TOC entry 1976 (class 2604 OID 16709)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- TOC entry 1977 (class 2604 OID 16717)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estimate_types ALTER COLUMN id SET DEFAULT nextval('estimate_types_id_seq'::regclass);


--
-- TOC entry 1978 (class 2604 OID 16725)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_codes ALTER COLUMN id SET DEFAULT nextval('item_codes_id_seq'::regclass);


--
-- TOC entry 1991 (class 2604 OID 16841)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_call_notes ALTER COLUMN id SET DEFAULT nextval('job_call_notes_id_seq'::regclass);


--
-- TOC entry 1993 (class 2604 OID 16857)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_change_orders ALTER COLUMN id SET DEFAULT nextval('job_change_orders_id_seq'::regclass);


--
-- TOC entry 1994 (class 2604 OID 16868)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_contacts ALTER COLUMN id SET DEFAULT nextval('job_contacts_id_seq'::regclass);


--
-- TOC entry 1996 (class 2604 OID 16890)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_costings ALTER COLUMN id SET DEFAULT nextval('job_costings_id_seq'::regclass);


--
-- TOC entry 1995 (class 2604 OID 16879)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_documents ALTER COLUMN id SET DEFAULT nextval('job_documents_id_seq'::regclass);


--
-- TOC entry 1979 (class 2604 OID 16733)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_estimates ALTER COLUMN id SET DEFAULT nextval('job_estimates_id_seq'::regclass);


--
-- TOC entry 1980 (class 2604 OID 16743)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_service_types ALTER COLUMN id SET DEFAULT nextval('job_service_types_id_seq'::regclass);


--
-- TOC entry 1981 (class 2604 OID 16753)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site ALTER COLUMN id SET DEFAULT nextval('job_site_id_seq'::regclass);


--
-- TOC entry 1983 (class 2604 OID 16775)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_statuses ALTER COLUMN id SET DEFAULT nextval('job_statuses_id_seq'::regclass);


--
-- TOC entry 1992 (class 2604 OID 16849)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_tasks ALTER COLUMN id SET DEFAULT nextval('job_tasks_id_seq'::regclass);


--
-- TOC entry 1984 (class 2604 OID 16783)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lead_source ALTER COLUMN id SET DEFAULT nextval('lead_source_id_seq'::regclass);


--
-- TOC entry 1985 (class 2604 OID 16792)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_colors ALTER COLUMN id SET DEFAULT nextval('product_colors_id_seq'::regclass);


--
-- TOC entry 1986 (class 2604 OID 16800)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_types ALTER COLUMN id SET DEFAULT nextval('product_types_id_seq'::regclass);


--
-- TOC entry 1987 (class 2604 OID 16808)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roof_types ALTER COLUMN id SET DEFAULT nextval('roof_types_id_seq'::regclass);


--
-- TOC entry 1988 (class 2604 OID 16816)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY service_types ALTER COLUMN id SET DEFAULT nextval('service_types_id_seq'::regclass);


--
-- TOC entry 1989 (class 2604 OID 16825)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_types ALTER COLUMN id SET DEFAULT nextval('task_types_id_seq'::regclass);


--
-- TOC entry 2251 (class 0 OID 16953)
-- Dependencies: 216
-- Data for Name: assemblies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assemblies (id, master_item, build_date, item_description, warranty_description, wo_description, proposal_description, is_po, is_wo, unit_of_measurement, total_material, tax_rate_percentage, total_tax, total_labor, total_cost, markup_operator_percentage, markup_total_amt, total_price, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 215
-- Name: assemblies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('assemblies_id_seq', 1, false);


--
-- TOC entry 2253 (class 0 OID 16964)
-- Dependencies: 218
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY company (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 217
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('company_id_seq', 1, false);


--
-- TOC entry 2237 (class 0 OID 16830)
-- Dependencies: 202
-- Data for Name: contact_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contact_types (id, contact_type, created_at, updated_at) FROM stdin;
3	Contractor	2013-12-19 23:34:52.661475	2013-12-19 23:34:52.661475
4	Owner	2013-12-19 23:35:14.213707	2013-12-19 23:35:14.213707
\.


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 201
-- Name: contact_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_types_id_seq', 4, true);


--
-- TOC entry 2207 (class 0 OID 16681)
-- Dependencies: 172
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (id, first_name, last_name, email, type, lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, company_name, title, latitude, longitude, is_active) FROM stdin;
1	Niket	Anand	niketanand@gmail.com	1	1	2013-12-13 19:27:58.397181	2013-12-16 02:45:45.466135	3916 212th PL SE	www	Bothell	WA	98021	4253192176	4253192176	4253192176					\N	2	SIQ	Dev	47.76232040	-122.20540350	1
\.


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 171
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customer_id_seq', 1, true);


--
-- TOC entry 2209 (class 0 OID 16697)
-- Dependencies: 174
-- Data for Name: customer_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_type (id, type, created_at, updated_at) FROM stdin;
1	Owner	2013-12-13 19:28:48.049021	2013-12-13 19:28:48.049021
2	Purchaser	2013-12-13 19:29:01.369783	2013-12-13 19:29:01.369783
3	Tenant	2013-12-13 19:29:13.37947	2013-12-13 19:29:13.37947
\.


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 173
-- Name: customer_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customer_type_id_seq', 3, true);


--
-- TOC entry 2211 (class 0 OID 16706)
-- Dependencies: 176
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees (id, first_name, last_name, address, city, state, zip, phone, is_active, is_admin, created_at, updated_at) FROM stdin;
1	Rob	Welsin						t	t	2013-12-13 19:30:05.926475	2013-12-13 19:30:05.926475
2	Niket	Anand	3916 212th PL SE	Bothell	WA	98021	4253192176	t	t	2013-12-13 19:30:19.12823	2013-12-13 19:30:19.12823
\.


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 175
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employees_id_seq', 2, true);


--
-- TOC entry 2213 (class 0 OID 16714)
-- Dependencies: 178
-- Data for Name: estimate_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estimate_types (id, estimate_type, default_overhead, created_at, updated_at) FROM stdin;
1	Commercial	25.00%	2013-12-13 19:33:43.564923	2013-12-13 19:33:43.564923
\.


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 177
-- Name: estimate_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estimate_types_id_seq', 2, true);


--
-- TOC entry 2215 (class 0 OID 16722)
-- Dependencies: 180
-- Data for Name: item_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item_codes (id, item_code, item_name, uom, item_cost, material_cost, material_w_tax, labor_rate, retail_price, created_at, updated_at) FROM stdin;
2	FLSH1	Drip Edge	PC	\N	\N	\N	\N	\N	2013-12-13 19:33:34.109383	2013-12-13 19:33:34.109383
3	BTS1	BOOTS 1 1-2"	EA	5.00	5.20	\N	\N	\N	2013-12-20 00:16:59.982029	2013-12-20 00:16:59.982029
\.


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 179
-- Name: item_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('item_codes_id_seq', 3, true);


--
-- TOC entry 2239 (class 0 OID 16838)
-- Dependencies: 204
-- Data for Name: job_call_notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_call_notes (id, job_site_id, call_notes, employee_id, created_at, updated_at, call_time, call_date) FROM stdin;
13	1	CCC	2	2013-12-16 05:57:46.444456	2013-12-16 05:58:05.106523	9:58 PM	2013-12-29
12	1	AAA	1	2013-12-16 05:57:30.78256	2013-12-16 06:04:22.649117	9:57 PM	\N
\.


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 203
-- Name: job_call_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_call_notes_id_seq', 13, true);


--
-- TOC entry 2243 (class 0 OID 16854)
-- Dependencies: 208
-- Data for Name: job_change_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_change_orders (id, job_site_id, co_number, co_total, notes, created_at, updated_at) FROM stdin;
1	1	ss	s	s	2013-12-15 20:43:04.051465	2013-12-15 20:43:04.051465
\.


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 207
-- Name: job_change_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_change_orders_id_seq', 2, true);


--
-- TOC entry 2245 (class 0 OID 16865)
-- Dependencies: 210
-- Data for Name: job_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_contacts (id, job_site_id, first_name, last_name, contact_type_id, contact_phone, contact_email, contact_notes, created_at, updated_at) FROM stdin;
2	1	Niket	Anand	3	4253192176	niketanand@gmail.com		2013-12-19 23:38:20.318352	2013-12-19 23:38:20.318352
\.


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 209
-- Name: job_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_contacts_id_seq', 2, true);


--
-- TOC entry 2249 (class 0 OID 16887)
-- Dependencies: 214
-- Data for Name: job_costings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_costings (id, job_site_id, materials, labor, job_cost, overhead, overhead_percentage, net_profit, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 213
-- Name: job_costings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_costings_id_seq', 1, false);


--
-- TOC entry 2247 (class 0 OID 16876)
-- Dependencies: 212
-- Data for Name: job_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_documents (id, job_site_id, doc_name, doc_desc, doc_link, created_at, updated_at) FROM stdin;
2	1	BBB	sss	http://www.yahoo.com	2013-12-16 04:30:33.204773	2013-12-16 04:30:33.204773
\.


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 211
-- Name: job_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_documents_id_seq', 2, true);


--
-- TOC entry 2217 (class 0 OID 16730)
-- Dependencies: 182
-- Data for Name: job_estimates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_estimates (id, job_site_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, item_extended, created_at, updated_at) FROM stdin;
1	1	1	2	3			3.00	3	2013-12-13 19:36:07.57716	2013-12-13 19:36:07.57716
2	1	2	3	2			2.00		2013-12-20 00:17:54.54615	2013-12-20 00:17:54.54615
\.


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 181
-- Name: job_estimates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_estimates_id_seq', 2, true);


--
-- TOC entry 2219 (class 0 OID 16740)
-- Dependencies: 184
-- Data for Name: job_service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_service_types (id, job_id, service_type_id) FROM stdin;
5	1	1
6	1	2
\.


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 183
-- Name: job_service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_service_types_id_seq', 6, true);


--
-- TOC entry 2221 (class 0 OID 16750)
-- Dependencies: 186
-- Data for Name: job_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_site (id, customer_id, company_name, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, assign_to_id, date_taken, created_at, updated_at) FROM stdin;
1	1	REI	NIket	33322	111	22	333	44	22	3916 212th PL SE	www	Bothell	WA	98021	1	47.76232040	-122.20540350	2013-12-26	1	2	1	1	2	2	1	1		33		2013-12-30	3	eeee	1	1	2013-12-30	2013-12-13 19:35:32.508155	2013-12-20 00:34:15.801274
\.


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 185
-- Name: job_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_site_id_seq', 1, true);


--
-- TOC entry 2223 (class 0 OID 16772)
-- Dependencies: 188
-- Data for Name: job_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_statuses (id, job_status, created_at, updated_at) FROM stdin;
1	Active	2013-12-13 19:30:52.683149	2013-12-13 19:30:52.683149
2	Pending	2013-12-13 19:31:02.515712	2013-12-13 19:31:02.515712
3	Finished	2013-12-13 19:31:12.399277	2013-12-13 19:31:12.399277
\.


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 187
-- Name: job_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_statuses_id_seq', 3, true);


--
-- TOC entry 2241 (class 0 OID 16846)
-- Dependencies: 206
-- Data for Name: job_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_tasks (id, job_site_id, task_type_id, task_note, target_date, entered_by_id, date_completed, completed_by_id, created_at, updated_at) FROM stdin;
8	1	1		2013-12-26	2	2013-12-31	1	2013-12-16 06:00:24.964523	2013-12-16 06:00:24.964523
9	1	2		\N	2	\N	1	2013-12-16 06:00:46.261741	2013-12-16 06:02:59.11434
\.


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 205
-- Name: job_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_tasks_id_seq', 9, true);


--
-- TOC entry 2225 (class 0 OID 16780)
-- Dependencies: 190
-- Data for Name: lead_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lead_source (id, source, created_at, updated_at) FROM stdin;
1	Google	2013-12-13 19:29:31.91753	2013-12-13 19:29:31.91753
2	Paper ad	2013-12-13 19:29:43.050167	2013-12-13 19:29:43.050167
\.


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 189
-- Name: lead_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lead_source_id_seq', 2, true);


--
-- TOC entry 2227 (class 0 OID 16789)
-- Dependencies: 192
-- Data for Name: product_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_colors (id, product_color, created_at, updated_at) FROM stdin;
2	Bronze	2013-12-13 19:33:05.283734	2013-12-13 19:33:05.283734
\.


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 191
-- Name: product_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_colors_id_seq', 2, true);


--
-- TOC entry 2229 (class 0 OID 16797)
-- Dependencies: 194
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_types (id, product_type, created_at, updated_at) FROM stdin;
1	APP	2013-12-13 19:32:34.917997	2013-12-13 19:32:34.917997
2	CDX4Ply	2013-12-13 19:32:43.02146	2013-12-13 19:32:43.02146
\.


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 193
-- Name: product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_types_id_seq', 2, true);


--
-- TOC entry 2231 (class 0 OID 16805)
-- Dependencies: 196
-- Data for Name: roof_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roof_types (id, roof_type, created_at, updated_at) FROM stdin;
1	Asphalt Shingle	2013-12-13 19:32:09.563547	2013-12-13 19:32:09.563547
2	Cement Tile	2013-12-13 19:32:22.7243	2013-12-13 19:32:22.7243
\.


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 195
-- Name: roof_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roof_types_id_seq', 2, true);


--
-- TOC entry 2205 (class 0 OID 16401)
-- Dependencies: 170
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20131210070730
20131210071342
20131210071741
20131210072119
20131210072417
20131210073945
20131210080002
20131210085006
20131211065014
20131211061948
20131211063150
20131214025156
20131214030542
20131214031528
20131214031748
20131214031839
20131214031917
20131214032004
20131214032040
\.


--
-- TOC entry 2233 (class 0 OID 16813)
-- Dependencies: 198
-- Data for Name: service_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY service_types (id, service_type, created_at, updated_at) FROM stdin;
1	Clean Roof	2013-12-13 19:31:35.88262	2013-12-13 19:31:35.88262
2	Coat roof	2013-12-13 19:31:50.831475	2013-12-13 19:31:50.831475
\.


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 197
-- Name: service_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('service_types_id_seq', 2, true);


--
-- TOC entry 2235 (class 0 OID 16822)
-- Dependencies: 200
-- Data for Name: task_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task_types (id, task_type, created_at, updated_at) FROM stdin;
1	Install	2013-12-15 15:45:38.255671	2013-12-15 15:45:38.255671
2	Remove	2013-12-15 15:45:53.918567	2013-12-15 15:45:53.918567
\.


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 199
-- Name: task_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('task_types_id_seq', 2, true);


--
-- TOC entry 2065 (class 2606 OID 16961)
-- Name: assemblies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY assemblies
    ADD CONSTRAINT assemblies_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 16969)
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 16835)
-- Name: contact_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contact_types
    ADD CONSTRAINT contact_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2001 (class 2606 OID 16690)
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2007 (class 2606 OID 16702)
-- Name: customer_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer_type
    ADD CONSTRAINT customer_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2010 (class 2606 OID 16711)
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 2012 (class 2606 OID 16719)
-- Name: estimate_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estimate_types
    ADD CONSTRAINT estimate_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2014 (class 2606 OID 16727)
-- Name: item_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item_codes
    ADD CONSTRAINT item_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 16843)
-- Name: job_call_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_call_notes
    ADD CONSTRAINT job_call_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 16862)
-- Name: job_change_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_change_orders
    ADD CONSTRAINT job_change_orders_pkey PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 16873)
-- Name: job_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_contacts
    ADD CONSTRAINT job_contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 16895)
-- Name: job_costings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_costings
    ADD CONSTRAINT job_costings_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 16884)
-- Name: job_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_documents
    ADD CONSTRAINT job_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 2018 (class 2606 OID 16735)
-- Name: job_estimates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT job_estimates_pkey PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 16745)
-- Name: job_service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_service_types
    ADD CONSTRAINT job_service_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2034 (class 2606 OID 16759)
-- Name: job_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT job_site_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 16777)
-- Name: job_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_statuses
    ADD CONSTRAINT job_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 16851)
-- Name: job_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT job_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 16785)
-- Name: lead_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lead_source
    ADD CONSTRAINT lead_source_pkey PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 16794)
-- Name: product_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_colors
    ADD CONSTRAINT product_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 16802)
-- Name: product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 16810)
-- Name: roof_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roof_types
    ADD CONSTRAINT roof_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 16818)
-- Name: service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 16827)
-- Name: task_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_types
    ADD CONSTRAINT task_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2023 (class 1259 OID 16760)
-- Name: fk_assign_to_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_assign_to_idx ON job_site USING btree (assign_to_id);


--
-- TOC entry 2002 (class 1259 OID 16691)
-- Name: fk_cust_company_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_cust_company_idx ON customer USING btree (company_id);


--
-- TOC entry 2003 (class 1259 OID 16692)
-- Name: fk_cust_lead_source_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_cust_lead_source_idx ON customer USING btree (lead_source_id);


--
-- TOC entry 2004 (class 1259 OID 16694)
-- Name: fk_cust_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_cust_type_idx ON customer USING btree (type);


--
-- TOC entry 2015 (class 1259 OID 16736)
-- Name: fk_est_job_site_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_est_job_site_id_idx ON job_estimates USING btree (job_site_id);


--
-- TOC entry 2024 (class 1259 OID 16762)
-- Name: fk_estimate_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_estimate_type_idx ON job_site USING btree (estimate_type_id);


--
-- TOC entry 2025 (class 1259 OID 16763)
-- Name: fk_exist_roof_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_exist_roof_type_idx ON job_site USING btree (existing_roof_type_id);


--
-- TOC entry 2026 (class 1259 OID 16764)
-- Name: fk_info_taken_by_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_info_taken_by_idx ON job_site USING btree (info_taken_by_id);


--
-- TOC entry 2027 (class 1259 OID 16761)
-- Name: fk_job_customer_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_job_customer_idx ON job_site USING btree (customer_id);


--
-- TOC entry 2019 (class 1259 OID 16746)
-- Name: fk_job_site_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_job_site_id_idx ON job_service_types USING btree (job_id);


--
-- TOC entry 2016 (class 1259 OID 16737)
-- Name: fk_master_item_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_master_item_id_idx ON job_estimates USING btree (master_item_id);


--
-- TOC entry 2028 (class 1259 OID 16766)
-- Name: fk_new_roof_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_new_roof_type_idx ON job_site USING btree (new_roof_type_id);


--
-- TOC entry 2029 (class 1259 OID 16767)
-- Name: fk_product_color_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_product_color_idx ON job_site USING btree (product_color_id);


--
-- TOC entry 2030 (class 1259 OID 16768)
-- Name: fk_product_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_product_type ON job_site USING btree (product_type_id);


--
-- TOC entry 2005 (class 1259 OID 16693)
-- Name: fk_sales_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_sales_idx ON customer USING btree (sales_person_id);


--
-- TOC entry 2031 (class 1259 OID 16769)
-- Name: fk_sales_rep_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_sales_rep_idx ON job_site USING btree (sales_rep_id);


--
-- TOC entry 2020 (class 1259 OID 16747)
-- Name: fk_serv_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_serv_type_idx ON job_service_types USING btree (service_type_id);


--
-- TOC entry 2032 (class 1259 OID 16765)
-- Name: fk_status_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fk_status_idx ON job_site USING btree (job_status_id);


--
-- TOC entry 2068 (class 1259 OID 16970)
-- Name: name_UNIQUE; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "name_UNIQUE" ON company USING btree (name);


--
-- TOC entry 2039 (class 1259 OID 16786)
-- Name: source_UNIQUE; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "source_UNIQUE" ON lead_source USING btree (source);


--
-- TOC entry 2008 (class 1259 OID 16703)
-- Name: type_UNIQUE; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "type_UNIQUE" ON customer_type USING btree (type);


--
-- TOC entry 1999 (class 1259 OID 16404)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- TOC entry 2086 (class 2606 OID 17060)
-- Name: fk_assign_to_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_assign_to_id FOREIGN KEY (assign_to_id) REFERENCES employees(id);


--
-- TOC entry 2071 (class 2606 OID 17000)
-- Name: fk_comp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_comp_id FOREIGN KEY (company_id) REFERENCES company(id);


--
-- TOC entry 2092 (class 2606 OID 16921)
-- Name: fk_completed_by_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_completed_by_emp_id FOREIGN KEY (completed_by_id) REFERENCES employees(id);


--
-- TOC entry 2095 (class 2606 OID 16936)
-- Name: fk_cont_type_contact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_contacts
    ADD CONSTRAINT fk_cont_type_contact FOREIGN KEY (contact_type_id) REFERENCES contact_types(id);


--
-- TOC entry 2097 (class 2606 OID 16946)
-- Name: fk_cost_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_costings
    ADD CONSTRAINT fk_cost_site_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2077 (class 2606 OID 17015)
-- Name: fk_cust_job_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_cust_job_id FOREIGN KEY (customer_id) REFERENCES customer(id);


--
-- TOC entry 2069 (class 2606 OID 16990)
-- Name: fk_cust_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_cust_type_id FOREIGN KEY (type) REFERENCES customer_type(id);


--
-- TOC entry 2088 (class 2606 OID 16901)
-- Name: fk_emp_call_note; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_call_notes
    ADD CONSTRAINT fk_emp_call_note FOREIGN KEY (employee_id) REFERENCES employees(id);


--
-- TOC entry 2090 (class 2606 OID 16911)
-- Name: fk_entered_by_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_entered_by_emp_id FOREIGN KEY (entered_by_id) REFERENCES employees(id);


--
-- TOC entry 2074 (class 2606 OID 17075)
-- Name: fk_est_job_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT fk_est_job_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2084 (class 2606 OID 17050)
-- Name: fk_est_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_est_type_id FOREIGN KEY (estimate_type_id) REFERENCES estimate_types(id);


--
-- TOC entry 2079 (class 2606 OID 17025)
-- Name: fk_ext_roof_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_ext_roof_type_id FOREIGN KEY (existing_roof_type_id) REFERENCES roof_types(id);


--
-- TOC entry 2085 (class 2606 OID 17055)
-- Name: fk_info_tkn_by_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_info_tkn_by_id FOREIGN KEY (info_taken_by_id) REFERENCES employees(id);


--
-- TOC entry 2073 (class 2606 OID 17010)
-- Name: fk_item_code_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT fk_item_code_id FOREIGN KEY (master_item_id) REFERENCES item_codes(id);


--
-- TOC entry 2093 (class 2606 OID 16926)
-- Name: fk_job_chn_ord_job_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_change_orders
    ADD CONSTRAINT fk_job_chn_ord_job_site_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2094 (class 2606 OID 16931)
-- Name: fk_job_cont_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_contacts
    ADD CONSTRAINT fk_job_cont_site_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2075 (class 2606 OID 17065)
-- Name: fk_job_job_srv_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_service_types
    ADD CONSTRAINT fk_job_job_srv_id FOREIGN KEY (job_id) REFERENCES job_site(id);


--
-- TOC entry 2089 (class 2606 OID 16906)
-- Name: fk_job_job_task_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_job_job_task_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2087 (class 2606 OID 16896)
-- Name: fk_job_site_call_note_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_call_notes
    ADD CONSTRAINT fk_job_site_call_note_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2076 (class 2606 OID 17070)
-- Name: fk_job_srv_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_service_types
    ADD CONSTRAINT fk_job_srv_id FOREIGN KEY (service_type_id) REFERENCES service_types(id);


--
-- TOC entry 2078 (class 2606 OID 17020)
-- Name: fk_job_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_job_status_id FOREIGN KEY (job_status_id) REFERENCES job_statuses(id);


--
-- TOC entry 2091 (class 2606 OID 16916)
-- Name: fk_job_task_task_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_job_task_task_type_id FOREIGN KEY (task_type_id) REFERENCES task_types(id);


--
-- TOC entry 2070 (class 2606 OID 16995)
-- Name: fk_lead_src_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_lead_src_id FOREIGN KEY (lead_source_id) REFERENCES lead_source(id);


--
-- TOC entry 2080 (class 2606 OID 17030)
-- Name: fk_new_roof_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_new_roof_type_id FOREIGN KEY (new_roof_type_id) REFERENCES roof_types(id);


--
-- TOC entry 2082 (class 2606 OID 17040)
-- Name: fk_prd_color_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_prd_color_id FOREIGN KEY (product_color_id) REFERENCES product_colors(id);


--
-- TOC entry 2081 (class 2606 OID 17035)
-- Name: fk_prd_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_prd_type_id FOREIGN KEY (product_type_id) REFERENCES product_types(id);


--
-- TOC entry 2072 (class 2606 OID 17005)
-- Name: fk_sales_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_sales_person_id FOREIGN KEY (sales_person_id) REFERENCES employees(id);


--
-- TOC entry 2083 (class 2606 OID 17045)
-- Name: fk_sales_rep_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_sales_rep_id FOREIGN KEY (sales_rep_id) REFERENCES employees(id);


--
-- TOC entry 2096 (class 2606 OID 16941)
-- Name: fk_site_doc_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_documents
    ADD CONSTRAINT fk_site_doc_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-12-19 18:15:37

--
-- PostgreSQL database dump complete
--

