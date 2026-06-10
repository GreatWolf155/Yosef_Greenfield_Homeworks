DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS emails;
DROP TABLE IF EXISTS contacts;

CREATE TABLE Contacts (
	ID INTEGER PRIMARY KEY,
	FULL_NAME TEXT NOT NULL,
	EMAILS TEXT UNIQUE NOT NULL,
	TAG1 TEXT DEFAULT NULL,
	TAG2 TEXT DEFAULT NULL,
	TAG3 TEXT DEFAULT NULL);

INSERT INTO Contacts (ID, FULL_NAME, EMAILS, TAG1, TAG2)
VALUES
	(1, 'Ana Silva', 'ana@a.com, ana@b.com', 'VIP', 'Newsletter'),
	(2, 'João Souza', 'joao@c.com', 'Newsletter', NULL);

-- 1
-- Identify all 1NF violations in the table above.
-- Atomic Groups: emails for Ana Silva has two inputs in one cell
-- No Repeating Groups: TAG1, TAG2, TAG3

-- 2
-- Design a normalized schema with separate tables for contacts, emails, and tags.
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS emails;
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	full_name TEXT NOT NULL
);

CREATE TABLE emails(
	email_id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	email TEXT UNIQUE NOT NULL,
	FOREIGN KEY (user_id) REFERENCES contacts(id) ON DELETE CASCADE
);

CREATE TABLE tags (
	tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	tag TEXT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES contacts(id) ON DELETE CASCADE
);

-- 3
-- Write CREATE TABLE statements for all tables with proper PKs and FKs.
-- Completed in question 2

-- 4
-- Insert the data from the original table into your new schema.
INSERT INTO contacts (full_name)
VALUES
	('Ana Silva'),
	('João Souza');

INSERT INTO emails (user_id, email)
VALUES
	(1, 'ana@a.com'),
	(1, 'ana@b.com'),
	(2, 'joao@c.com');

INSERT INTO tags (user_id, tag)
VALUES
	(1, 'VIP'),
	(1, 'Newsletter'),
	(2, 'Newsletter');

-- 5
-- Write a query to find all contacts that have the tag 'Newsletter'.
SELECT
	c.full_name
FROM contacts c
JOIN tags t ON t.user_id = c.id
WHERE t.tag = 'Newsletter';

-- 6
-- Write a query to find all emails for contact id 1.
SELECT
	email
FROM emails
WHERE user_id = 1;