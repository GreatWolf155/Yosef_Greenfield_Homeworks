-- Import 'E-commerce Customer Behavior - Sheet.csv' to DB Browser

-- Questions are found in the 'SQL Kaggle Review Questions.pdf' file

-- Run only ONCE:
ALTER TABLE "E-commerce Customer Behavior - Sheet"
RENAME TO kaggle;


-- Question 1
SELECT COUNT(*)
FROM kaggle;

-- Question 2
SELECT AVG(age)
FROM kaggle;

-- Question 3
SELECT
	gender,
	COUNT(*) as "count"
FROM kaggle
GROUP BY Gender;

-- Question 4
SELECT
	gender,
	AVG("Items Purchased") as "purchases on average"
FROM kaggle
GROUP BY Gender;

-- Question 5
SELECT
	COUNT(DISTINCT("Membership Type"))
FROM kaggle;

-- Question 6
SELECT
	"Membership Type",
	COUNT(*) as "Membership Count"
FROM kaggle
GROUP BY "Membership Type";

-- Question 7
SELECT
	COUNT(*) as "New Yorkers"
FROM kaggle
WHERE city = "New York";

-- Question 8
SELECT
	City,
	COUNT(*) as "Count per City"
FROM kaggle
GROUP BY City
ORDER BY "Count per City" DESC;

-- Question 9
SELECT
	Gender,
	SUM("Total Spend") as "Total Spent"
FROM kaggle
GROUP BY Gender;

-- Question 10
SELECT * FROM (
SELECT
	"Customer ID" as Customer,
	"Items Purchased"
FROM kaggle
ORDER BY "Items Purchased" ASC
LIMIT 1)

UNION ALL

SELECT * FROM (
SELECT
	"Customer ID" as Customer,
	"Items Purchased"
FROM kaggle
ORDER BY "Items Purchased" DESC
LIMIT 1);
