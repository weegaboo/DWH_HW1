CREATE TABLE manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    category_id BIGINT CHECK (0 < category_id) REFERENCES categories(category_id),
    manufacturer_id BIGINT CHECK (0 < manufacturer_id) REFERENCES manufacturers(manufacturer_id),
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);

CREATE TABLE price_change (
    product_id BIGINT PRIMARY KEY REFERENCES products(product_id),
    price_change_ts TIMESTAMP NOT NULL,
    new_price NUMERIC(9, 1) NOT NULL
);

CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL
);

CREATE TABLE deliveries (
    store_id BIGINT CHECK (0 < store_id) REFERENCES stores(store_id),
    product_id BIGINT CHECK (0 < product_id) NOT NULL REFERENCES products(product_id),
    delivery_date DATE NOT NULL,
    product_count INTEGER CHECK (0 < product_count) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_fname VARCHAR(100) NOT NULL,
    customer_lname VARCHAR(100) NOT NULL
);

CREATE TABLE purchases (
    store_id BIGINT CHECK (0 < store_id) NOT NULL REFERENCES stores(store_id),
    customer_id BIGINT CHECK (0 < customer_id) NOT NULL REFERENCES customers(customer_id),
    purchase_id SERIAL PRIMARY KEY,
    purchase_date TIMESTAMP NOT NULL
);

CREATE TABLE purchase_items (
    product_id BIGINT CHECK (0 < product_id) NOT NULL REFERENCES products(product_id),
    purchase_id BIGINT CHECK (0 < purchase_id) NOT NULL REFERENCES purchases(purchase_id),
    product_count BIGINT CHECK (0 < product_count) NOT NULL,
    product_price NUMERIC(9, 2) NOT NULL
);