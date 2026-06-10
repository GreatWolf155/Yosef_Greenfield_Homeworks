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


-- 1
-- Show total revenue per region, sorted highest first
SELECT region, SUM(amount) FROM sales
GROUP BY region
ORDER BY SUM(amount) DESC;

-- 2
-- Show the number of sales and average amount per product
SELECT product,
	COUNT(*) as number_of_sales,
	AVG(amount) FROM sales
GROUP BY product;

-- 3
-- Show revenue per rep_name, sorted by revenue descending — use an alias in ORDER BY
SELECT rep_name, AVG(amount) AS revenue
FROM sales
GROUP BY rep_name
ORDER BY revenue DESC;

-- 4
-- Show COUNT and SUM grouped by both region and rep_name
SELECT region, rep_name, COUNT(*) AS "count", SUM(amount) as "sum"
FROM sales
GROUP BY region, rep_name;

-- 5
-- Bonus: find which rep sold the most Laptops (GROUP BY rep_name with WHERE product = 'Laptop')
SELECT rep_name
FROM sales
WHERE product = 'Laptop'
GROUP BY rep_name
ORDER BY COUNT(*)
LIMIT 1;