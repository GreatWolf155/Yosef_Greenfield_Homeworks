DROP TABLE IF EXISTS flights;

CREATE TABLE flights (
  id             INTEGER PRIMARY KEY,
  flight_no      TEXT    NOT NULL,
  origin         TEXT    NOT NULL,
  destination    TEXT    NOT NULL,
  prev_flight_id INTEGER,
  FOREIGN KEY (prev_flight_id) REFERENCES flights(id)
);

INSERT INTO flights VALUES
  (1,'TK101','NYC','London',NULL),
  (2,'TK102','London','Dubai',1),
  (3,'TK103','Dubai','Tokyo',2),
  (4,'TK104','Tokyo','Seoul',3),
  (5,'TK105','Tokyo','Sydney',3),
  (6,'AA201','LA','Chicago',NULL),
  (7,'AA202','Chicago','NYC',6),
  (8,'AA203','NYC','Miami',7),
  (9,'AA204','NYC','Boston',7),
  (10,'BA301','Paris','Rome',NULL),
  (11,'LH401','Frankfurt','Berlin',NULL),
  (12,'LH402','Amsterdam','London',11);

-- 1
-- Show every flight with its predecessor flight number — use LEFT JOIN so origin flights (no predecessor) appear with NULL
SELECT
  f2.id			AS id,
  f2.flight_no	AS flight_no,
  f1.flight_no	AS prev_flight
FROM flights f2
LEFT JOIN flights f1 ON f2.prev_flight_id = f1.id;


-- 2
-- Show only flights that directly follow 'TK101' (i.e. where the predecessor flight is TK101)
SELECT
  f2.id			AS id,
  f2.flight_no	AS flight_no,
  f1.flight_no	AS prev_flight
FROM flights f2
LEFT JOIN flights f1 ON f2.prev_flight_id = f1.id
-- WHERE queries not to use aliases
WHERE f1.flight_no = 'TK101';

-- 3
-- Count how many onward connections each flight has (how many flights list it as predecessor), sorted descending
SELECT
  f1.flight_no	AS flight,
  COUNT(f2.id) AS connections
FROM flights f1
LEFT JOIN flights f2 ON f1.id = f2.prev_flight_id
GROUP BY f1.flight_no
ORDER BY connections DESC;


-- 4
-- Find flights where the predecessor's destination doesn't match the current flight's origin — a data-inconsistency check
SELECT
  f2.id			AS id,
  f1.flight_no	AS prev_flight,
  f2.flight_no	AS connecting_flight
FROM flights f2
LEFT JOIN flights f1 ON f2.prev_flight_id = f1.id
WHERE f1.destination != f2.origin;