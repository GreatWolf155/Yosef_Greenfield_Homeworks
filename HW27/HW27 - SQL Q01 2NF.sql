DROP TABLE IF EXISTS orders1;

CREATE TABLE orders1 (
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	qty INTEGER,
	customer_name TEXT,
	product_name TEXT,
	unit_price REAL,
	PRIMARY KEY (order_id, product_id)
);

INSERT INTO orders1 (order_id, product_id, qty, customer_name, product_name, unit_price)
VALUES
	(1001, 42, 2, 'Alice', 'Keyboard', 49.99),
	(1001, 77, 1, 'Alice', 'Mouse', 29.99),
	(1002, 42, 1, 'Bob', 'Keyboard', 49.99);

-- 1
-- Identify which columns have partial dependencies and what they depend on.
-- customer_name : order_id
-- product_name : product_id
-- unit_price : product_id

-- 2
-- Design a 2NF-compliant schema: customers, products, orders, order_items.
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
	customer_id INTEGER PRIMARY KEY,
	customer_name TEXT NOT NULL
);

CREATE TABLE products (
	product_id INTEGER PRIMARY KEY,
	product_name TEXT NOT NULL,
	unit_price REAL
);

CREATE TABLE orders (
	order_id INTEGER PRIMARY KEY,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    qty INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 3
-- Write CREATE TABLE statements for all four tables.
-- ???
-- I just did that?

-- 4
-- Insert the data from the original table into your 2NF schema.
INSERT INTO customers (customer_id, customer_name)
VALUES
	(1, 'Alice'),
	(2, 'Bob');

INSERT INTO products (product_id, product_name, unit_price)
VALUES
	(42, 'Keyboard', 49.99),
	(77, 'Mouse', 29.99);

INSERT INTO orders (order_id, customer_id)
VALUES
	(1001, 1),
	(1002, 2);
INSERT INTO order_items (order_id, product_id, qty)
VALUES
	(1001, 42, 2),
	(1001, 77, 1),
	(1002, 42, 1);

-- 5
-- Write a query to reproduce the original table's data using JOINs.
SELECT
	oi.order_id,
	p.product_id,
	oi.qty,
	c.customer_name,
	p.product_name,
	p.unit_price
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON c.customer_id = o.customer_id;

-- BONUS
-- Bonus: rename "Keyboard" to "Mechanical Keyboard" — in the bad table vs the 2NF table. How many rows changed in each?
-- First table:
UPDATE orders1
SET product_name = 'Mechanical Keyboard'
WHERE product_id = 42;
-- 2 rows changed

-- 2NF table:
UPDATE products
SET product_name = 'Mechanical Keyboard'
WHERE product_id = 42;
-- only one row was changed