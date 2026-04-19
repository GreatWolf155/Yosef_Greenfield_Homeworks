DROP TABLE IF EXISTS workshop_roster;

-- 1
CREATE TABLE IF NOT EXISTS workshop_roster (
	roster_id INT PRIMARY KEY,
	contact_email TEXT NOT NULL UNIQUE,
	display_name TEXT NOT NULL,
	wants_certificate BOOLEAN DEFAULT FALSE,
	start_date DATE NOT NULL,
	last_activity DATETIME NOT NULL,
	completion_score REAL CHECK (completion_score BETWEEN 0 AND 100),
	group_label TEXT DEFAULT 'starter'
	);

-- 2
INSERT INTO workshop_roster (roster_id, contact_email, display_name, wants_certificate, start_date, last_activity, completion_score, group_label)
VALUES
	(1, 'mika@campus.com', 'Mika', TRUE, '2026-04-01', '2026-04-14 08:15:00', 94.5, 'advanced'),
	(2, 'matan@campus.com', 'Matan', TRUE, '2026-04-05', '2026-04-12 18:20:00', 82.0, 'advanced');

INSERT INTO workshop_roster (roster_id, contact_email, display_name, start_date, last_activity, completion_score)
VALUES
	(3, 'nora@campus.com', 'Nora', '2026-04-07', '2026-04-09 10:00:00', 74.0);

INSERT INTO workshop_roster (roster_id, contact_email, display_name, wants_certificate, start_date, last_activity, completion_score, group_label)
VALUES
	(4, 'liam@campus.com', 'Liam', TRUE, '2026-04-10', '2026-04-15 07:45:00', 88.0, 'regular');

INSERT INTO workshop_roster (roster_id, contact_email, display_name, start_date, last_activity, completion_score)
VALUES
	(5, 'dana@campus.com', 'Dana', '2026-04-11', '2026-04-11 21:05:00', 69.5);

-- 3, 1
SELECT * FROM workshop_roster;

-- 3, 2
SELECT display_name, contact_email, completion_score FROM workshop_roster;

-- 3, 3
SELECT * FROM workshop_roster
WHERE wants_certificate = FALSE AND last_activity < '2026-04-10';

-- 3, 4
SELECT * FROM workshop_roster
WHERE display_name LIKE 'm%' AND contact_email LIKE 'm%';

-- 3, 5
SELECT * FROM workshop_roster
WHERE completion_score > 85;

-- Try one insert with duplicate contact_email and explain which constraint blocks it
-- INSERT INTO workshop_roster
-- VALUES (6, 'matan@campus.com', 'Matan', TRUE, '2026-04-05', '2026-04-12 18:20:00', 82.0, 'advanced');
-- Blocked by the UNIQUE constraint on contact_email

-- Try one insert with completion_score = 120 and explain which constraint blocks it
-- INSERT INTO workshop_roster
-- VALUES (6, 'matans@campus.com', 'Matan', TRUE, '2026-04-05', '2026-04-12 18:20:00', 120.0, 'advanced');
-- Blocked by CHECK constraint for completion_score, value is not between 0 and 100