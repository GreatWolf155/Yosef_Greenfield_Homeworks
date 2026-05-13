DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS categories;

-- 1
-- Create a categories table: id PK AUTOINCREMENT, title TEXT UNIQUE NOT NULL.
CREATE TABLE categories (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT UNIQUE NOT NULL);

-- 2
-- Create a posts table: id PK AUTOINCREMENT, category_id FK (NOT NULL), title TEXT, views INTEGER DEFAULT 0. Use ON DELETE RESTRICT.
CREATE TABLE posts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	category_id NOT NULL,
	title TEXT,
	views INTEGER DEFAULT 0,
	FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT
);

-- 3
-- Insert 3 categories and at least 5 posts spread across the categories.
INSERT INTO categories (title)
VALUES
	('Mystery'),
	('Action'),
	('Comedy');

INSERT INTO posts (category_id, title, views)
VALUES
	(1, 'Shutter Island', 16000000),
	(3, 'Instant Family', 32000000),
	(2, 'Rampage', 72000000),
	(3, 'Playing with Fire', 17000000),
	(2, 'Edge of Tomorrow', 88000000);


-- 4
-- Query: list all posts with their category title using INNER JOIN.
SELECT
	p.id,
	p.title,
	c.title
FROM posts p
INNER JOIN categories c ON p.category_id = c.id;

-- 5
-- Query: count posts per category, show categories with 0 posts too (use LEFT JOIN + GROUP BY).
SELECT
	c.title,
	COUNT(p.title) AS number_of_titles
FROM posts p
LEFT JOIN categories c ON p.category_id = c.id
GROUP BY c.id;

-- 6
-- Query: find the category with the highest total views using GROUP BY + ORDER BY + LIMIT 1.
SELECT
	c.title,
	SUM(p.views) AS total_views
FROM posts p
INNER JOIN categories c ON p.category_id = c.id
GROUP BY c.id
ORDER BY total_views DESC
LIMIT 1;