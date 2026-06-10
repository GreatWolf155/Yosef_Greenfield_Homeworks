DROP TABLE IF EXISTS pastries;
DROP TABLE IF EXISTS toppings;
DROP TABLE IF EXISTS baristas;
DROP TABLE IF EXISTS shifts;

-- Tables for combinations
CREATE TABLE Pastries (PastryName VARCHAR(50));
CREATE TABLE Toppings (ToppingName VARCHAR(50));

INSERT INTO Pastries VALUES ('Croissant'), ('Muffin'), ('Donut');
INSERT INTO Toppings VALUES ('Chocolate'), ('Glaze'), ('Sprinkles'), ('Caramel');

-- Tables for business logic
CREATE TABLE Baristas (Name VARCHAR(50), HourlyRate DECIMAL(10,2));
CREATE TABLE Shifts (ShiftType VARCHAR(20), Income DECIMAL(10,2));

INSERT INTO Baristas VALUES ('Alice', 18.00), ('Bob', 22.00), ('Charlie', 15.00), ('Diana', 25.00);
INSERT INTO Shifts VALUES ('Morning', 95.00), ('Afternoon', 85.00), ('Evening', 70.00);

-- 1
-- Generate a Menu: Write a CROSS JOIN between Pastries and Toppings to show all 12 possible dessert combinations
SELECT p.PastryName, t.ToppingName
FROM Pastries p
CROSS JOIN Toppings t;

-- 2
-- Roster Capacity: Count how many rows result from Baristas CROSS JOIN Shifts (to see the total number of possible assignments)
SELECT COUNT(*)
FROM Baristas b
CROSS JOIN Shifts s;

-- 3
-- Premium Staffing: List only the barista/shift combinations where the Barista.HourlyRate > 20.00 (adding a WHERE clause to your CROSS JOIN)
SELECT b.Name, s.ShiftType
FROM Baristas b
CROSS JOIN Shifts s
WHERE b.HourlyRate > 20;

-- 4
-- Concept Check: Explain the difference between CROSS JOIN and INNER JOIN — when does a CROSS JOIN produce the exact same result as an INNER JOIN?

-- Cross Join gives all combinations of the available items
-- Inner Join will give only the combinations where the given condition is TRUE
-- They will work the same if the condition is always TRUE
-- or if there is only one line in one of the tables

-- 5
-- Profit Check: For each shift, assume all baristas work that shift.
-- Find which shifts are still profitable where total barista cost is less than shift income (cost < income)
SELECT s.ShiftType
FROM Shifts s
WHERE (SELECT SUM(HourlyRate) FROM Baristas) < s.income;