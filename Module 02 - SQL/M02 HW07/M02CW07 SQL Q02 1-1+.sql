DROP TABLE IF EXISTS medical_files;
DROP TABLE IF EXISTS patients;

-- 1
-- Create a patients table with: patient_id (PK AUTOINCREMENT), patient_name, blood_type.
CREATE TABLE patients (
	patient_id INTEGER PRIMARY KEY AUTOINCREMENT,
	patient_name TEXT,
	blood_type TEXT
);

-- 2
-- Create a medical_files table with: file_id (PK AUTOINCREMENT), patient_ref (UNIQUE FK to patients(patient_id)),
-- allergies, emergency_contact.
CREATE TABLE medical_files (
	file_id INTEGER PRIMARY KEY AUTOINCREMENT,
	patient_ref INT UNIQUE,
	allergies TEXT,
	emergency_contact TEXT,
	FOREIGN KEY (patient_ref) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- 3
-- Insert 3 patients: Dr. Aisha Khan (O+), Marcus Williams (AB-), Dr. Priya Singh (B+).
INSERT INTO patients (patient_name, blood_type)
VALUES
	('Dr. Aisha Khan', 'O+'),
	('Marcus Williams', 'AB-'),
	('Dr. Priya Singh', 'B+');

-- 4
-- Insert 2 medical files: Aisha (allergies: Penicillin, contact: +1-555-0101)
-- and Marcus (allergies: None, contact: +1-555-0202). Leave Priya without a file.
INSERT INTO medical_files (patient_ref, allergies, emergency_contact)
VALUES
	(1, 'Penicillin', '+1-555-0101'),
	(2, 'None', '+1-555-0202');

-- 5
-- Write a LEFT JOIN query to list all patients and their file data.
SELECT
	p.*,
	m.allergies AS allergies,
	m.emergency_contact AS emergency_contact
FROM patients p
LEFT JOIN medical_files m ON m.patient_ref = p.patient_id;

-- 6
-- Try adding a second file for the same patient_ref. Explain the error.

-- INSERT INTO medical_files (patient_ref, allergies, emergency_contact) VALUES (1, 'oxytocin', '+1-555-0101');
-- UNIQUE constraint violated by attempt to create a "new medical record" for a specific patient, instead of updating the existing one

-- 7
-- Delete a patient (who has a medical file). Then query the medical_files table. What happened to their file? Why?
DELETE FROM patients
WHERE patient_id = 1;
SELECT * FROM medical_files;
-- The medical file disappeared because there is no longer any data for it to point to