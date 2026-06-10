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
SELECT COUNT (DISTINCT product) FROM sales
WHERE region = 'South';

-- 2
SELECT COUNT (DISTINCT product) FROM sales
WHERE rep_name = 'Dana';

-- 3
SELECT COUNT(*) FROM sales
WHERE PRODUCT = 'Laptop';

-- 4
SELECT COUNT(*) AS total_rows,
	COUNT(amount) AS rows_with_amount,
	COUNT(*) - COUNT(amount) AS missing_amount
	FROM sales;