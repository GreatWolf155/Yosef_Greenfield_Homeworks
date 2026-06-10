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
SELECT SUM(amount) AS total_revenue,
	AVG(amount) AS average_sale,
	MIN(amount) AS cheapest_sale,
	MAX(amount) AS most_expensive_sale
	FROM sales;

-- 2
SELECT SUM(amount) AS total_revenue
FROM sales
WHERE region = 'North';

-- 3
SELECT MAX(amount) FROM sales
WHERE PRODUCT = 'Laptop';

-- 4
SELECT AVG(COALESCE(amount, 0)) AS average_sale
FROM sales;

SELECT (SUM(amount)/COUNT(*)) as average_sale
FROM sales;

-- 5
SELECT MIN(sale_date) AS earliest_sale,
	MAX(sale_date) AS latest_sale
FROM sales;