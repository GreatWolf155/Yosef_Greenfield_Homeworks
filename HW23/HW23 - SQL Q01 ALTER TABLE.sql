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
ADD COLUMN bonus REAL;

UPDATE sales
SET bonus = amount * 0.10;

ALTER TABLE sales
ADD COLUMN is_flagged INTEGER DEFAULT 0;

ALTER TABLE sales RENAME TO sales_archive;

ALTER TABLE sales_archive RENAME TO sales;

ALTER TABLE sales
RENAME COLUMN rep_name TO salesperson;

ALTER TABLE sales
DROP COLUMN is_flagged;

-- ALTER TABLE HOMEWORK QUESTIONS
-- 1
-- Add a TEXT column called tier to the sales table, then fill it: 'high' where amount > 1000, 'low' otherwise
ALTER TABLE sales
ADD COLUMN tier TEXT AS (CASE WHEN amount > 1000 THEN 'high' ELSE 'low' END);

ALTER TABLE sales
DROP COLUMN tier;

-- ALTERNATE ANSWER
ALTER TABLE sales
ADD COLUMN tier DEFAULT 'low';
UPDATE sales
SET tier = 'high'
WHERE amount > 1000;

-- 2
-- Add a REAL column called tax with DEFAULT 0, then update it to amount * 0.07 where amount IS NOT NULL
ALTER TABLE sales
ADD COLUMN tax REAL DEFAULT 0;
UPDATE sales
SET tax = amount * 0.07
WHERE amount;

-- 3
-- Rename the sales table to sales_backup, then rename it back to sales
ALTER TABLE sales RENAME TO sales_backup;
ALTER TABLE sales_backup RENAME TO sales;

-- 4
-- Rename the column product to item
ALTER TABLE sales
RENAME COLUMN product TO item;

-- 5
-- Drop the tier column you created in step 1, then run PRAGMA table_info(sales) to verify it is gone
ALTER TABLE sales
DROP COLUMN tier;
PRAGMA table_info(sales);
