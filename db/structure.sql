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
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    street text NOT NULL,
    number text NOT NULL,
    department text NOT NULL,
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
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name text NOT NULL,
    last_name text NOT NULL,
    phone_number text NOT NULL,
    apartment integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
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
    product_id bigint NOT NULL,
    order_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
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
    workday_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
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
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
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
-- Name: workday_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workday_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    workday_id bigint NOT NULL,
    stock integer NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
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
    updated_at timestamp(6) with time zone NOT NULL
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
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


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
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: workday_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products ALTER COLUMN id SET DEFAULT nextval('public.workday_products_id_seq'::regclass);


--
-- Name: workdays id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workdays ALTER COLUMN id SET DEFAULT nextval('public.workdays_id_seq'::regclass);


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
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_order_id ON public.order_products USING btree (order_id);


--
-- Name: index_order_products_on_order_id_and_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_order_products_on_order_id_and_product_id ON public.order_products USING btree (order_id, product_id);


--
-- Name: INDEX index_order_products_on_order_id_and_product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON INDEX public.index_order_products_on_order_id_and_product_id IS 'No order can have two of the same product';


--
-- Name: index_order_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_products_on_product_id ON public.order_products USING btree (product_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_customer_id ON public.orders USING btree (customer_id);


--
-- Name: index_orders_on_workday_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_workday_id ON public.orders USING btree (workday_id);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_name ON public.products USING btree (name);


--
-- Name: INDEX index_products_on_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON INDEX public.index_products_on_name IS 'No two products should have the same name';


--
-- Name: index_workday_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workday_products_on_product_id ON public.workday_products USING btree (product_id);


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
-- Name: workday_products fk_rails_3b52e13371; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products
    ADD CONSTRAINT fk_rails_3b52e13371 FOREIGN KEY (workday_id) REFERENCES public.workdays(id);


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
-- Name: order_products fk_rails_96c0709f78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_96c0709f78 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: workday_products fk_rails_a9b91cbfa5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workday_products
    ADD CONSTRAINT fk_rails_a9b91cbfa5 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: order_products fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210303214926');


