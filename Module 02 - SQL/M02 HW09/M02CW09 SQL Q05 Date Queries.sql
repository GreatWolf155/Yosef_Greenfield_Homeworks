DROP TABLE IF EXISTS orders;


CREATE TABLE orders (
  id         INTEGER PRIMARY KEY,
  customer   TEXT,
  amount     REAL,
  created_at TEXT
);
INSERT INTO orders VALUES
  ( 1, 'Alice',  120.00, '2026-01-15 09:23:00'),
  ( 2, 'Bob',    250.00, '2026-01-15 14:05:00'),
  ( 3, 'Carol',   80.00, '2026-02-20 11:30:00'),
  ( 4, 'David',  340.00, '2026-03-10 14:45:00'),
  ( 5, 'Emma',    95.00, '2026-03-15 09:00:00'),
  ( 6, 'Felix',  185.00, '2026-03-15 15:22:00'),
  ( 7, 'Greta',  220.00, '2026-03-15 14:10:00'),
  ( 8, 'Hans',   300.00, '2026-04-01 08:15:00'),
  ( 9, 'Ingrid', 150.00, '2026-04-01 23:55:00'),
  (10, 'Jack',   175.00, '2026-05-20 14:30:00');

-- 1
-- Find all orders placed on a Monday — use strftime('%w', created_at) = '1' (Monday = 1 in SQLite)
SELECT * FROM orders
WHERE strftime('%w', created_at) = '1';

-- 2
-- Find all orders placed in Q1 (January, February, March) — use strftime('%m') with BETWEEN or IN
SELECT * FROM orders
WHERE strftime('%m', created_at) BETWEEN '01' AND '03' || '23:59:59';

SELECT * FROM orders
WHERE strftime('%m', created_at) IN ('01', '02', '03');
-- 3
-- Find orders placed after 8 PM (hour ≥ 20) — what do you notice about Ingrid's order?
SELECT * FROM orders
WHERE strftime('%H', created_at) >= '20';

-- 4
-- Show total revenue per day of the week — which day generates the most sales?
SELECT
	CASE strftime('%w', created_at)
		WHEN '0' THEN 'Sunday'
		WHEN '1' THEN 'Monday'
		WHEN '2' THEN 'Tuesday'
		WHEN '3' THEN 'Wednesday'
		WHEN '4' THEN 'Thursday'
		WHEN '5' THEN 'Friday'
		WHEN '6' THEN 'Saturday'
	END AS day,
	SUM(amount) AS revenue
FROM orders
GROUP BY strftime('%w', created_at)
ORDER BY strftime('%w', created_at);

-- BONUS
-- Bonus: find orders where the hour is between 9 and 17 (business hours) and the amount is over 200
SELECT * FROM orders
WHERE
	strftime('%H', created_at) >= '09' AND
	strftime('%H', created_at) < '17' AND
	amount > 200;