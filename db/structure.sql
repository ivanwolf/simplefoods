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

SET default_with_oids = false;

--
-- Name: account_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_types_id_seq OWNED BY public.account_types.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    street character varying NOT NULL,
    number character varying NOT NULL,
    department character varying NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE addresses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.addresses IS 'List of customers addresses';


--
-- Name: COLUMN addresses.department; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.addresses.department IS 'Dept, office or extra info';


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: banks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banks (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    last_name character varying NOT NULL,
    phone_number character varying NOT NULL,
    apartment integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    address character varying NOT NULL,
    store_id bigint NOT NULL
);


--
-- Name: TABLE customers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.customers IS 'List of clients';


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_products (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    store_id bigint NOT NULL,
    workday_product_id bigint,
    unit_price integer,
    product_id bigint,
    CONSTRAINT queantity_must_be_positive CHECK ((quantity > 0))
);


--
-- Name: TABLE order_products; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.order_products IS 'List products of an order';


--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    paid boolean DEFAULT false,
    customer_id bigint NOT NULL,
    workday_id bigint,
    delivery_comment character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    store_id bigint NOT NULL,
    paid_at timestamp with time zone,
    amount_to_pay integer
);


--
-- Name: TABLE orders; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.orders IS 'List of orders';


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phone_numbers (
    id bigint NOT NULL,
    country_code integer,
    number integer,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phone_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phone_numbers_id_seq OWNED BY public.phone_numbers.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    store_id bigint NOT NULL,
    published boolean DEFAULT true,
    discarded_at timestamp with time zone,
    has_stock boolean DEFAULT true,
    CONSTRAINT price_must_be_positive CHECK ((price > 0))
);


--
-- Name: TABLE products; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.products IS 'list of products';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    store_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE stocks; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.stocks IS 'Product sotck history';


--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    phone_number_id bigint NOT NULL,
    email character varying NOT NULL
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: transfer_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfer_data (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    bank_id bigint NOT NULL,
    account_type_id bigint NOT NULL,
    rut character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    account_number character varying NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: transfer_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transfer_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transfer_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transfer_data_id_seq OWNED BY public.transfer_data.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp with time zone,
    remember_created_at timestamp with time zone,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    store_id bigint,
    is_admin boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: workday_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workday_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    workday_id bigint NOT NULL,
    stock integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    delivery_time time without time zone,
    store_id bigint NOT NULL,
    CONSTRAINT stock_cant_be_negative CHECK ((stock >= 0))
);


--
-- Name: TABLE workday_products; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.workday_products IS 'List of products availables for a workday';


--
-- Name: workday_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workday_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workday_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workday_products_id_seq OWNED BY public.workday_products.id;


--
-- Name: workdays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workdays (
    id bigint NOT NULL,
    work_date date NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    store_id bigint NOT NULL
);


--
-- Name: TABLE workdays; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.workdays IS 'List of workdays';


--
-- Name: workdays_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workdays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workdays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workdays_id_seq OWNED BY public.workdays.id;


