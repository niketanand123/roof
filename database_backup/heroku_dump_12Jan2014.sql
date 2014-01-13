--PostgreSQL Maestro 13.7.0.3
------------------------------------------
--Host     : localhost
--Database : postgres


\connect - postgres
CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 6 TABLESPACE = pg_default;
\connect postgres postgres
-- Structure for table schema_migrations (OID = 16401):
SET search_path = public, pg_catalog;
CREATE TABLE schema_migrations (
    "version" varchar(255) NOT NULL
) WITHOUT OIDS;
-- Definition for sequence customer_id_seq (OID = 16679):
CREATE SEQUENCE customer_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table customer (OID = 16681):
CREATE TABLE customer (
    id integer DEFAULT nextval('customer_id_seq'::regclass) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    "type" integer,
    lead_source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    street1 varchar(100),
    street2 varchar(100),
    city varchar(45),
    state varchar(30),
    zip varchar(20),
    home_phone varchar(15),
    mobile_phone varchar(15),
    work_phone varchar(15),
    work_phone_ext varchar(10),
    fax varchar(15),
    website varchar(100),
    misc varchar(500),
    company_id integer,
    sales_person_id integer,
    title varchar(45),
    latitude numeric(10,8),
    longitude numeric(11,8),
    is_active smallint DEFAULT 1,
    status varchar(50) DEFAULT 'Lead'::character varying
) WITHOUT OIDS;
-- Definition for sequence customer_type_id_seq (OID = 16695):
CREATE SEQUENCE customer_type_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table customer_type (OID = 16697):
CREATE TABLE customer_type (
    id integer DEFAULT nextval('customer_type_id_seq'::regclass) NOT NULL,
    "type" varchar(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence employees_id_seq (OID = 16704):
CREATE SEQUENCE employees_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table employees (OID = 16706):
CREATE TABLE employees (
    id integer DEFAULT nextval('employees_id_seq'::regclass) NOT NULL,
    first_name varchar(50),
    last_name varchar(50),
    address varchar(100),
    city varchar(50),
    state varchar(25),
    zip varchar(10),
    phone varchar(15),
    is_active boolean,
    is_admin boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence estimate_types_id_seq (OID = 16712):
CREATE SEQUENCE estimate_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table estimate_types (OID = 16714):
CREATE TABLE estimate_types (
    id integer DEFAULT nextval('estimate_types_id_seq'::regclass) NOT NULL,
    estimate_type varchar(50),
    default_overhead varchar(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence item_codes_id_seq (OID = 16720):
CREATE SEQUENCE item_codes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table item_codes (OID = 16722):
CREATE TABLE item_codes (
    id integer DEFAULT nextval('item_codes_id_seq'::regclass) NOT NULL,
    item_code varchar(20),
    item_name varchar(100),
    material_cost double precision DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uom_id smallint
) WITHOUT OIDS;
-- Definition for sequence job_estimates_id_seq (OID = 16728):
CREATE SEQUENCE job_estimates_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_estimate_items (OID = 16730):
CREATE TABLE job_estimate_items (
    id integer DEFAULT nextval('job_estimates_id_seq'::regclass) NOT NULL,
    job_estimate_id integer NOT NULL,
    step integer,
    master_item_id integer,
    qty integer,
    proposal_desc varchar(330),
    warranty_desc varchar(330),
    retail_price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    item_extended double precision
) WITHOUT OIDS;
-- Definition for sequence job_service_types_id_seq (OID = 16738):
CREATE SEQUENCE job_service_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_service_types (OID = 16740):
CREATE TABLE job_service_types (
    id integer DEFAULT nextval('job_service_types_id_seq'::regclass) NOT NULL,
    job_id integer NOT NULL,
    service_type_id integer NOT NULL
) WITHOUT OIDS;
-- Definition for sequence job_site_id_seq (OID = 16748):
CREATE SEQUENCE job_site_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_site (OID = 16750):
CREATE TABLE job_site (
    id integer DEFAULT nextval('job_site_id_seq'::regclass) NOT NULL,
    customer_id integer NOT NULL,
    contact_name varchar(100) NOT NULL,
    phone varchar(15),
    work_phone varchar(15),
    work_phone_ext varchar(10),
    mobile_phone varchar(15),
    fax varchar(15),
    website varchar(100),
    street1 varchar(100),
    street2 varchar(100),
    city varchar(50),
    state varchar(50),
    zip varchar(20),
    is_active smallint DEFAULT 1,
    latitude numeric(10,8),
    longitude numeric(11,8),
    job_start_date date,
    job_status_id integer,
    how_many_stories varchar(255),
    existing_roof_type_id integer,
    new_roof_type_id integer,
    product_type_id integer,
    product_color_id integer,
    sales_rep_id integer,
    estimate_type_id integer,
    contract_price varchar(255),
    deposit_due varchar(255),
    deposit_method varchar(255),
    date_completed date,
    job_notes varchar(255),
    lead_sheet_note varchar(255),
    info_taken_by_id integer,
    date_taken date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_closed boolean DEFAULT false
) WITHOUT OIDS;
-- Definition for sequence job_statuses_id_seq (OID = 16770):
CREATE SEQUENCE job_statuses_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_statuses (OID = 16772):
CREATE TABLE job_statuses (
    id integer DEFAULT nextval('job_statuses_id_seq'::regclass) NOT NULL,
    status varchar(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_job_closed boolean DEFAULT false
) WITHOUT OIDS;
-- Definition for sequence lead_source_id_seq (OID = 16778):
CREATE SEQUENCE lead_source_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table lead_source (OID = 16780):
CREATE TABLE lead_source (
    id integer DEFAULT nextval('lead_source_id_seq'::regclass) NOT NULL,
    source varchar(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence product_colors_id_seq (OID = 16787):
CREATE SEQUENCE product_colors_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table product_colors (OID = 16789):
CREATE TABLE product_colors (
    id integer DEFAULT nextval('product_colors_id_seq'::regclass) NOT NULL,
    product_color varchar(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence product_types_id_seq (OID = 16795):
CREATE SEQUENCE product_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table product_types (OID = 16797):
CREATE TABLE product_types (
    id integer DEFAULT nextval('product_types_id_seq'::regclass) NOT NULL,
    product_type varchar(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence roof_types_id_seq (OID = 16803):
CREATE SEQUENCE roof_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table roof_types (OID = 16805):
CREATE TABLE roof_types (
    id integer DEFAULT nextval('roof_types_id_seq'::regclass) NOT NULL,
    roof_type varchar(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence service_types_id_seq (OID = 16811):
CREATE SEQUENCE service_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table service_types (OID = 16813):
CREATE TABLE service_types (
    id integer DEFAULT nextval('service_types_id_seq'::regclass) NOT NULL,
    service_type varchar(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence task_types_id_seq (OID = 16820):
CREATE SEQUENCE task_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table task_types (OID = 16822):
CREATE TABLE task_types (
    id integer DEFAULT nextval('task_types_id_seq'::regclass) NOT NULL,
    task_type varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence contact_types_id_seq (OID = 16828):
CREATE SEQUENCE contact_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table contact_types (OID = 16830):
CREATE TABLE contact_types (
    id integer DEFAULT nextval('contact_types_id_seq'::regclass) NOT NULL,
    contact_type varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_call_notes_id_seq (OID = 16836):
CREATE SEQUENCE job_call_notes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_call_notes (OID = 16838):
CREATE TABLE job_call_notes (
    id integer DEFAULT nextval('job_call_notes_id_seq'::regclass) NOT NULL,
    job_site_id integer,
    call_notes varchar(255),
    employee_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    call_time varchar(10),
    call_date date
) WITHOUT OIDS;
-- Definition for sequence job_tasks_id_seq (OID = 16844):
CREATE SEQUENCE job_tasks_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_tasks (OID = 16846):
CREATE TABLE job_tasks (
    id integer DEFAULT nextval('job_tasks_id_seq'::regclass) NOT NULL,
    job_site_id integer,
    task_type_id integer,
    task_note varchar(255),
    target_date date,
    entered_by_id integer,
    date_completed date,
    completed_by_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_change_orders_id_seq (OID = 16852):
CREATE SEQUENCE job_change_orders_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_change_orders (OID = 16854):
CREATE TABLE job_change_orders (
    id integer DEFAULT nextval('job_change_orders_id_seq'::regclass) NOT NULL,
    job_site_id integer,
    co_number varchar(255),
    co_total varchar(255),
    notes varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_contacts_id_seq (OID = 16863):
CREATE SEQUENCE job_contacts_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_contacts (OID = 16865):
CREATE TABLE job_contacts (
    id integer DEFAULT nextval('job_contacts_id_seq'::regclass) NOT NULL,
    job_site_id integer,
    first_name varchar(255),
    last_name varchar(255),
    contact_type_id integer,
    contact_phone varchar(255),
    contact_email varchar(255),
    contact_notes varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_documents_id_seq (OID = 16874):
CREATE SEQUENCE job_documents_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_documents (OID = 16876):
CREATE TABLE job_documents (
    id integer DEFAULT nextval('job_documents_id_seq'::regclass) NOT NULL,
    job_site_id integer,
    doc_name varchar(255),
    doc_desc varchar(255),
    doc_link varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_costings_id_seq (OID = 16885):
CREATE SEQUENCE job_costings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_costings (OID = 16887):
CREATE TABLE job_costings (
    id integer DEFAULT nextval('job_costings_id_seq'::regclass) NOT NULL,
    job_site_id integer,
    materials varchar(255),
    labor varchar(255),
    job_cost numeric,
    overhead numeric,
    overhead_percentage integer,
    net_profit numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence assemblies_id_seq (OID = 16951):
CREATE SEQUENCE assemblies_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table assemblies (OID = 16953):
CREATE TABLE assemblies (
    id integer DEFAULT nextval('assemblies_id_seq'::regclass) NOT NULL,
    master_item varchar(50),
    build_date date,
    item_description varchar(300),
    warranty_description varchar(255),
    wo_description varchar(255),
    proposal_description varchar(255),
    total_material double precision,
    tax_rate_percentage double precision,
    total_tax double precision,
    total_labor double precision,
    total_cost double precision,
    markup_operator_percentage double precision,
    total_price double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uom_id smallint,
    total_material_cost double precision
) WITHOUT OIDS;
-- Definition for sequence unit_of_measurements_id_seq (OID = 17080):
CREATE SEQUENCE unit_of_measurements_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table unit_of_measurements (OID = 17082):
CREATE TABLE unit_of_measurements (
    id integer DEFAULT nextval('unit_of_measurements_id_seq'::regclass) NOT NULL,
    unit varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence assembly_items_id_seq (OID = 25318):
CREATE SEQUENCE assembly_items_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table assembly_items (OID = 25320):
CREATE TABLE assembly_items (
    id integer DEFAULT nextval('assembly_items_id_seq'::regclass) NOT NULL,
    item_code_id integer,
    labor_cost double precision,
    material_cost double precision,
    percentage_used double precision,
    material_cost_ext double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    assembly_id integer,
    item_price double precision,
    build_date date,
    markup_operator_percentage double precision,
    is_po boolean,
    is_wo boolean,
    material_tax_percentage double precision,
    material_tax_cost double precision,
    total_cost double precision,
    total_material_cost double precision
) WITHOUT OIDS;
-- Definition for sequence vendors_id_seq (OID = 25442):
CREATE SEQUENCE vendors_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table vendors (OID = 25444):
CREATE TABLE vendors (
    id integer DEFAULT nextval('vendors_id_seq'::regclass) NOT NULL,
    name varchar(255),
    address1 varchar(255),
    city1 varchar(255),
    state1 varchar(255),
    zip1 varchar(255),
    address2 varchar(255),
    city2 varchar(255),
    state2 varchar(255),
    zip2 varchar(255),
    gm_name varchar(255),
    gm_phone varchar(255),
    sales_rep_id integer,
    sales_rep_phone varchar(255),
    email varchar(255),
    website varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence companies_id_seq (OID = 25458):
CREATE SEQUENCE companies_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table companies (OID = 25460):
CREATE TABLE companies (
    id integer DEFAULT nextval('companies_id_seq'::regclass) NOT NULL,
    name varchar(255),
    address varchar(255),
    city varchar(255),
    state varchar(255),
    zip varchar(255),
    main_phone varchar(255),
    fax_number varchar(255),
    main_email varchar(255),
    website varchar(255),
    license varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence assets_id_seq (OID = 25487):
CREATE SEQUENCE assets_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table assets (OID = 25489):
CREATE TABLE assets (
    id integer DEFAULT nextval('assets_id_seq'::regclass) NOT NULL,
    asset_file_name varchar(255),
    asset_content_type varchar(255),
    asset_file_size integer,
    asset_updated_at timestamp without time zone,
    job_site_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_estimate_statuses_id_seq (OID = 25514):
CREATE SEQUENCE job_estimate_statuses_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_estimate_statuses (OID = 25516):
CREATE TABLE job_estimate_statuses (
    id integer DEFAULT nextval('job_estimate_statuses_id_seq'::regclass) NOT NULL,
    status varchar(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
) WITHOUT OIDS;
-- Definition for sequence job_estimates_id_seq1 (OID = 25524):
CREATE SEQUENCE job_estimates_id_seq1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_estimates (OID = 25526):
CREATE TABLE job_estimates (
    id integer DEFAULT nextval('job_estimates_id_seq1'::regclass) NOT NULL,
    name varchar(255),
    total_item_price numeric,
    price_adjustment numeric,
    reason_desc varchar(255),
    estimate_status_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    job_site_id integer
) WITHOUT OIDS;
-- Definition for sequence sales_taxes_id_seq (OID = 25555):
CREATE SEQUENCE sales_taxes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table sales_taxes (OID = 25557):
CREATE TABLE sales_taxes (
    id integer DEFAULT nextval('sales_taxes_id_seq'::regclass) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sales_tax double precision
) WITHOUT OIDS;
-- Definition for sequence job_roof_types_id_seq (OID = 25640):
CREATE SEQUENCE job_roof_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
-- Structure for table job_roof_types (OID = 25642):
CREATE TABLE job_roof_types (
    id integer DEFAULT nextval('job_roof_types_id_seq'::regclass) NOT NULL,
    job_id integer NOT NULL,
    new_roof_type_id integer NOT NULL
) WITHOUT OIDS;
--
-- Data for blobs (OID = 16401) (LIMIT 0,29)
--
INSERT INTO schema_migrations ("version") VALUES ('20131210070730');
INSERT INTO schema_migrations ("version") VALUES ('20131210071342');
INSERT INTO schema_migrations ("version") VALUES ('20131210071741');
INSERT INTO schema_migrations ("version") VALUES ('20131210072119');
INSERT INTO schema_migrations ("version") VALUES ('20131210072417');
INSERT INTO schema_migrations ("version") VALUES ('20131210073945');
INSERT INTO schema_migrations ("version") VALUES ('20131210080002');
INSERT INTO schema_migrations ("version") VALUES ('20131210085006');
INSERT INTO schema_migrations ("version") VALUES ('20131211065014');
INSERT INTO schema_migrations ("version") VALUES ('20131211061948');
INSERT INTO schema_migrations ("version") VALUES ('20131211063150');
INSERT INTO schema_migrations ("version") VALUES ('20131214025156');
INSERT INTO schema_migrations ("version") VALUES ('20131214030542');
INSERT INTO schema_migrations ("version") VALUES ('20131214031528');
INSERT INTO schema_migrations ("version") VALUES ('20131214031748');
INSERT INTO schema_migrations ("version") VALUES ('20131214031839');
INSERT INTO schema_migrations ("version") VALUES ('20131214031917');
INSERT INTO schema_migrations ("version") VALUES ('20131214032004');
INSERT INTO schema_migrations ("version") VALUES ('20131214032040');
INSERT INTO schema_migrations ("version") VALUES ('20131226150655');
INSERT INTO schema_migrations ("version") VALUES ('20131229015100');
INSERT INTO schema_migrations ("version") VALUES ('20131231210642');
INSERT INTO schema_migrations ("version") VALUES ('20140103194746');
INSERT INTO schema_migrations ("version") VALUES ('20140105064048');
INSERT INTO schema_migrations ("version") VALUES ('20140105071907');
INSERT INTO schema_migrations ("version") VALUES ('20140108060159');
INSERT INTO schema_migrations ("version") VALUES ('20140108060658');
INSERT INTO schema_migrations ("version") VALUES ('20140111090604');
INSERT INTO schema_migrations ("version") VALUES ('20140112010904');
COMMIT;
--
-- Data for blobs (OID = 16681) (LIMIT 0,13)
--
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (4, 'Rob', 'Welsin', '', NULL, NULL, '12/31/2013 4:18:14 PM', '12/31/2013 4:18:14 PM', '20415 Bothell Everett Hwy', '', 'Bothell', 'WA', '98012', '', '', '', '', '', '', '', NULL, NULL, 'Dev', 47.8123998, -122.2070275, 1, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (3, 'Niket123', 'Anand', 'niketanand@gmail.com', NULL, NULL, '12/28/2013 8:27:15 PM', '1/3/2014 8:19:56 PM', '3916 212th PL SE', '', 'Bothell', 'Washington', '98021', '4253192176', '4253192176', '4253192176', '', '', '', '', 1, NULL, '', 47.804848, -122.18037, 1, 'Existing');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (2, 'NNN', 'MMM', '', NULL, NULL, '12/27/2013 6:28:21 AM', '1/4/2014 10:16:33 PM', '20415 Bothell Everett Hwy', '', 'Bothell', 'WA', '98012', '', '', '', '', '', 'http://google.com', '', NULL, NULL, 'sss', 47.8123998, -122.2070275, 0, NULL);
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (6, 'RRR', 'EEE', 'niketanand@gmail.com', NULL, NULL, '1/4/2014 8:00:47 PM', '1/4/2014 11:08:23 PM', '3916 212th PL SE', '', 'Bothell', 'Washington', '98021', '4253192176', '4253192176', '4253192176', '', '', '', '', 2, NULL, 'RRR', 47.804848, -122.18037, 1, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (1, 'Niket', 'Anand', 'niketanand@gmail.com', 1, 1, '12/13/2013 7:27:58 PM', '1/6/2014 3:42:00 AM', '3916 212th PL SE', '', 'Bothell', 'WA', '98021', '4253192176', '4253192176', '4253192176', '', '', 'http://google.com', '', 1, 2, 'Dev', 47.804848, -122.18037, 1, 'Existing');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (8, 'Tom', 'Hil', 'ab@dd.com', NULL, NULL, '1/11/2014 8:20:23 AM', '1/11/2014 8:20:23 AM', 'hotel circus circus', '', 'lasvegas', 'NV', '33443', '', '', '', '', '', '', '', 2, NULL, '', 38.8026097, -116.419389, 1, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (9, 'AAS', 'SSS', 'ss@s.com', NULL, NULL, '1/11/2014 4:26:18 PM', '1/11/2014 4:53:48 PM', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', '', '', '', '', '', 'http://roof.com', '', 2, NULL, '', 47.5733208, -122.1701399, 0, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (5, 'ABC', 'XYZ', 'abc@aa.com', 1, 1, '12/31/2013 4:32:54 PM', '1/11/2014 4:54:27 PM', '3916 212th PL SE', '', '', '', '98021', '', '', '', '', '', '', '', NULL, 1, 'Dev', 47.804848, -122.18037, 0, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (7, '100', '200', 'ww@dd.com', NULL, NULL, '1/7/2014 11:21:01 AM', '1/11/2014 4:57:32 PM', 'www', '', '', '', '44444', '2222221111', '', '3334442222', '333', '', '', '', NULL, NULL, '', 41.0625004, -73.8548722, 0, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (10, '111', 'Sns', 'ww@dd.com', NULL, NULL, '1/11/2014 5:18:21 PM', '1/11/2014 5:19:05 PM', 'ww', '', '', '', '98021', '', '', '', '', '', '', '', NULL, NULL, '', 45.7579996, -84.6917354, 0, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (11, 'rr', 'ee', '', NULL, NULL, '1/11/2014 8:22:58 PM', '1/11/2014 8:22:58 PM', 'www', '', '', '', '33333', '3333333333', '3333333333', '3333333333', '', '(444) 444-4444', '', '', NULL, NULL, 'ee', 41.0625004, -73.8548722, 1, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (12, 'ss', 'ww', '', NULL, NULL, '1/11/2014 8:34:29 PM', '1/11/2014 9:13:50 PM', '3916 212th PL SE', '', 'Bothell', 'Washington', '98021', '2222222222', '', '', '', '', '', '', 4, NULL, '', 47.804848, -122.18037, 1, 'Lead');
INSERT INTO customer (id, first_name, last_name, email, "type", lead_source_id, created_at, updated_at, street1, street2, city, state, zip, home_phone, mobile_phone, work_phone, work_phone_ext, fax, website, misc, company_id, sales_person_id, title, latitude, longitude, is_active, status) VALUES (13, 'Nitya', 'Anand', 'niketanand@gmail.com', NULL, NULL, '1/11/2014 9:39:06 PM', '1/11/2014 9:39:06 PM', '3916 212th PL SE', '', 'Bothell', 'Washington', '98021', '', '', '4253192176', '', '', '', '', 6, NULL, 'WE', 47.804848, -122.18037, 1, 'Lead');
COMMIT;
--
-- Data for blobs (OID = 16697) (LIMIT 0,3)
--
INSERT INTO customer_type (id, "type", created_at, updated_at) VALUES (1, 'Owner', '12/13/2013 7:28:48 PM', '12/13/2013 7:28:48 PM');
INSERT INTO customer_type (id, "type", created_at, updated_at) VALUES (2, 'Purchaser', '12/13/2013 7:29:01 PM', '12/13/2013 7:29:01 PM');
INSERT INTO customer_type (id, "type", created_at, updated_at) VALUES (3, 'Tenant', '12/13/2013 7:29:13 PM', '12/13/2013 7:29:13 PM');
COMMIT;
--
-- Data for blobs (OID = 16706) (LIMIT 0,2)
--
INSERT INTO employees (id, first_name, last_name, address, city, state, zip, phone, is_active, is_admin, created_at, updated_at) VALUES (2, 'Niket', 'Anand', '3916 212th PL SE', 'Bothell', 'WA', '98021', '4253192176', true, true, '12/13/2013 7:30:19 PM', '12/13/2013 7:30:19 PM');
INSERT INTO employees (id, first_name, last_name, address, city, state, zip, phone, is_active, is_admin, created_at, updated_at) VALUES (1, 'Rob', 'Welsin', 'ddd', '', '', '44444', '4444444444', true, true, '12/13/2013 7:30:05 PM', '1/11/2014 8:25:00 PM');
COMMIT;
--
-- Data for blobs (OID = 16714) (LIMIT 0,1)
--
INSERT INTO estimate_types (id, estimate_type, default_overhead, created_at, updated_at) VALUES (1, 'Commercial', '25.00%', '12/13/2013 7:33:43 PM', '12/13/2013 7:33:43 PM');
COMMIT;
--
-- Data for blobs (OID = 16722) (LIMIT 0,3)
--
INSERT INTO item_codes (id, item_code, item_name, material_cost, created_at, updated_at, uom_id) VALUES (2, 'FLSH1', 'Drip Edge', 10.12, '12/13/2013 7:33:34 PM', '12/30/2013 2:18:12 AM', 1);
INSERT INTO item_codes (id, item_code, item_name, material_cost, created_at, updated_at, uom_id) VALUES (3, 'BTS1', 'BOOTS 1 1-2"', 5.2, '12/20/2013 12:16:59 AM', '12/30/2013 2:18:27 AM', 2);
INSERT INTO item_codes (id, item_code, item_name, material_cost, created_at, updated_at, uom_id) VALUES (4, 'FSTNR8', 'Deck Nails #8 RS 4500/Box', 10, '1/3/2014 7:26:01 AM', '1/3/2014 7:26:01 AM', 3);
COMMIT;
--
-- Data for blobs (OID = 16730) (LIMIT 0,14)
--
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (37, 12, 1, 6, 1, NULL, NULL, 0.06, '1/11/2014 5:14:43 PM', '1/12/2014 6:35:23 PM', 0.06);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (39, 12, 2, 9, 1, NULL, NULL, 0.5, '1/11/2014 5:15:22 PM', '1/12/2014 6:35:25 PM', 0.5);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (38, 12, 3, 7, 1, NULL, NULL, 25.85, '1/11/2014 5:14:43 PM', '1/12/2014 6:35:26 PM', 25.85);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (19, 9, NULL, 6, 1, NULL, NULL, 108.67, '1/11/2014 5:26:00 AM', '1/11/2014 5:26:00 AM', 108.67);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (20, 9, NULL, 7, 1, NULL, NULL, 25.85, '1/11/2014 5:26:00 AM', '1/11/2014 5:26:00 AM', 25.85);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (21, 10, NULL, 5, 10, NULL, NULL, 106.63, '1/11/2014 5:28:48 AM', '1/11/2014 5:43:27 AM', 1066.3);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (22, 10, NULL, 6, 1, NULL, NULL, 108.67, '1/11/2014 5:59:04 AM', '1/11/2014 5:59:04 AM', 108.67);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (33, 7, NULL, 5, 1, NULL, NULL, 106.63, '1/11/2014 7:01:32 AM', '1/11/2014 7:01:32 AM', 106.63);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (34, 7, NULL, 6, 1, NULL, NULL, 108.67, '1/11/2014 7:01:46 AM', '1/11/2014 7:01:46 AM', 108.67);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (35, 7, NULL, 7, 1, NULL, NULL, 25.85, '1/11/2014 7:01:46 AM', '1/11/2014 7:01:46 AM', 25.85);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (36, 11, 3, 7, 5, NULL, NULL, 25.85, '1/11/2014 8:47:19 AM', '1/12/2014 3:39:36 AM', 129.25);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (40, 11, 1, 6, 10, NULL, NULL, 0.06, '1/12/2014 9:13:55 AM', '1/12/2014 9:28:34 AM', 0.6);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (41, 11, 2, 9, 20, NULL, NULL, 0.5, '1/12/2014 9:13:56 AM', '1/12/2014 9:28:41 AM', 10);
INSERT INTO job_estimate_items (id, job_estimate_id, step, master_item_id, qty, proposal_desc, warranty_desc, retail_price, created_at, updated_at, item_extended) VALUES (42, 11, 3, 5, 2, NULL, NULL, 106.63, '1/12/2014 9:15:07 AM', '1/12/2014 9:28:47 AM', 213.26);
COMMIT;
--
-- Data for blobs (OID = 16740) (LIMIT 0,12)
--
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (137, 1, 1);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (138, 1, 2);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (139, 1, 3);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (140, 1, 4);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (141, 2, 1);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (105, 6, 1);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (106, 6, 2);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (107, 6, 3);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (108, 6, 4);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (166, 8, 1);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (167, 8, 2);
INSERT INTO job_service_types (id, job_id, service_type_id) VALUES (168, 8, 3);
COMMIT;
--
-- Data for blobs (OID = 16750) (LIMIT 0,17)
--
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (1, 1, 'NIket', '33322', '111', '22', '333', '44', '22', '3916 212th PL SE', 'www', 'Bothell', 'WA', '98021', 1, 47.7623204, -122.2054035, '1/30/2014', 2, '2', 1, 1, 2, 2, 1, 1, '44', '4', 'Check', '1/28/2014', '3', 'eeee dddd dddd aaaa wwww aaaa fffff qqqq  aaddd qwww qqqq qqqq qwww wwww qqq qwww qqq qwwww dde ee wwwaa dddddf ffff', 1, '1/29/2014', '12/13/2013 7:35:32 PM', '1/6/2014 8:26:09 AM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (4, 3, 'AAAA', '', '', '', '', '', '', '', '', '', '', '', 0, 37.09024, -95.712891, NULL, 5, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '12/28/2013 8:28:44 PM', '1/6/2014 3:38:05 PM', true);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (5, 5, 'AAAA', '', '', '', '', '', '', '', '', '', '', '', 0, 37.09024, -95.712891, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '12/31/2013 4:33:54 PM', '1/6/2014 3:39:28 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (3, 3, 'KKK', '', '', '', '', '', '', '20415 Bothell Everett Hwy', '', 'Bothell', 'WA', '98012', 1, 47.8123998, -122.2070275, NULL, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '12/28/2013 8:27:41 PM', '12/28/2013 8:27:41 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (7, 7, 'WEW', '4253192176', '2233222333', '244', '4253192176', '', '', '3916 212th PL SE', '', 'Bothell', 'Washington', '98021', 1, 47.804848, -122.18037, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '1/7/2014 11:45:15 AM', '1/7/2014 11:45:15 AM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (9, 9, 'FF', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', 1, 47.5733208, -122.1701399, '1/24/2014', 1, '1', 1, 2, 2, NULL, NULL, NULL, '', '0', '', NULL, 'eee', 'www', NULL, NULL, '1/11/2014 4:27:19 PM', '1/11/2014 4:27:19 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (10, 9, 'FF', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', 1, 47.5733208, -122.1701399, '1/24/2014', 1, '1', 1, 2, 2, NULL, NULL, NULL, '', '0', '', NULL, 'eee', 'www', NULL, NULL, '1/11/2014 4:34:16 PM', '1/11/2014 4:34:16 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (11, 9, 'FF', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', 1, 47.5733208, -122.1701399, '1/24/2014', 1, '1', 1, 2, 2, NULL, NULL, NULL, '', '0', '', NULL, 'eee', 'www', NULL, NULL, '1/11/2014 4:35:30 PM', '1/11/2014 4:35:30 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (12, 9, 'FF', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', 1, 47.5733208, -122.1701399, '1/24/2014', 1, '1', 1, 2, 2, NULL, NULL, NULL, '', '0', '', NULL, 'eee', 'www', NULL, NULL, '1/11/2014 4:38:45 PM', '1/11/2014 4:38:45 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (6, 1, 'Saket', '4253192176', '4253192176', '', '4253192176', '', 'solutionsiq.com', '3916 212th PL SE', '', 'Bothell', 'Washington', '98021', 1, 47.804848, -122.18037, NULL, 1, '3', 1, 3, 1, 2, 1, 1, '22', '33', '22', NULL, 'this is job notes', 'this is lead sheet note', 1, NULL, '1/6/2014 7:51:08 AM', '1/6/2014 8:00:54 AM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (14, 9, 'DDD', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', 1, 47.5733208, -122.1701399, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '1/11/2014 4:47:13 PM', '1/11/2014 4:47:13 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (15, 9, 'ss', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', 'Bellevue', 'WA', '98006', 1, 47.5733208, -122.1701399, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '1/11/2014 4:48:02 PM', '1/11/2014 4:48:02 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (2, 1, 'AAAA', '2222222222', '2222222222', '', '2222222222', '(222) 222-2222', '', '3916 212th PL SE', '', 'Bothell', 'WA', '98021', 1, 47.804848, -122.18037, NULL, 5, '2', 1, 2, 1, 2, 1, 1, '', '', '', NULL, '', '', NULL, NULL, '12/26/2013 3:19:16 AM', '1/11/2014 8:29:57 PM', true);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (16, 12, 'www', '2222222222', '', '', '', '', '', '22222', '', '', '', '22222', 1, 37.9589134, -77.4893478, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '1/11/2014 8:39:34 PM', '1/11/2014 8:39:34 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (17, 4, 'www', '', '', '', '', '', '', '2222', '', '', '', '22222', 1, 40.910568, -81.37892, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '1/11/2014 8:59:22 PM', '1/11/2014 8:59:22 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (18, 13, 'EEEE', '2222222222', '', '', '', '', '', '4rr', '', '', '', '44444', 1, 38.3281727, -106.9516862, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', '', NULL, NULL, '1/11/2014 9:39:50 PM', '1/11/2014 9:39:50 PM', false);
INSERT INTO job_site (id, customer_id, contact_name, phone, work_phone, work_phone_ext, mobile_phone, fax, website, street1, street2, city, state, zip, is_active, latitude, longitude, job_start_date, job_status_id, how_many_stories, existing_roof_type_id, new_roof_type_id, product_type_id, product_color_id, sales_rep_id, estimate_type_id, contract_price, deposit_due, deposit_method, date_completed, job_notes, lead_sheet_note, info_taken_by_id, date_taken, created_at, updated_at, is_closed) VALUES (8, 5, 'Anna', '', '', '', '', '', '', '4055 Factoria Square Mall SE', '', '', '', '98006', 1, 47.5733208, -122.1701399, '1/31/2014', NULL, '2', 1, NULL, NULL, NULL, 1, NULL, '', '', '', '1/31/2014', '', 'wwwwwwdddd dddddddddddddddddddd ddddddddddddddddd ddddddddddddddddddd ddddddddddddddd', 2, '1/31/2014', '1/11/2014 2:54:25 PM', '1/12/2014 1:50:12 AM', false);
COMMIT;
--
-- Data for blobs (OID = 16772) (LIMIT 0,6)
--
INSERT INTO job_statuses (id, status, created_at, updated_at, is_job_closed) VALUES (1, 'Active', '12/13/2013 7:30:52 PM', '12/13/2013 7:30:52 PM', false);
INSERT INTO job_statuses (id, status, created_at, updated_at, is_job_closed) VALUES (2, 'Pending', '12/13/2013 7:31:02 PM', '12/13/2013 7:31:02 PM', false);
INSERT INTO job_statuses (id, status, created_at, updated_at, is_job_closed) VALUES (4, 'Sold', '12/28/2013 4:58:11 PM', '12/28/2013 4:58:11 PM', true);
INSERT INTO job_statuses (id, status, created_at, updated_at, is_job_closed) VALUES (5, 'Completed', '12/28/2013 4:59:53 PM', '12/28/2013 4:59:53 PM', true);
INSERT INTO job_statuses (id, status, created_at, updated_at, is_job_closed) VALUES (3, 'Finished', '12/13/2013 7:31:12 PM', '12/28/2013 5:00:20 PM', true);
INSERT INTO job_statuses (id, status, created_at, updated_at, is_job_closed) VALUES (6, 'Proposal Given', '12/28/2013 5:02:47 PM', '12/28/2013 5:02:47 PM', false);
COMMIT;
--
-- Data for blobs (OID = 16780) (LIMIT 0,2)
--
INSERT INTO lead_source (id, source, created_at, updated_at) VALUES (1, 'Google', '12/13/2013 7:29:31 PM', '12/13/2013 7:29:31 PM');
INSERT INTO lead_source (id, source, created_at, updated_at) VALUES (2, 'Paper ad', '12/13/2013 7:29:43 PM', '12/13/2013 7:29:43 PM');
COMMIT;
--
-- Data for blobs (OID = 16789) (LIMIT 0,2)
--
INSERT INTO product_colors (id, product_color, created_at, updated_at) VALUES (2, 'Bronze', '12/13/2013 7:33:05 PM', '12/13/2013 7:33:05 PM');
INSERT INTO product_colors (id, product_color, created_at, updated_at) VALUES (3, 'Brown', '1/2/2014 3:04:20 AM', '1/2/2014 3:04:41 AM');
COMMIT;
--
-- Data for blobs (OID = 16797) (LIMIT 0,2)
--
INSERT INTO product_types (id, product_type, created_at, updated_at) VALUES (1, 'APP', '12/13/2013 7:32:34 PM', '12/13/2013 7:32:34 PM');
INSERT INTO product_types (id, product_type, created_at, updated_at) VALUES (2, 'CDX4Ply', '12/13/2013 7:32:43 PM', '12/13/2013 7:32:43 PM');
COMMIT;
--
-- Data for blobs (OID = 16805) (LIMIT 0,5)
--
INSERT INTO roof_types (id, roof_type, created_at, updated_at) VALUES (1, 'Asphalt Shingle', '12/13/2013 7:32:09 PM', '12/13/2013 7:32:09 PM');
INSERT INTO roof_types (id, roof_type, created_at, updated_at) VALUES (2, 'Cement Tile', '12/13/2013 7:32:22 PM', '12/13/2013 7:32:22 PM');
INSERT INTO roof_types (id, roof_type, created_at, updated_at) VALUES (3, 'abcd eeee', '1/6/2014 7:12:00 AM', '1/6/2014 7:12:00 AM');
INSERT INTO roof_types (id, roof_type, created_at, updated_at) VALUES (4, 'efghed olodddd', '1/6/2014 7:12:24 AM', '1/6/2014 7:12:24 AM');
INSERT INTO roof_types (id, roof_type, created_at, updated_at) VALUES (5, 'kkkkee eeeew', '1/6/2014 7:12:49 AM', '1/6/2014 7:12:49 AM');
COMMIT;
--
-- Data for blobs (OID = 16813) (LIMIT 0,4)
--
INSERT INTO service_types (id, service_type, created_at, updated_at) VALUES (1, 'Clean Roof', '12/13/2013 7:31:35 PM', '12/13/2013 7:31:35 PM');
INSERT INTO service_types (id, service_type, created_at, updated_at) VALUES (2, 'Coat roof', '12/13/2013 7:31:50 PM', '12/13/2013 7:31:50 PM');
INSERT INTO service_types (id, service_type, created_at, updated_at) VALUES (3, 'Remove roof', '1/6/2014 7:05:53 AM', '1/6/2014 7:05:53 AM');
INSERT INTO service_types (id, service_type, created_at, updated_at) VALUES (4, 'Fix roof', '1/6/2014 7:06:15 AM', '1/6/2014 7:06:15 AM');
COMMIT;
--
-- Data for blobs (OID = 16822) (LIMIT 0,2)
--
INSERT INTO task_types (id, task_type, created_at, updated_at) VALUES (1, 'Install', '12/15/2013 3:45:38 PM', '12/15/2013 3:45:38 PM');
INSERT INTO task_types (id, task_type, created_at, updated_at) VALUES (2, 'Remove', '12/15/2013 3:45:53 PM', '12/15/2013 3:45:53 PM');
COMMIT;
--
-- Data for blobs (OID = 16830) (LIMIT 0,2)
--
INSERT INTO contact_types (id, contact_type, created_at, updated_at) VALUES (3, 'Contractor', '12/19/2013 11:34:52 PM', '12/19/2013 11:34:52 PM');
INSERT INTO contact_types (id, contact_type, created_at, updated_at) VALUES (4, 'Owner', '12/19/2013 11:35:14 PM', '12/19/2013 11:35:14 PM');
COMMIT;
--
-- Data for blobs (OID = 16838) (LIMIT 0,3)
--
INSERT INTO job_call_notes (id, job_site_id, call_notes, employee_id, created_at, updated_at, call_time, call_date) VALUES (13, 1, 'CCC', 2, '12/16/2013 5:57:46 AM', '12/16/2013 5:58:05 AM', '9:58 PM', '12/29/2013');
INSERT INTO job_call_notes (id, job_site_id, call_notes, employee_id, created_at, updated_at, call_time, call_date) VALUES (12, 1, 'AAA', 1, '12/16/2013 5:57:30 AM', '12/16/2013 6:04:22 AM', '9:57 PM', NULL);
INSERT INTO job_call_notes (id, job_site_id, call_notes, employee_id, created_at, updated_at, call_time, call_date) VALUES (14, 1, 'ddddd', NULL, '1/11/2014 10:40:00 PM', '1/11/2014 10:40:00 PM', '14:38', '1/11/2014');
COMMIT;
--
-- Data for blobs (OID = 16846) (LIMIT 0,3)
--
INSERT INTO job_tasks (id, job_site_id, task_type_id, task_note, target_date, entered_by_id, date_completed, completed_by_id, created_at, updated_at) VALUES (8, 1, 1, '', '12/26/2013', 2, '12/31/2013', 1, '12/16/2013 6:00:24 AM', '12/16/2013 6:00:24 AM');
INSERT INTO job_tasks (id, job_site_id, task_type_id, task_note, target_date, entered_by_id, date_completed, completed_by_id, created_at, updated_at) VALUES (9, 1, 2, '', NULL, 2, NULL, 1, '12/16/2013 6:00:46 AM', '12/16/2013 6:02:59 AM');
INSERT INTO job_tasks (id, job_site_id, task_type_id, task_note, target_date, entered_by_id, date_completed, completed_by_id, created_at, updated_at) VALUES (10, 2, NULL, '', '12/23/2013', NULL, '12/27/2013', NULL, '12/26/2013 3:31:58 AM', '12/26/2013 3:31:58 AM');
COMMIT;
--
-- Data for blobs (OID = 16854) (LIMIT 0,1)
--
INSERT INTO job_change_orders (id, job_site_id, co_number, co_total, notes, created_at, updated_at) VALUES (1, 1, 'ss', 's', 's', '12/15/2013 8:43:04 PM', '12/15/2013 8:43:04 PM');
COMMIT;
--
-- Data for blobs (OID = 16865) (LIMIT 0,2)
--
INSERT INTO job_contacts (id, job_site_id, first_name, last_name, contact_type_id, contact_phone, contact_email, contact_notes, created_at, updated_at) VALUES (2, 1, 'Niket', 'Anand', 3, '4253192176', 'niketanand@gmail.com', '', '12/19/2013 11:38:20 PM', '12/19/2013 11:38:20 PM');
INSERT INTO job_contacts (id, job_site_id, first_name, last_name, contact_type_id, contact_phone, contact_email, contact_notes, created_at, updated_at) VALUES (3, 1, '3333', '3333', NULL, '4444444444', '', '', '1/11/2014 8:26:44 PM', '1/11/2014 8:26:44 PM');
COMMIT;
--
-- Data for blobs (OID = 16876) (LIMIT 0,3)
--
INSERT INTO job_documents (id, job_site_id, doc_name, doc_desc, doc_link, created_at, updated_at) VALUES (2, 1, 'BBB', 'sss', 'http://www.yahoo.com', '12/16/2013 4:30:33 AM', '12/16/2013 4:30:33 AM');
INSERT INTO job_documents (id, job_site_id, doc_name, doc_desc, doc_link, created_at, updated_at) VALUES (3, 18, 'text file', 'dddd', 'C:\\tmobile\\doc\\PR206372 - JUMP3C - EIP IA - v1.0.docx', '1/11/2014 10:10:19 PM', '1/11/2014 10:10:19 PM');
INSERT INTO job_documents (id, job_site_id, doc_name, doc_desc, doc_link, created_at, updated_at) VALUES (4, 18, 'rrrrrr', 'eeee', 'http://www.google.com', '1/11/2014 10:11:04 PM', '1/11/2014 10:11:04 PM');
COMMIT;
--
-- Data for blobs (OID = 16953) (LIMIT 0,5)
--
INSERT INTO assemblies (id, master_item, build_date, item_description, warranty_description, wo_description, proposal_description, total_material, tax_rate_percentage, total_tax, total_labor, total_cost, markup_operator_percentage, total_price, created_at, updated_at, uom_id, total_material_cost) VALUES (5, 'ABC', '1/31/2014', 'Test Assembly ddd ddssss aaaaaa dddddddddddd  aaaaaaas ssssssssss fffffffffffffffffffq aaaaaaaaaaaaaaaa ddddddddddw', 'Test warranty', 'Test desc', 'Test proposal', 25.32, 6.5, 1.52, 38, 62.82, 0.6, 106.63, '1/3/2014 7:33:01 AM', '1/6/2014 9:53:23 AM', 2, 26.23);
INSERT INTO assemblies (id, master_item, build_date, item_description, warranty_description, wo_description, proposal_description, total_material, tax_rate_percentage, total_tax, total_labor, total_cost, markup_operator_percentage, total_price, created_at, updated_at, uom_id, total_material_cost) VALUES (7, '22222', '1/14/2014', '2222-222', '', '', '', 5.2, 5.96, 0.31, 10, 15.51, 0.6, 25.85, '1/9/2014 3:02:42 PM', '1/9/2014 3:03:18 PM', 2, 5.2);
INSERT INTO assemblies (id, master_item, build_date, item_description, warranty_description, wo_description, proposal_description, total_material, tax_rate_percentage, total_tax, total_labor, total_cost, markup_operator_percentage, total_price, created_at, updated_at, uom_id, total_material_cost) VALUES (6, '111111', '1/14/2014', '111-1111', '', '', '', 5.2, 5.96, 0.31, 0, 5.51, 10, 0.06, '1/9/2014 3:02:12 PM', '1/11/2014 9:01:54 AM', 2, 5.2);
INSERT INTO assemblies (id, master_item, build_date, item_description, warranty_description, wo_description, proposal_description, total_material, tax_rate_percentage, total_tax, total_labor, total_cost, markup_operator_percentage, total_price, created_at, updated_at, uom_id, total_material_cost) VALUES (8, 'XXX', '1/28/2014', 'XXXXX', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1/11/2014 9:33:31 AM', '1/11/2014 9:33:31 AM', 1, NULL);
INSERT INTO assemblies (id, master_item, build_date, item_description, warranty_description, wo_description, proposal_description, total_material, tax_rate_percentage, total_tax, total_labor, total_cost, markup_operator_percentage, total_price, created_at, updated_at, uom_id, total_material_cost) VALUES (9, 'KKKF', '1/19/2014', 'dddf', '', '', 'dd', 20.12, 10, 2.01, 27, 49.13, 2, 0.5, '1/11/2014 9:38:51 AM', '1/11/2014 9:50:52 AM', 2, 21.12);
COMMIT;
--
-- Data for blobs (OID = 17082) (LIMIT 0,3)
--
INSERT INTO unit_of_measurements (id, unit, created_at, updated_at) VALUES (1, '5 GAL', '12/26/2013 3:27:54 PM', '12/26/2013 3:27:54 PM');
INSERT INTO unit_of_measurements (id, unit, created_at, updated_at) VALUES (2, 'BAG', '12/26/2013 3:28:10 PM', '12/26/2013 3:28:10 PM');
INSERT INTO unit_of_measurements (id, unit, created_at, updated_at) VALUES (3, 'EA', '12/30/2013 2:19:13 AM', '12/30/2013 2:19:13 AM');
COMMIT;
--
-- Data for blobs (OID = 25320) (LIMIT 0,7)
--
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (25, 4, 10, 10, 100, 10, '1/4/2014 2:03:58 AM', '1/4/2014 2:03:58 AM', 5, 29.43, '1/27/2014', 0.7, true, false, 6, 0.6, 20.6, 10.6);
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (24, 3, 15, 5.2, 100, 5.2, '1/4/2014 1:58:15 AM', '1/4/2014 2:51:45 AM', 5, 41.02, '1/27/2014', 0.5, true, false, 5.96, 0.31, 20.51, 5.51);
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (22, 2, 13, 10.12, 80, 8.1, '1/4/2014 1:35:35 AM', '1/4/2014 3:09:55 AM', 5, 36.18, '1/27/2014', 0.6, true, false, 7.53, 0.61, 21.71, 8.71);
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (26, 3, 10, 5.2, 100, 5.2, '1/9/2014 3:03:18 PM', '1/9/2014 3:03:18 PM', 7, 25.85, '1/14/2014', 0.6, true, false, 5.96, 0.31, 15.51, 5.51);
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (30, 3, NULL, 5.2, 100, 5.2, '1/11/2014 9:01:54 AM', '1/11/2014 9:01:54 AM', 6, 0.06, '1/14/2014', 10, false, false, 5.96, 0.31, 5.51, 5.51);
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (31, 4, 23, 10, 100, 10, '1/11/2014 9:42:01 AM', '1/11/2014 9:42:01 AM', 9, 0.34, NULL, 1, false, false, 10, 1, 34, 11);
INSERT INTO assembly_items (id, item_code_id, labor_cost, material_cost, percentage_used, material_cost_ext, created_at, updated_at, assembly_id, item_price, build_date, markup_operator_percentage, is_po, is_wo, material_tax_percentage, material_tax_cost, total_cost, total_material_cost) VALUES (32, 2, 4, 10.12, 100, 10.12, '1/11/2014 9:50:52 AM', '1/11/2014 9:50:52 AM', 9, 0.16, NULL, 3, false, false, 10, 1.01, 15.13, 11.13);
COMMIT;
--
-- Data for blobs (OID = 25460) (LIMIT 0,6)
--
INSERT INTO companies (id, name, address, city, state, zip, main_phone, fax_number, main_email, website, license, created_at, updated_at) VALUES (2, 'King2', '4055 Factoria Square Mall SE', 'Bellevue', 'WA', '98006', '', '', '', 'http://roof.com', 'AWWDDD', '1/4/2014 10:45:01 PM', '1/4/2014 10:45:01 PM');
INSERT INTO companies (id, name, address, city, state, zip, main_phone, fax_number, main_email, website, license, created_at, updated_at) VALUES (3, 'sss', 'sddd', 'ddd', 'aa', '22222-2227', '3334442332', '', '222@ddd.comss', '', '', '1/7/2014 8:09:15 AM', '1/7/2014 11:17:41 AM');
INSERT INTO companies (id, name, address, city, state, zip, main_phone, fax_number, main_email, website, license, created_at, updated_at) VALUES (1, 'King roof', '3916 212th PL SE', 'Bothell', 'Washington', '98021', '4253192176', '2223333443', 'niketanand@gmail.com', 'http://kingroof.com', '1234ANSC333', '1/3/2014 8:18:50 PM', '1/11/2014 8:43:03 AM');
INSERT INTO companies (id, name, address, city, state, zip, main_phone, fax_number, main_email, website, license, created_at, updated_at) VALUES (4, 'Nike', '3916 212th PL SE', 'Bothell', 'Washington', '98021', '', '', '', '', '', '1/11/2014 5:57:24 PM', '1/11/2014 5:57:24 PM');
INSERT INTO companies (id, name, address, city, state, zip, main_phone, fax_number, main_email, website, license, created_at, updated_at) VALUES (5, 'Nike', '3916 212th PL SE', 'Bothell', 'Washington', '98021', '4444444444', '(222) 222-2222', '', '', '', '1/11/2014 8:18:44 PM', '1/11/2014 8:19:18 PM');
INSERT INTO companies (id, name, address, city, state, zip, main_phone, fax_number, main_email, website, license, created_at, updated_at) VALUES (6, 'SIQ', '3916 212th PL SE', 'Bothell', 'Washington', '98021', '4253192176', '', 'niketanand@gmail.com', '', '', '1/11/2014 9:38:24 PM', '1/11/2014 9:38:24 PM');
COMMIT;
--
-- Data for blobs (OID = 25489) (LIMIT 0,2)
--
INSERT INTO assets (id, asset_file_name, asset_content_type, asset_file_size, asset_updated_at, job_site_id, created_at, updated_at) VALUES (140, 'DSC_0005.JPG', 'image/jpeg', 3551873, '1/5/2014 10:56:04 PM', 2, '1/5/2014 10:56:07 PM', '1/5/2014 10:56:07 PM');
INSERT INTO assets (id, asset_file_name, asset_content_type, asset_file_size, asset_updated_at, job_site_id, created_at, updated_at) VALUES (141, 'DSC_0001.JPG', 'image/jpeg', 3497528, '1/5/2014 11:03:08 PM', 2, '1/5/2014 11:03:11 PM', '1/5/2014 11:03:11 PM');
COMMIT;
--
-- Data for blobs (OID = 25516) (LIMIT 0,3)
--
INSERT INTO job_estimate_statuses (id, status, created_at, updated_at) VALUES (1, 'Pending Approval', '1/8/2014 6:29:07 AM', '1/8/2014 6:29:07 AM');
INSERT INTO job_estimate_statuses (id, status, created_at, updated_at) VALUES (2, 'Declined', '1/8/2014 6:29:57 AM', '1/8/2014 6:29:57 AM');
INSERT INTO job_estimate_statuses (id, status, created_at, updated_at) VALUES (3, 'Accepted', '1/8/2014 6:30:21 AM', '1/8/2014 6:30:21 AM');
COMMIT;
--
-- Data for blobs (OID = 25526) (LIMIT 0,5)
--
INSERT INTO job_estimates (id, name, total_item_price, price_adjustment, reason_desc, estimate_status_id, created_at, updated_at, job_site_id) VALUES (9, '01102014212544_1_Estimate', 134.52, NULL, NULL, NULL, '1/11/2014 5:26:00 AM', '1/11/2014 5:26:00 AM', 1);
INSERT INTO job_estimates (id, name, total_item_price, price_adjustment, reason_desc, estimate_status_id, created_at, updated_at, job_site_id) VALUES (10, '01102014212836_1_Estimate', 1174.97, NULL, NULL, 1, '1/11/2014 5:28:48 AM', '1/11/2014 6:26:28 AM', 1);
INSERT INTO job_estimates (id, name, total_item_price, price_adjustment, reason_desc, estimate_status_id, created_at, updated_at, job_site_id) VALUES (7, '01102014005311_1_Estimate', 241.15, 223, 'sssss', 2, '1/10/2014 8:53:25 AM', '1/11/2014 7:01:46 AM', 1);
INSERT INTO job_estimates (id, name, total_item_price, price_adjustment, reason_desc, estimate_status_id, created_at, updated_at, job_site_id) VALUES (12, '01112014091223_8_Estimate', 26.41, NULL, '', NULL, '1/11/2014 5:12:31 PM', '1/11/2014 5:15:22 PM', 8);
INSERT INTO job_estimates (id, name, total_item_price, price_adjustment, reason_desc, estimate_status_id, created_at, updated_at, job_site_id) VALUES (11, '01112014004657_1_Estimate', 353.11, NULL, '', NULL, '1/11/2014 8:47:19 AM', '1/12/2014 9:28:58 AM', 1);
COMMIT;
--
-- Data for blobs (OID = 25557) (LIMIT 0,1)
--
INSERT INTO sales_taxes (id, created_at, updated_at, sales_tax) VALUES (1, '1/11/2014 9:28:42 AM', '1/11/2014 9:30:54 AM', 10);
COMMIT;
--
-- Data for blobs (OID = 25642) (LIMIT 0,2)
--
INSERT INTO job_roof_types (id, job_id, new_roof_type_id) VALUES (15, 8, 4);
INSERT INTO job_roof_types (id, job_id, new_roof_type_id) VALUES (16, 8, 5);
COMMIT;
-- Definition for index unique_schema_migrations (OID = 16404):
CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);
-- Definition for index fk_cust_company_idx (OID = 16691):
CREATE INDEX fk_cust_company_idx ON customer USING btree (company_id);
-- Definition for index fk_cust_lead_source_idx (OID = 16692):
CREATE INDEX fk_cust_lead_source_idx ON customer USING btree (lead_source_id);
-- Definition for index fk_sales_idx (OID = 16693):
CREATE INDEX fk_sales_idx ON customer USING btree (sales_person_id);
-- Definition for index fk_cust_type_idx (OID = 16694):
CREATE INDEX fk_cust_type_idx ON customer USING btree (type);
-- Definition for index type_UNIQUE (OID = 16703):
CREATE UNIQUE INDEX "type_UNIQUE" ON customer_type USING btree (type);
-- Definition for index fk_master_item_id_idx (OID = 16737):
CREATE INDEX fk_master_item_id_idx ON job_estimate_items USING btree (master_item_id);
-- Definition for index fk_job_site_id_idx (OID = 16746):
CREATE INDEX fk_job_site_id_idx ON job_service_types USING btree (job_id);
-- Definition for index fk_serv_type_idx (OID = 16747):
CREATE INDEX fk_serv_type_idx ON job_service_types USING btree (service_type_id);
-- Definition for index fk_job_customer_idx (OID = 16761):
CREATE INDEX fk_job_customer_idx ON job_site USING btree (customer_id);
-- Definition for index fk_estimate_type_idx (OID = 16762):
CREATE INDEX fk_estimate_type_idx ON job_site USING btree (estimate_type_id);
-- Definition for index fk_exist_roof_type_idx (OID = 16763):
CREATE INDEX fk_exist_roof_type_idx ON job_site USING btree (existing_roof_type_id);
-- Definition for index fk_info_taken_by_idx (OID = 16764):
CREATE INDEX fk_info_taken_by_idx ON job_site USING btree (info_taken_by_id);
-- Definition for index fk_status_idx (OID = 16765):
CREATE INDEX fk_status_idx ON job_site USING btree (job_status_id);
-- Definition for index fk_new_roof_type_idx (OID = 16766):
CREATE INDEX fk_new_roof_type_idx ON job_site USING btree (new_roof_type_id);
-- Definition for index fk_product_color_idx (OID = 16767):
CREATE INDEX fk_product_color_idx ON job_site USING btree (product_color_id);
-- Definition for index fk_product_type (OID = 16768):
CREATE INDEX fk_product_type ON job_site USING btree (product_type_id);
-- Definition for index fk_sales_rep_idx (OID = 16769):
CREATE INDEX fk_sales_rep_idx ON job_site USING btree (sales_rep_id);
-- Definition for index source_UNIQUE (OID = 16786):
CREATE UNIQUE INDEX "source_UNIQUE" ON lead_source USING btree (source);
-- Definition for index fk_job_site_id_idx01 (OID = 25658):
CREATE INDEX fk_job_site_id_idx01 ON job_roof_types USING btree (job_id);
-- Definition for index fk_roof_type_idx01 (OID = 25659):
CREATE INDEX fk_roof_type_idx01 ON job_roof_types USING btree (id);
-- Definition for index customer_pkey (OID = 16689):
ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
-- Definition for index customer_type_pkey (OID = 16701):
ALTER TABLE ONLY customer_type
    ADD CONSTRAINT customer_type_pkey PRIMARY KEY (id);
-- Definition for index employees_pkey (OID = 16710):
ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
-- Definition for index estimate_types_pkey (OID = 16718):
ALTER TABLE ONLY estimate_types
    ADD CONSTRAINT estimate_types_pkey PRIMARY KEY (id);
-- Definition for index item_codes_pkey (OID = 16726):
ALTER TABLE ONLY item_codes
    ADD CONSTRAINT item_codes_pkey PRIMARY KEY (id);
-- Definition for index job_estimates_pkey (OID = 16734):
ALTER TABLE ONLY job_estimate_items
    ADD CONSTRAINT job_estimates_pkey PRIMARY KEY (id);
-- Definition for index job_service_types_pkey (OID = 16744):
ALTER TABLE ONLY job_service_types
    ADD CONSTRAINT job_service_types_pkey PRIMARY KEY (id);
-- Definition for index job_site_pkey (OID = 16758):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT job_site_pkey PRIMARY KEY (id);
-- Definition for index job_statuses_pkey (OID = 16776):
ALTER TABLE ONLY job_statuses
    ADD CONSTRAINT job_statuses_pkey PRIMARY KEY (id);
-- Definition for index lead_source_pkey (OID = 16784):
ALTER TABLE ONLY lead_source
    ADD CONSTRAINT lead_source_pkey PRIMARY KEY (id);
-- Definition for index product_colors_pkey (OID = 16793):
ALTER TABLE ONLY product_colors
    ADD CONSTRAINT product_colors_pkey PRIMARY KEY (id);
-- Definition for index product_types_pkey (OID = 16801):
ALTER TABLE ONLY product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);
-- Definition for index roof_types_pkey (OID = 16809):
ALTER TABLE ONLY roof_types
    ADD CONSTRAINT roof_types_pkey PRIMARY KEY (id);
-- Definition for index service_types_pkey (OID = 16817):
ALTER TABLE ONLY service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);
-- Definition for index task_types_pkey (OID = 16826):
ALTER TABLE ONLY task_types
    ADD CONSTRAINT task_types_pkey PRIMARY KEY (id);
-- Definition for index contact_types_pkey (OID = 16834):
ALTER TABLE ONLY contact_types
    ADD CONSTRAINT contact_types_pkey PRIMARY KEY (id);
-- Definition for index job_call_notes_pkey (OID = 16842):
ALTER TABLE ONLY job_call_notes
    ADD CONSTRAINT job_call_notes_pkey PRIMARY KEY (id);
-- Definition for index job_tasks_pkey (OID = 16850):
ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT job_tasks_pkey PRIMARY KEY (id);
-- Definition for index job_change_orders_pkey (OID = 16861):
ALTER TABLE ONLY job_change_orders
    ADD CONSTRAINT job_change_orders_pkey PRIMARY KEY (id);
-- Definition for index job_contacts_pkey (OID = 16872):
ALTER TABLE ONLY job_contacts
    ADD CONSTRAINT job_contacts_pkey PRIMARY KEY (id);
-- Definition for index job_documents_pkey (OID = 16883):
ALTER TABLE ONLY job_documents
    ADD CONSTRAINT job_documents_pkey PRIMARY KEY (id);
-- Definition for index job_costings_pkey (OID = 16894):
ALTER TABLE ONLY job_costings
    ADD CONSTRAINT job_costings_pkey PRIMARY KEY (id);
-- Definition for index fk_job_site_call_note_id (OID = 16896):
ALTER TABLE ONLY job_call_notes
    ADD CONSTRAINT fk_job_site_call_note_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index fk_emp_call_note (OID = 16901):
ALTER TABLE ONLY job_call_notes
    ADD CONSTRAINT fk_emp_call_note FOREIGN KEY (employee_id) REFERENCES employees(id);
-- Definition for index fk_job_job_task_id (OID = 16906):
ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_job_job_task_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index fk_entered_by_emp_id (OID = 16911):
ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_entered_by_emp_id FOREIGN KEY (entered_by_id) REFERENCES employees(id);
-- Definition for index fk_job_task_task_type_id (OID = 16916):
ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_job_task_task_type_id FOREIGN KEY (task_type_id) REFERENCES task_types(id);
-- Definition for index fk_completed_by_emp_id (OID = 16921):
ALTER TABLE ONLY job_tasks
    ADD CONSTRAINT fk_completed_by_emp_id FOREIGN KEY (completed_by_id) REFERENCES employees(id);
-- Definition for index fk_job_chn_ord_job_site_id (OID = 16926):
ALTER TABLE ONLY job_change_orders
    ADD CONSTRAINT fk_job_chn_ord_job_site_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index fk_job_cont_site_id (OID = 16931):
ALTER TABLE ONLY job_contacts
    ADD CONSTRAINT fk_job_cont_site_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index fk_cont_type_contact (OID = 16936):
ALTER TABLE ONLY job_contacts
    ADD CONSTRAINT fk_cont_type_contact FOREIGN KEY (contact_type_id) REFERENCES contact_types(id);
-- Definition for index fk_site_doc_id (OID = 16941):
ALTER TABLE ONLY job_documents
    ADD CONSTRAINT fk_site_doc_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index fk_cost_site_id (OID = 16946):
ALTER TABLE ONLY job_costings
    ADD CONSTRAINT fk_cost_site_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index assemblies_pkey (OID = 16960):
ALTER TABLE ONLY assemblies
    ADD CONSTRAINT assemblies_pkey PRIMARY KEY (id);
-- Definition for index fk_cust_type_id (OID = 16990):
ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_cust_type_id FOREIGN KEY (type) REFERENCES customer_type(id);
-- Definition for index fk_lead_src_id (OID = 16995):
ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_lead_src_id FOREIGN KEY (lead_source_id) REFERENCES lead_source(id);
-- Definition for index fk_sales_person_id (OID = 17005):
ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_sales_person_id FOREIGN KEY (sales_person_id) REFERENCES employees(id);
-- Definition for index fk_cust_job_id (OID = 17015):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_cust_job_id FOREIGN KEY (customer_id) REFERENCES customer(id);
-- Definition for index fk_job_status_id (OID = 17020):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_job_status_id FOREIGN KEY (job_status_id) REFERENCES job_statuses(id);
-- Definition for index fk_ext_roof_type_id (OID = 17025):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_ext_roof_type_id FOREIGN KEY (existing_roof_type_id) REFERENCES roof_types(id);
-- Definition for index fk_new_roof_type_id (OID = 17030):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_new_roof_type_id FOREIGN KEY (new_roof_type_id) REFERENCES roof_types(id);
-- Definition for index fk_prd_type_id (OID = 17035):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_prd_type_id FOREIGN KEY (product_type_id) REFERENCES product_types(id);
-- Definition for index fk_prd_color_id (OID = 17040):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_prd_color_id FOREIGN KEY (product_color_id) REFERENCES product_colors(id);
-- Definition for index fk_sales_rep_id (OID = 17045):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_sales_rep_id FOREIGN KEY (sales_rep_id) REFERENCES employees(id);
-- Definition for index fk_est_type_id (OID = 17050):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_est_type_id FOREIGN KEY (estimate_type_id) REFERENCES estimate_types(id);
-- Definition for index fk_info_tkn_by_id (OID = 17055):
ALTER TABLE ONLY job_site
    ADD CONSTRAINT fk_info_tkn_by_id FOREIGN KEY (info_taken_by_id) REFERENCES employees(id);
-- Definition for index fk_job_job_srv_id (OID = 17065):
ALTER TABLE ONLY job_service_types
    ADD CONSTRAINT fk_job_job_srv_id FOREIGN KEY (job_id) REFERENCES job_site(id);
-- Definition for index fk_job_srv_id (OID = 17070):
ALTER TABLE ONLY job_service_types
    ADD CONSTRAINT fk_job_srv_id FOREIGN KEY (service_type_id) REFERENCES service_types(id);
-- Definition for index unit_of_measurements_pkey (OID = 17086):
ALTER TABLE ONLY unit_of_measurements
    ADD CONSTRAINT unit_of_measurements_pkey PRIMARY KEY (id);
-- Definition for index fk_uom_uom_id (OID = 25308):
ALTER TABLE ONLY item_codes
    ADD CONSTRAINT fk_uom_uom_id FOREIGN KEY (uom_id) REFERENCES unit_of_measurements(id);
-- Definition for index fk_uom_id (OID = 25313):
ALTER TABLE ONLY assemblies
    ADD CONSTRAINT fk_uom_id FOREIGN KEY (uom_id) REFERENCES unit_of_measurements(id);
-- Definition for index assembly_items_pkey (OID = 25327):
ALTER TABLE ONLY assembly_items
    ADD CONSTRAINT assembly_items_pkey PRIMARY KEY (id);
-- Definition for index fk_item_code_id (OID = 25329):
ALTER TABLE ONLY assembly_items
    ADD CONSTRAINT fk_item_code_id FOREIGN KEY (item_code_id) REFERENCES item_codes(id);
-- Definition for index fk_assembly_id (OID = 25341):
ALTER TABLE ONLY assembly_items
    ADD CONSTRAINT fk_assembly_id FOREIGN KEY (assembly_id) REFERENCES assemblies(id);
-- Definition for index fk_item_code_id (OID = 25420):
ALTER TABLE ONLY job_estimate_items
    ADD CONSTRAINT fk_item_code_id FOREIGN KEY (master_item_id) REFERENCES assemblies(id);
-- Definition for index vendors_pkey (OID = 25451):
ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);
-- Definition for index fk_sales_rep_id (OID = 25453):
ALTER TABLE ONLY vendors
    ADD CONSTRAINT fk_sales_rep_id FOREIGN KEY (sales_rep_id) REFERENCES employees(id);
-- Definition for index companies_pkey (OID = 25467):
ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
-- Definition for index fk_comp_id (OID = 25470):
ALTER TABLE ONLY customer
    ADD CONSTRAINT fk_comp_id FOREIGN KEY (company_id) REFERENCES companies(id);
-- Definition for index assets_pkey (OID = 25496):
ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);
-- Definition for index fk_asset_job_id (OID = 25498):
ALTER TABLE ONLY assets
    ADD CONSTRAINT fk_asset_job_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index job_estimate_statuses_pkey (OID = 25520):
ALTER TABLE ONLY job_estimate_statuses
    ADD CONSTRAINT job_estimate_statuses_pkey PRIMARY KEY (id);
-- Definition for index job_estimates_pkey1 (OID = 25533):
ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT job_estimates_pkey1 PRIMARY KEY (id);
-- Definition for index fk_job_job_estimate_id (OID = 25535):
ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT fk_job_job_estimate_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
-- Definition for index fk_estimates_status_id (OID = 25540):
ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT fk_estimates_status_id FOREIGN KEY (estimate_status_id) REFERENCES job_estimate_statuses(id);
-- Definition for index fk_est_job_id (OID = 25550):
ALTER TABLE ONLY job_estimate_items
    ADD CONSTRAINT fk_est_job_id FOREIGN KEY (job_estimate_id) REFERENCES job_estimates(id);
-- Definition for index sales_taxes_pkey (OID = 25561):
ALTER TABLE ONLY sales_taxes
    ADD CONSTRAINT sales_taxes_pkey PRIMARY KEY (id);
-- Definition for index job_roof_types_pkey (OID = 25646):
ALTER TABLE ONLY job_roof_types
    ADD CONSTRAINT job_roof_types_pkey PRIMARY KEY (id);
-- Definition for index fk_job_job_roof_id (OID = 25648):
ALTER TABLE ONLY job_roof_types
    ADD CONSTRAINT fk_job_job_roof_id FOREIGN KEY (job_id) REFERENCES job_site(id);
-- Definition for index fk_job_roof_id (OID = 25653):
ALTER TABLE ONLY job_roof_types
    ADD CONSTRAINT fk_job_roof_id FOREIGN KEY (new_roof_type_id) REFERENCES roof_types(id);
SET search_path = pg_catalog, pg_catalog;
COMMENT ON SCHEMA public IS 'standard public schema';
