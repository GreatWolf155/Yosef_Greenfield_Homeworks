DROP TABLE IF EXISTS books1;

CREATE TABLE books1 (
	ISBN TEXT PRIMARY KEY,
	title TEXT NOT NULL,
	author_id TEXT NOT NULL,
	author_name TEXT,
	publisher_id TEXT NOT NULL,
	publisher_name TEXT,
	publisher_city TEXT
);

INSERT INTO books1 (ISBN, title, author_id, author_name, publisher_id, publisher_name, publisher_city)
VALUES
	('978-1', 'SQL Mastery', 'A1', 'Jane Doe', 'P1', 'TechPress', 'New York'),
	('978-2', 'Python Pro', 'A2', 'John Smith', 'P1', 'TechPress', 'New York'),
	('978-3', 'Data Viz', 'A1', 'Jane Doe', 'P2', 'DataBooks', 'Paris');

-- 1
-- Check: is this table in 1NF? Explain why.
-- Atomic Values: True
-- No Repeating Groups: True
-- Unique Rows: True
-- Consistent Column Types: True
-- The table conforms to all rules for 1NF

-- 2
-- Check: is this table in 2NF? Explain why (single-column PK).
-- Any table without a composite Primary Key and conforms to 1NF is automatically in 2NF

-- 3
-- Identify all transitive dependencies in the table.
-- author_name: author_id
-- publisher_name: publisher_id
-- publisher_city: publisher_id

-- 4
-- Design a 3NF schema with tables: books, authors, publishers.
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS publishers;

CREATE TABLE authors (
	author_id TEXT PRIMARY KEY,
	author_name TEXT
);

CREATE TABLE publishers (
	publisher_id TEXT PRIMARY KEY,
	publisher_name TEXT,
	publisher_city TEXT
);

CREATE TABLE books (
	ISBN TEXT PRIMARY KEY,
	title TEXT NOT NULL,
	author_id TEXT NOT NULL,
	publisher_id TEXT NOT NULL,
	FOREIGN KEY (author_id) REFERENCES authors(author_id),
	FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

-- 5
-- Write CREATE TABLE statements for all three tables with proper PKs and FKs.
-- Done

-- 6
-- Insert the original data into the normalized tables.
INSERT INTO authors (author_id, author_name)
VALUES
	('A1', 'Jane Doe'),
	('A2', 'John Smith');

INSERT INTO publishers (publisher_id, publisher_name, publisher_city)
VALUES
	('P1', 'TechPress', 'New York'),
	('P2', 'DataBooks', 'Paris');

INSERT INTO books(ISBN, title, author_id, publisher_id)
VALUES
	('978-1', 'SQL Mastery', 'A1', 'P1'),
	('978-2', 'Python Pro', 'A2', 'P1'),
	('978-3', 'Data Viz', 'A1', 'P2');

-- 7
-- Write a query to reproduce all original columns using JOINs.
SELECT
	b.ISBN,
	b.title,
	a.author_id,
	a.author_name,
	p.publisher_id,
	p.publisher_name,
	p.publisher_city
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN publishers p ON b.publisher_id = p.publisher_id;

-- BONUS
-- Change Jane Doe's name to "Jane Doe-Smith" — how many rows change in the 3NF vs original schema?
-- First table:
UPDATE books1
SET author_name = 'Jane Doe-Smith'
WHERE author_id = 'A1';
-- 2 rows changed

-- 3NF table:
UPDATE authors
SET author_name = 'Jane Doe-Smith'
WHERE author_id = 'A1';
-- only one row was changed
