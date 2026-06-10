DROP TABLE IF EXISTS refunds;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id    INTEGER PRIMARY KEY,
  name  TEXT    NOT NULL,
  email TEXT    NOT NULL
);
INSERT INTO customers VALUES
  (1,'Alice Nevo',  'alice@mail.com'),
  (2,'Ben Cohen',   'ben@mail.com'),
  (3,'Carol Dayan', 'carol@mail.com'),
  (4,'David Katz',  'david@mail.com');

CREATE TABLE orders (
  id          INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  amount      REAL    NOT NULL,
  created_at  TEXT    NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
INSERT INTO orders VALUES
  (101,1,89.99, '2024-01-10'),
  (102,2,45.00, '2024-01-12'),
  (103,3,120.00,'2024-01-14'),
  (104,1,30.00, '2024-01-16'),
  (105,4,75.50, '2024-01-18');

CREATE TABLE refunds (
  id          INTEGER PRIMARY KEY,
  order_id    INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
  amount      REAL    NOT NULL,
  refunded_at TEXT    NOT NULL,
  FOREIGN KEY (order_id)    REFERENCES orders(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
INSERT INTO refunds VALUES
  (1,101,1,89.99, '2024-01-11'),
  (2,102,3,45.00, '2024-01-13'),
  (3,103,3,120.00,'2024-01-15'),
  (4,104,4,30.00, '2024-01-17'),
  (5,105,4,75.50, '2024-01-19');

-- Load the tables into DB Browser. Study the data.
-- Something about these refunds violates what a correct system should guarantee.
-- Find it

SELECT
	c.name AS customer,
	ref_c.name AS refunded_to,
	o.id
FROM refunds r
JOIN orders o ON r.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN customers ref_c ON r.customer_id = ref_c.id
WHERE customer <> refunded_to
ORDER BY o.id;