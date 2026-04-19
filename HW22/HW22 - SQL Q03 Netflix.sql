-- 1
SELECT DISTINCT type
FROM netflix_movies_detailed_up_to_2025
ORDER BY type;

-- 2
SELECT *
FROM netflix_movies_detailed_up_to_2025
WHERE "cast" IS NOT NULL AND genres LIKE '%Action%'
LIMIT 20;

-- 3
SELECT *
FROM netflix_movies_detailed_up_to_2025
WHERE release_year = 2015 AND genres LIKE '%Action%'
LIMIT 5;

-- 4
-- assuming you mean sort the previous question by highest rating first
SELECT *
FROM netflix_movies_detailed_up_to_2025
WHERE release_year = 2015 AND genres LIKE '%Action%'
ORDER BY rating DESC
LIMIT 5;

-- 5
-- Again, assuming the request is for the previous query
SELECT
	title as movie,
	rating as score
FROM netflix_movies_detailed_up_to_2025
WHERE release_year = 2015 AND genres LIKE '%Action%'
ORDER BY rating DESC
LIMIT 5;

-- 6 Bonus
SELECT *
FROM netflix_movies_detailed_up_to_2025
WHERE "cast" IS NULL;
