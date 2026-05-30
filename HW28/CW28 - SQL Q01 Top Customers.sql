DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS expenses;


CREATE TABLE branches (
  id    INTEGER PRIMARY KEY,
  name  TEXT
);
INSERT INTO branches VALUES
  (1, 'Downtown'),
  (2, 'Airport'),
  (3, 'Mall');

CREATE TABLE orders (
  id         INTEGER PRIMARY KEY,
  branch_id  INTEGER,
  amount     REAL
);
-- Downtown: 8 big orders
INSERT INTO orders (branch_id, amount) VALUES
  (1,6000),(1,8000),(1,7000),(1,9000),
  (1,6500),(1,8500),(1,7500),(1,5500),
-- Airport: 5 mid-size orders
  (2,5000),(2,6500),(2,5500),
  (2,6000),(2,5000),
-- Mall: 7 medium orders
  (3,4500),(3,5000),(3,5500),
  (3,4000),(3,5000),(3,4500),
  (3,4000);

CREATE TABLE expenses (
  id         INTEGER PRIMARY KEY,
  branch_id  INTEGER,
  category   TEXT,
  amount     REAL
);
INSERT INTO expenses (branch_id, category, amount) VALUES
-- Downtown: big city costs
  (1,'rent',     20000),
  (1,'salaries', 24000),
  (1,'groceries', 9000),
  (1,'utilities', 2000),
-- Airport: low overhead
  (2,'rent',      4000),
  (2,'salaries',  9000),
  (2,'groceries', 6500),
  (2,'utilities', 1000),
-- Mall: medium, barely breaks even
  (3,'rent',     11000),
  (3,'salaries', 13000),
  (3,'groceries', 7500),
  (3,'utilities', 2000);

--The CEO sees Downtown's revenue of 58,000 and assumes it's the best branch.
--Is he right? Which branch is actually the most profitable — and which one is quietly losing money?

-- First Attempt
SELECT
	b.name,
	SUM(o.amount) as revenue,
	SUM(e.amount) as expense
FROM branches b
JOIN orders o ON o.branch_id = b.id
JOIN expenses e ON e.branch_id = b.id
GROUP BY b.id;


SELECT
	b.name,
	o.revenue - e.expense AS total_profit,
	e.expense AS fixed_expenses
FROM branches b
JOIN
	(SELECT
		branch_id,
		SUM(amount) AS revenue
	FROM orders
	GROUP BY branch_id) o
	ON o.branch_id = b.id
JOIN
	(SELECT
		branch_id,
		SUM(amount) AS expense
	FROM expenses
	GROUP BY branch_id) e
	ON e.branch_id = b.id
GROUP BY b.id;

DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS expenses;