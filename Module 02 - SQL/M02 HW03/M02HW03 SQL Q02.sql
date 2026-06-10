DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL,
	genre TEXT NOT NULL,
	year INTEGER NOT NULL,
	language TEXT NOT NULL);

INSERT INTO movies (title,genre,year,language)
VALUES
	('Metro Rush', 'Action', 2005, 'English'),
	('Quiet Lake', 'Drama', 2012, 'English'),
	('Night Pulse', 'Horror', 2018, 'Spanish'),
	('Skyline Code', 'Action', 2021, 'English'),
	('Tiny Planet', 'Family', 2010, 'French'),
	('Silver Track', 'Thriller', 2016, 'Spanish'),
	('Golden Path', 'Drama', 2016, 'French');

-- 1
SELECT DISTINCT language
FROM movies;

-- 2
SELECT DISTINCT year
FROM movies
WHERE genre IN ('Drama', 'Action');

-- 3
SELECT DISTINCT genre, language
FROM movies
ORDER BY language;

-- 4
SELECT COUNT(DISTINCT genre)
FROM movies;