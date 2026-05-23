DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  id        INTEGER PRIMARY KEY,
  dept_name TEXT    NOT NULL,
  budget    REAL    NOT NULL
);

INSERT INTO departments VALUES
  (1,'Engineering',150000),
  (2,'Marketing',80000),
  (3,'Sales',60000),
  (4,'HR',45000);

CREATE TABLE employees (
  id         INTEGER PRIMARY KEY,
  name       TEXT    NOT NULL,
  dept_id    INTEGER,
  salary     REAL    NOT NULL,
  FOREIGN KEY (dept_id) REFERENCES departments(id)
);

INSERT INTO employees VALUES
  (1,'Dana',1,9000),
  (2,'Omar',2,7200),
  (3,'Noa',1,6800),
  (4,'Liam',3,5500),
  (5,'Rina',NULL,6000),
  (6,'Kai',2,7000);

DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
  id    INTEGER PRIMARY KEY,
  model TEXT    NOT NULL,
  price REAL    NOT NULL
);

INSERT INTO cars VALUES
  (1,'Toyota Corolla',22000),
  (2,'Honda Civic',24000),
  (3,'Ford Focus',19000),
  (4,'Tesla Model 3',42000);

CREATE TABLE drivers (
  id     INTEGER PRIMARY KEY,
  name   TEXT    NOT NULL,
  car_id INTEGER,
  FOREIGN KEY (car_id) REFERENCES cars(id)
);

INSERT INTO drivers VALUES
  (1,'Dana',1),
  (2,'Omar',2),
  (3,'Noa',NULL),
  (4,'Liam',3),
  (5,'Rina',NULL);

-- 1
-- Show all drivers with their car model name (NULL if they have no car)
SELECT d.name, c.model
FROM drivers d
LEFT JOIN cars c ON d.car_id = c.id;

-- 2
-- Find drivers who have no car using IS NULL
SELECT d.name, c.model
FROM drivers d
LEFT JOIN cars c ON d.car_id = c.id
WHERE c.model IS NULL;

-- 3
-- Show cars that have no driver ownership
SELECT c.model
FROM cars c
LEFT JOIN drivers d ON c.id = d.car_id
WHERE d.name IS NULL;

-- 4
-- Show all departments with their employee count, including departments with 0 employees — use departments LEFT JOIN employees + COUNT
SELECT dept.dept_name, COUNT(emp.name) AS dept_employee_cnt
FROM departments dept
LEFT JOIN employees emp ON dept.id = emp.dept_id
GROUP BY dept.dept_name;

-- 5
-- Use COALESCE to replace NULL budget with 0 for employees with no department
SELECT emp.name, COALESCE(dept.budget, 0) AS budget
FROM employees emp
LEFT JOIN departments dept ON emp.dept_id = dept.id;
