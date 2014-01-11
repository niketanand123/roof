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
    zip varchar(10),
    home_phone varchar(15),
    mobile_phone varchar(15),
    work_phone varchar(15),
    work_phone_ext varchar(10),
    fax varchar(15),
    website varchar(100),
    misc varchar(500),
    company_id integer,
    sales_person_id integer,
    company_name varchar(100),
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
-- Structure for table JobEstimateItems (OID = 16730):
CREATE TABLE job_estimates (
    id integer DEFAULT nextval('job_estimates_id_seq'::regclass) NOT NULL,
    job_site_id integer NOT NULL,
    step integer,
    master_item_id integer,
    qty integer,
    proposal_desc varchar(100),
    warranty_desc varchar(100),
    retail_price numeric(5,2),
    item_extended varchar(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
    city varchar(15),
    state varchar(15),
    zip varchar(10),
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
    item_description varchar(100),
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
-- Definition for index fk_est_job_site_id_idx (OID = 16736):
CREATE INDEX fk_est_job_site_id_idx ON job_estimates USING btree (job_site_id);
-- Definition for index fk_master_item_id_idx (OID = 16737):
CREATE INDEX fk_master_item_id_idx ON job_estimates USING btree (master_item_id);
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
ALTER TABLE ONLY job_estimates
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
-- Definition for index fk_est_job_id (OID = 17075):
ALTER TABLE ONLY job_estimates
    ADD CONSTRAINT fk_est_job_id FOREIGN KEY (job_site_id) REFERENCES job_site(id);
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
ALTER TABLE ONLY job_estimates
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
COMMENT ON SCHEMA public IS 'standard public schema';
