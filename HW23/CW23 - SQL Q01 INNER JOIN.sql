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

-- 1
-- Show each employee's name and their department name using INNER JOIN sorted by employee name
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

-- 2
-- Show only employees in departments with a budget above 70,000
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id
WHERE d.budget > 70000;

-- 3
-- Show the average salary per department name - use GROUP BY with INNER JOIN
SELECT d.dept_name, AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id
GROUP BY d.dept_name;

-- 4
-- Count how many employees are in each department name, sorted highest first
SELECT d.dept_name, COUNT(e.name) AS num_employees
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id
GROUP BY d.dept_name;

