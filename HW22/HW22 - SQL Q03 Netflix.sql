-- 1
SELECT DISTINCT type
FROM netflix_movies_detailed_up_to_2025;

-- 2
SELECT DISTINCT "cast"
FROM netflix_movies_detailed_up_to_2025
WHERE genres LIKE '%Action%' AND "cast" IS NOT NULL
    AND TRIM("cast") != ''
LIMIT 20;

-- 3
SELECT *
FROM netflix_movies_detailed_up_to_2025
WHERE release_year > 2015
    AND genres LIKE '%Action%'
    AND type = 'Movie'
LIMIT 5;

-- 4
SELECT *
FROM netflix_movies_detailed_up_to_2025
WHERE release_year > 2015
    AND genres LIKE '%Action%'
    AND type = 'Movie'ORDER BY rating DESC
LIMIT 5;

-- 5
SELECT
	title as movie,
	rating as score
FROM netflix_movies_detailed_up_to_2025
WHERE release_year > 2015
    AND genres LIKE '%Action%'
    AND type = 'Movie'
ORDER BY rating DESC
LIMIT 5;

-- 6 Bonus
-- SELECT title, "cast"
SELECT title, release_year
FROM netflix_movies_detailed_up_to_2025
WHERE ("cast" IS NULL OR TRIM("cast") = '');
