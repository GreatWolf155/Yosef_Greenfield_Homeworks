DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
	id INTEGER PRIMARY KEY,
	rep_name TEXT NOT NULL,
	region TEXT NOT NULL,
	product TEXT NOT NULL,
	amount REAL,
	sale_date TEXT NOT NULL
);

INSERT INTO sales (ID, REP_NAME, REGION, PRODUCT, AMOUNT, SALE_DATE)
VALUES
	(1, 'Dana', 'North', 'Laptop', 1200.00, '2026-01-10'),
	(2, 'Omar', 'South', 'Phone', 650.00, '2026-01-12'),
	(3, 'Dana', 'North', 'Tablet', NULL, '2026-01-15'),
	(4, 'Noa', 'East', 'Laptop', 1350.00, '2026-01-18'),
	(5, 'Omar', 'South', 'Laptop', 1100.00, '2026-01-20'),
	(6, 'Dana', 'North', 'Phone', 720.00, '2026-01-22'),
	(7, 'Noa', 'East', 'Phone', 690.00, '2026-01-25'),
	(8, 'Liam', 'West', 'Tablet', 480.00, '2026-01-28'),
	(9, 'Liam', 'West', 'Laptop', 1050.00, '2026-02-01'),
	(10, 'Omar', 'South', 'Tablet', NULL, '2026-02-03');

ALTER TABLE sales
ADD COLUMN bonus;

UPDATE sales
SET bonus =
	CASE
	WHEN product = 'Laptop'  THEN amount * 0.15
	WHEN amount IS NOT NULL   THEN amount * 0.08
	ELSE 0
END;


SELECT
	rep_name,
	product,
	COALESCE(SUM(amount), 0) AS revenue
FROM sales
GROUP BY rep_name, product
ORDER BY rep_name, product;

SELECT
	product,
	ROUND(AVG(amount), 2) AS avg_price,
	ROUND(SUM(amount), 2) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

SELECT
	rep_name,
	COUNT(*) AS total_sales,
	COUNT(CASE WHEN product = 'Laptop' THEN 1 END) AS laptop_sales,
	COUNT(CASE WHEN amount > 1000   THEN 1 END) AS big_sales
FROM sales
GROUP BY rep_name;

SELECT
	rep_name,
	COUNT(*) AS total_sales,
	COUNT(CASE WHEN product = 'Laptop' THEN 1 END) AS laptops,
	COALESCE(ROUND(SUM(amount), 2), 0) AS revenue,
	COALESCE(ROUND(AVG(amount), 2), 0) AS avg_sale
FROM sales
GROUP BY rep_name
HAVING COUNT(*) >= 2
ORDER BY revenue DESC;

-- ADVANCED AGGREGATION HOMEWORK QUESTIONS
-- 1
-- Use COALESCE to show revenue per rep — replace any NULL total with 0
SELECT
	rep_name,
	COALESCE(SUM(amount), 0) AS revenue
FROM sales
GROUP BY rep_name
ORDER BY rep_name;

-- 2
-- Show average amount per product, rounded to 2 decimal places, sorted highest first
SELECT
	product,
	ROUND(AVG(amount), 2) AS avg_amount
FROM sales
GROUP BY product
ORDER BY avg_amount DESC;

-- 3
-- For each rep show: total sales, count of Phone sales, count of sales above 1000
SELECT
	rep_name,
	COUNT(*) AS total_sales,
	COUNT(CASE WHEN product = 'Phone' THEN TRUE END) AS phone_sales,
	COUNT(CASE WHEN amount > 1000 THEN TRUE END) AS large_sales
FROM sales
GROUP BY rep_name;

-- 4
-- Write the "Mistake 1" query (non-grouped column) — observe the result, then fix it

-- Every column in SELECT must either be in GROUP BY or wrapped in an aggregate.
-- SOLUTION 1 - Add sale_date to GROUP BY
SELECT rep_name, sale_date,
	SUM(amount)
FROM sales
GROUP BY sale_date, rep_name;

-- SOLUTION 2 - Remove sale_date from SELECT
SELECT rep_name,
	SUM(amount) AS total
FROM sales
GROUP BY rep_name;

-- 5
-- Build the full report from Query 4: COALESCE + ROUND + COUNT(CASE WHEN) + HAVING + ORDER BY alias
SELECT
	rep_name,
	COUNT(*) AS total_sales,
	COUNT(CASE WHEN product = 'Laptop' THEN 1 END) AS laptops,
	COALESCE(ROUND(SUM(amount), 2), 0) AS revenue,
	COALESCE(ROUND(AVG(amount), 2), 0) AS avg_sale
FROM sales
GROUP BY rep_name
HAVING COUNT(*) >= 2
ORDER BY revenue DESC;
-- Did not understand what was being asked here