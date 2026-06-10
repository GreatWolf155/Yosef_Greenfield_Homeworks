DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL,
	genre TEXT NOT NULL,
	year INTEGER NOT NULL,
	rating REAL NOT NULL,
	minutes INTEGER NOT NULL);

INSERT INTO movies (title, genre, year, rating, minutes)
VALUES
	('Metro Rush', 'Action', 2005, 7.9, 118),
	('Quiet Lake', 'Drama', 2012, 8.1, 124),
	('Night Pulse', 'Horror', 2018, 6.8, 95),
	('Skyline Code', 'Action', 2021, 7.4, 109);

-- 1
SELECT
	title AS movie_name,
	genre AS type,
	year AS release_year
	FROM movies;

-- 2
SELECT
	title AS movie_name,
	genre AS type,
	year AS release_year,
	rating * 10 AS rating_bucket
FROM movies;

-- 3
SELECT
	title AS movie_name,
	genre AS type,
	year AS release_year,
	rating * 10 AS rating_bucket
FROM movies
ORDER BY
	rating_bucket DESC,
	movie_name ASC;

-- 4
SELECT * FROM movies