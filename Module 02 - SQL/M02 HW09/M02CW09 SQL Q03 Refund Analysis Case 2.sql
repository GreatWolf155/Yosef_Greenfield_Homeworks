DROP TABLE IF EXISTS refunds;
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  id          INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  amount      REAL    NOT NULL,
  created_at  TEXT    NOT NULL
);
INSERT INTO orders VALUES
  (201,1,89.99, '2024-02-10'),
  (202,2,45.00, '2024-02-12'),
  (203,3,120.00,'2024-02-14'),
  (204,1,30.00, '2024-02-16'),
  (205,4,75.50, '2024-02-18');

CREATE TABLE refunds (
  id          INTEGER PRIMARY KEY,
  order_id    INTEGER NOT NULL,
  amount      REAL    NOT NULL,
  refunded_at TEXT    NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id)
);
INSERT INTO refunds VALUES
  (1,201,89.99, '2024-02-11'),
  (2,202,45.00, '2024-02-13'),
  (3,203,120.00,'2024-02-09'),
  (4,204,30.00, '2024-02-17'),
  (5,205,75.50, '2024-02-15');

-- Load both tables. Look at the dates across the two tables.
-- One rule is physically impossible to break — but it has been.
-- Find which rows break it.

SELECT
	o.id,
	o.created_at,
	r.refunded_at
FROM orders o
JOIN refunds r ON o.id = r.order_id
WHERE r.refunded_at < o.created_at;