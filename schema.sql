CREATE USER bootstrap;
CREATE DATABASE bootstrap;
GRANT ALL PRIVILEGES ON DATABASE bootstrap TO bootstrap;

\c bootstrap;

CREATE TABLE customers (
    created timestamp without time zone DEFAULT now(),
    id SERIAL PRIMARY KEY,
    email text,
    first_name text,
    last_name text
);

ALTER TABLE customers OWNER TO "bootstrap";

CREATE TABLE orders (
    created timestamp without time zone DEFAULT now(),
    id SERIAL PRIMARY KEY,
    customer_id integer,
    amount decimal
);

ALTER TABLE orders OWNER TO "bootstrap";