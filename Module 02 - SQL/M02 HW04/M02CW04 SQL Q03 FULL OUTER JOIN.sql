DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	id			INTEGER	PRIMARY KEY,
	dept_name	TEXT		NOT NULL,
	budget		REAL		NOT NULL
);

INSERT INTO departments VALUES
	(1,'Engineering',150000),
	(2,'Marketing',80000),
	(3,'Sales',60000),
	(4,'HR',45000);

CREATE TABLE employees (
	id			INTEGER	PRIMARY KEY,
	name		TEXT		NOT NULL,
	dept_id		INTEGER,
	salary		REAL		NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES departments(id)
);

INSERT INTO employees VALUES
	(1,'Dana',1,9000),
	(2,'Omar',2,7200),
	(3,'Noa',1,6800),
	(4,'Liam',3,5500),
	(5,'Rina',NULL,6000),
	(6,'Kai',2,7000);


-- Shows everything from both tables, and missing data will show up as NULL on both sides
SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.id;

-- Equivalent Union All Approach
-- All employees with their dept (Rina shows NULL dept)
SELECT e.name, d.dept_name
FROM   employees e
LEFT JOIN departments d ON e.dept_id = d.id

UNION ALL

-- Departments with no employees (HR shows NULL name)
SELECT NULL AS name, d.dept_name
FROM departments d
LEFT JOIN employees e ON e.dept_id = d.id
WHERE e.id IS NULL;

-- Replace NULLs with COALESCE
SELECT
	COALESCE(e.name,		'— no employee —')	AS name,
	COALESCE(d.dept_name,	'— no dept —')		AS dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.id;


-- FULL JOIN PRACTICE
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
	id		INTEGER	PRIMARY KEY,
	model	TEXT	NOT NULL,
	price	REAL	NOT NULL
);

INSERT INTO cars VALUES
	(1,'Toyota Corolla',22000),
	(2,'Honda Civic',24000),
	(3,'Ford Focus',19000),
	(4,'Tesla Model 3',42000);

CREATE TABLE drivers (
	id		INTEGER	PRIMARY KEY,
	name	TEXT	NOT NULL,
	car_id	INTEGER,
FOREIGN KEY (car_id) REFERENCES cars(id)
);

INSERT INTO drivers VALUES
	(1,'Dana',1),
	(2,'Omar',2),
	(3,'Noa',NULL),
	(4,'Liam',3),
	(5,'Rina',NULL);

-- 1
-- Write a FULL OUTER JOIN to show all drivers and all cars in one result set
SELECT d.name, c.model
FROM drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id;

-- 2
-- From the full-outer result, find only the unmatched rows on EITHER side — drivers with no car AND cars with no driver — add a WHERE clause
SELECT d.name, c.model
FROM drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id
WHERE d.name IS NULL OR c.model IS NULL;


-- 3
-- Use COALESCE to replace NULL car prices with 0 for drivers who have no car assigned
SELECT d.name, c.model, COALESCE(c.price, 0) AS price
FROM drivers d
FULL OUTER JOIN cars c ON d.car_id = c.id;


-- 4
-- Which single join type lets you find drivers WITHOUT a car AND cars WITHOUT a driver in one query?

-- FULL OUTER JOIN, as seen in Question 2