--
-- Name: account_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_types ALTER COLUMN id SET DEFAULT nextval('public.account_types_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: phone_numbers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone_numbers ALTER COLUMN id SET DEFAULT nextval('public.phone_numbers_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: transfer_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_data ALTER COLUMN id SET DEFAULT nextval('public.transfer_data_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workday_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products ALTER COLUMN id SET DEFAULT nextval('public.workday_products_id_seq'::regclass);


--
-- Name: workdays id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workdays ALTER COLUMN id SET DEFAULT nextval('public.workdays_id_seq'::regclass);


--
-- Name: account_types account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_types
    ADD CONSTRAINT account_types_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: phone_numbers phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone_numbers
    ADD CONSTRAINT phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: transfer_data transfer_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_data
    ADD CONSTRAINT transfer_data_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workday_products workday_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products
    ADD CONSTRAINT workday_products_pkey PRIMARY KEY (id);


--
-- Name: workdays workdays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workdays
    ADD CONSTRAINT workdays_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_customers_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_store_id ON public.customers USING btree (store_id);


--
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_order_id ON public.order_products USING btree (order_id);


--
-- Name: index_order_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_product_id ON public.order_products USING btree (product_id);


--
-- Name: index_order_products_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_store_id ON public.order_products USING btree (store_id);


--
-- Name: index_order_products_on_workday_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_workday_product_id ON public.order_products USING btree (workday_product_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_customer_id ON public.orders USING btree (customer_id);


--
-- Name: index_orders_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_store_id ON public.orders USING btree (store_id);


--
-- Name: index_orders_on_workday_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_workday_id ON public.orders USING btree (workday_id);


--
-- Name: index_products_on_discarded_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_discarded_at ON public.products USING btree (discarded_at);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_name ON public.products USING btree (name);


--
-- Name: INDEX index_products_on_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON INDEX public.index_products_on_name IS 'No two products should have the same name';


--
-- Name: index_products_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_store_id ON public.products USING btree (store_id);


--
-- Name: index_stocks_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stocks_on_product_id ON public.stocks USING btree (product_id);


--
-- Name: index_stocks_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stocks_on_store_id ON public.stocks USING btree (store_id);


--
-- Name: index_stores_on_phone_number_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stores_on_phone_number_id ON public.stores USING btree (phone_number_id);


--
-- Name: index_transfer_data_on_account_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfer_data_on_account_type_id ON public.transfer_data USING btree (account_type_id);


--
-- Name: index_transfer_data_on_bank_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfer_data_on_bank_id ON public.transfer_data USING btree (bank_id);


--
-- Name: index_transfer_data_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfer_data_on_store_id ON public.transfer_data USING btree (store_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_store_id ON public.users USING btree (store_id);


--
-- Name: index_workday_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workday_products_on_product_id ON public.workday_products USING btree (product_id);


--
-- Name: index_workday_products_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workday_products_on_store_id ON public.workday_products USING btree (store_id);


--
-- Name: index_workday_products_on_workday_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workday_products_on_workday_id ON public.workday_products USING btree (workday_id);


--
-- Name: index_workday_products_on_workday_id_and_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_workday_products_on_workday_id_and_product_id ON public.workday_products USING btree (workday_id, product_id);


--
-- Name: INDEX index_workday_products_on_workday_id_and_product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON INDEX public.index_workday_products_on_workday_id_and_product_id IS 'No order can have two of the same product';


--
-- Name: index_workdays_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workdays_on_store_id ON public.workdays USING btree (store_id);


--
-- Name: customers fk_rails_088c28e6f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_088c28e6f7 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: transfer_data fk_rails_2f1e4a90a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_data
    ADD CONSTRAINT fk_rails_2f1e4a90a1 FOREIGN KEY (account_type_id) REFERENCES public.account_types(id);


--
-- Name: workday_products fk_rails_3b52e13371; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products
    ADD CONSTRAINT fk_rails_3b52e13371 FOREIGN KEY (workday_id) REFERENCES public.workdays(id);


--
-- Name: order_products fk_rails_3c01b2d6aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_3c01b2d6aa FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: orders fk_rails_3dad120da9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_3dad120da9 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders fk_rails_4aba44d729; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_4aba44d729 FOREIGN KEY (workday_id) REFERENCES public.workdays(id);


--
-- Name: products fk_rails_5cf8ff66a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_5cf8ff66a6 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: order_products fk_rails_96c0709f78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_96c0709f78 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: workday_products fk_rails_a9b91cbfa5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products
    ADD CONSTRAINT fk_rails_a9b91cbfa5 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: transfer_data fk_rails_bef1c724ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_data
    ADD CONSTRAINT fk_rails_bef1c724ad FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: stocks fk_rails_c5d5864634; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_rails_c5d5864634 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: users fk_rails_c6f326481e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_c6f326481e FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: stocks fk_rails_cfc800c26b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_rails_cfc800c26b FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: transfer_data fk_rails_d432d11379; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfer_data
    ADD CONSTRAINT fk_rails_d432d11379 FOREIGN KEY (bank_id) REFERENCES public.banks(id);


--
-- Name: stores fk_rails_e35b0ef272; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT fk_rails_e35b0ef272 FOREIGN KEY (phone_number_id) REFERENCES public.phone_numbers(id);


--
-- Name: workday_products fk_rails_f0b0bdc7b7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products
    ADD CONSTRAINT fk_rails_f0b0bdc7b7 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: orders fk_rails_f0be2fda72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f0be2fda72 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: order_products fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: workdays fk_rails_f5c36c461e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workdays
    ADD CONSTRAINT fk_rails_f5c36c461e FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: order_products fk_rails_fd3eb80a9d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_fd3eb80a9d FOREIGN KEY (workday_product_id) REFERENCES public.workday_products(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210303214926'),
('20210305132654'),
('20210305200737'),
('20210313175321'),
('20210313225833'),
('20210315020819'),
('20210316162504'),
('20210317191119'),
('20210319162352'),
('20210322194140'),
('20210322232256'),
('20210812022125'),
('20210812052915');


