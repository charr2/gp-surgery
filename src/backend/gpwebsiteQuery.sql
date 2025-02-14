-- CREATE TABLE Login_Credential (
--   accountNumber INTEGER PRIMARY KEY NOT NULL,
--   username TEXT NOT NULL UNIQUE,
--   hash TEXT NOT NULL,
--   userType TEXT NOT NULL
-- );

-- CREATE TABLE User_Information (
--   accountNumber INTEGER PRIMARY KEY NOT NULL,
--   phoneNumber TEXT NOT NULL,
--   emailAddress TEXT NOT NULL,
--   FOREIGN KEY (accountNumber) REFERENCES Login_Credential(accountNumber)
-- );

-- CREATE TABLE Doctor (
--   medicalLicenseNumber INTEGER PRIMARY KEY NOT NULL,
--   firstName TEXT NOT NULL,
--   lastName TEXT NOT NULL,
--   dateOfBirth DATE NOT NULL,
--   genderCode TEXT NOT NULL,
--   accountNumber INTEGER NOT NULL,
--   FOREIGN KEY (accountNumber) REFERENCES Login_credential(accountNumber)
-- );

-- CREATE TABLE Admin (
--   employeeCode INTEGER PRIMARY KEY NOT NULL,
--   firstName TEXT NOT NULL,
--   lastName TEXT NOT NULL,
--   dateOfBirth DATE NOT NULL,
--   genderCode TEXT NOT NULL,
--   postcode TEXT NOT NULL,
--   accountNumber INTEGER NOT NULL,
--   FOREIGN KEY (accountNumber) REFERENCES Login_Credential(accountNumber)
-- );

-- CREATE TABLE Patient (
--   NHSNumber INTEGER PRIMARY KEY NOT NULL,
--   forename TEXT NOT NULL,
--   surname TEXT NOT NULL,
--   personDOB DATE NOT NULL,
--   genderCode TEXT NOT NULL,
--   postcode TEXT NOT NULL
-- );

-- CREATE TABLE Vaccines (
--   NHSNumber INTEGER NOT NULL,
--   DoseNo INTEGER NOT NULL,
--   vaccinationDate DATE,
--   vaccineManufacture TEXT,
--   diseaseTargeted TEXT,
--   vaccineType TEXT,
--   product TEXT,
--   vaccineBatchNumber TEXT,
--   countryOfVaccination TEXT,
--   authority TEXT,
--   site TEXT,
--   totalSeriesOfDoses INTEGER,
--   displayName TEXT,
--   snomedCode INTEGER,
--   dateEntered DATE,
--   procedureCode TEXT,
--   booster BOOLEAN,
--   PRIMARY KEY (NHSNumber, DoseNo),
--   FOREIGN KEY (NHSNumber) REFERENCES Patient(NHSNumber)
-- );

-- CREATE TABLE Appointment (
--   appointmentNumber INTEGER PRIMARY KEY NOT NULL,
--   NHSNumber INTEGER NOT NULL,
--   medicalLicenseNumber INTEGER NOT NULL,
--   dateOfAppointment DATE NOT NULL,
--   timeOfAppointment TIME NOT NULL,
--   appointmentNotes TEXT,
--   FOREIGN KEY (NHSNumber) REFERENCES Patient(NHSNumber),
--   FOREIGN KEY (medicalLicenseNumber) REFERENCES Doctor(medicalLicenseNumber)
-- );

-- CREATE TABLE Patient_Record (
--   patientNo INTEGER PRIMARY KEY NOT NULL,
--   medicalRecords TEXT,
--   NHSNumber INTEGER NOT NULL,
--   accountNumber INTEGER NOT NULL,
--   FOREIGN KEY (NHSNumber) REFERENCES Patient(NHSNumber),
--   FOREIGN KEY (accountNumber) REFERENCES Login_Credential(accountNumber)
-- );


-- INSERT INTO Login_Credential (accountNumber, username, hash, userType)
-- VALUES
--     (10001, 'johndoe', 'xxxxxxxx', 'Doctor'),
--     (10002, 'janedoe', 'yyyyyyyy', 'Doctor'),
--     (10003, 'johnsmith', 'zzzzzzzz', 'Doctor'),
--     (10004, 'janesmith', 'aaaaaaaa', 'Doctor'),
--     (10005, 'bobross', 'bbbbbbbb', 'Admin'),
--     (10006, 'alicejones', 'cccccccc', 'Admin'),
--     (10007, 'davidbrown', 'dddddddd', 'Patient'),
--     (10008, 'marywilson', 'eeeeeeee', 'Patient'),
--     (10009, 'sarahlee', 'ffffffff', 'Patient'),
--     (10010, 'chrisgarcia', 'gggggggg', 'Patient');


-- INSERT INTO User_Information (accountNumber, phoneNumber, emailAddress)
-- VALUES
--     (10001, '555-555-1212', 'johndoe@example.com'),
--     (10002, '555-555-1213', 'janedoe@example.com'),
--     (10003, '555-555-1214', 'johnsmith@example.com'),
--     (10004, '555-555-1215', 'janesmith@example.com'),
--     (10005, '555-555-1216', 'bobross@example.com'),
--     (10006, '555-555-1217', 'alicejones@example.com'),
--     (10007, '555-555-1218', 'davidbrown@example.com'),
--     (10008, '555-555-1219', 'marywilson@example.com'),
--     (10009, '555-555-1210', 'sarahlee@example.com'),
--     (10010, '555-555-1211', 'chrisgarcia@example.com');


-- INSERT INTO Doctor (medicalLicenseNumber, firstName, lastName, dateOfBirth, genderCode, accountNumber)
-- VALUES
--   (123456, 'John', 'Doe', '1980-01-01', 'M', 10001),
--   (234567, 'Jane', 'Doe', '1985-03-15', 'F', 10002),
--   (345678, 'John', 'Smith', '1972-11-30', 'M', 10003),
--   (456789, 'Jane', 'Smith', '1988-06-10', 'F', 10004);


-- INSERT INTO Admin (employeeCode, firstName, lastName, dateOfBirth, genderCode, postcode, accountNumber)
-- VALUES
--   (101, 'bob', 'ross', '1980-01-01', 'M', '12345', 10005),
--   (102, 'Alice', 'Jones', '1985-02-15', 'F', '54321', 10006);


-- INSERT INTO Patient (NHSNumber, forename, surname, personDOB, genderCode, postcode)
-- VALUES
--   (123456890, 'David', 'Brown', '1985-05-22', 'M', 'SW1A 0AA'),
--   (234567901, 'Mary', 'Wilson', '1990-07-12', 'F', 'WC2N 5DU'),
--   (345678012, 'Sarah', 'Lee', '1988-03-01', 'F', 'NW1 6XE'),
--   (456789123, 'Chris', 'Garcia', '1995-12-29', 'M', 'EC1Y 8SY');

-- INSERT INTO Appointment (appointmentNumber, NHSNumber, medicalLicenseNumber, dateOfAppointment, timeOfAppointment, appointmentNotes)
-- VALUES
-- (1, 123456890, 123456, '2023-04-01', '10:00:00', 'Patient complains of persistent headaches.'),
-- (2, 234567901, 234567, '2023-04-02', '14:30:00', 'Patient requires follow-up for recent surgery.'),
-- (3, 345678012, 345678, '2023-04-03', '16:45:00', 'Patient needs referral to specialist.'),
-- (4, 456789123, 456789, '2023-04-04', '11:15:00', 'Patient reports chronic back pain.'),
-- (5, 123456890, 234567, '2023-04-05', '09:00:00', 'Patient has a history of heart disease.'),
-- (6, 234567901, 345678, '2023-04-06', '13:30:00', 'Patient is experiencing respiratory problems.'),
-- (7, 345678012, 456789, '2023-04-07', '15:45:00', 'Patient is recovering from recent surgery.'),
-- (8, 456789123, 123456, '2023-04-08', '12:15:00', 'Patient is due for a routine check-up.');


-- INSERT INTO Patient_Record (patientNo, medicalRecords, NHSNumber, accountNumber)
-- VALUES
-- (1, 'Medical records for patient 1', 123456890, 10007),
-- (2, 'Medical records for patient 2', 234567901, 10008),
-- (3, 'Medical records for patient 3', 345678012, 10009),
-- (4, 'Medical records for patient 4', 456789123, 10010),
-- (5, 'Medical records for patient 1', 123456890, 10007);

-- DELETE FROM patient_record
-- WHERE patientNo = 6;
-- PRAGMA table_info(vaccines);

SELECT * FROM Login_Credential;
SELECT * FROM User_Information;
SELECT * FROM Doctor;
SELECT * FROM Admin;
SELECT * FROM Patient;
SELECT * FROM Appointment;
SELECT * FROM Patient_Record;

-- /* Data for Vaccines table has not been created */

INSERT INTO `patient` (`NHSNumber`, `forename`, `surname`, `personDOB`, `genderCode`, `postcode`) VALUES ('789789', 'Hanck', 'Doe', '1996-04-10', 'M', 'HD7 JT8');



INSERT INTO `patient_record` (`medicalRecords`, `NHSNumber`, `accountNumber`) VALUES ('July 2020: Medical records of patient. Diagnosis: Hypertension. Prescription: Lisinopril 10mg, once daily. Allergies: Penicillin. Next Appointment: 2023-06-02, 2:00 PM. Notes: Patients blood pressure readings consistently above normal range. Started on Lisinopril to manage hypertension. Advised dietary changes and regular exercise. Informed patient about potential side effects and cautioned about allergic reaction to Penicillin. Emphasized the importance of regular follow-up visits to monitor blood pressure levels.', '789789', '10011');


INSERT INTO `patient_record` (`patientNo`, `medicalRecords`, `NHSNumber`, `accountNumber`) VALUES (NULL, 'May 2022: Medical records of patient. Diagnosis: Acute respiratory infection. Prescription: Amoxicillin 500mg, three times daily for 7 days. Allergies: None. Next Appointment: 2023-05-15, 10:30 AM Notes: Patient presented with cough, fever, and shortness of breath. Chest X-ray showed signs of lung infection. Prescribed Amoxicillin for treatment. Advised patient to rest and drink plenty of fluids. Follow-up appointment scheduled for further evaluation.', '789789', '10011');

INSERT INTO `patient_record` (`patientNo`, `medicalRecords`, `NHSNumber`, `accountNumber`) VALUES (NULL, 'September 2022: Medical records of patient. Diagnosis: Diabetes Mellitus Type 2. Prescription: Metformin 1000mg, twice daily. Allergies: None. Next Appointment: 2023-07-10, 9:00 AM. Notes: Patient diagnosed with Diabetes Mellitus Type 2. Prescribed Metformin for glycemic control. Discussed the importance of a balanced diet, regular exercise, and monitoring blood sugar levels. Scheduled follow-up appointment to assess treatment progress and adjust medication if needed.', '789789', '10011');


INSERT INTO Patient_Record (patientNo, medicalRecords, NHSNumber, accountNumber)
VALUES
(NULL, 'Patient Added to GP-SURGERY Local Database', 96937978331, 10012),
(NULL, 'Patient Added to GP-SURGERY Local Database', 96938560901, 10013),
(NULL, 'Patient Added to GP-SURGERY Local Database', 96938554691, 10014),
(NULL, 'Patient Added to GP-SURGERY Local Database', 96937978171, 10015);

INSERT INTO Appointment (appointmentNumber, NHSNumber, medicalLicenseNumber, dateOfAppointment, timeOfAppointment, appointmentNotes)
VALUES
(NULL, 96937978331, 123456, '2022-04-01', '10:00:00', 'Patient complains of persistent headaches.'),
(NULL, 96938560901, 234567, '2022-04-02', '14:30:00', 'Patient requires follow-up for recent surgery.'),
(NULL, 96938554691, 345678, '2022-04-03', '16:45:00', 'Patient needs referral to specialist.'),
(NULL, 96937978171, 456789, '2022-04-04', '11:15:00', 'Patient reports chronic back pain.'),
(NULL, 96937978331, 123456, '2022-11-18', '16:00:00', 'Patient complains of persistent headaches.'),
(NULL, 96938560901, 345678, '2022-11-24', '11:30:00', 'Patient requires follow-up for recent surgery.'),
(NULL, 96938554691, 234567, '2022-11-30', '16:45:00', 'Patient needs referral to specialist.'),
(NULL, 96937978171, 456789, '2022-11-30', '12:15:00', 'Patient reports chronic head pain.'),
(NULL, 96937978331, 456789, '2023-02-19', '15:00:00', 'Patient complains of persistent headaches.'),
(NULL, 96938560901, 345678, '2023-02-23', '12:30:00', 'Patient requires follow-up for recent surgery.'),
(NULL, 96938554691, 234567, '2023-02-15', '13:45:00', 'Patient needs referral to specialist.'),
(NULL, 96937978171, 123456, '2023-02-25', '14:15:00', 'Patient reports chronic head pain.');



INSERT INTO `patient_record` (`medicalRecords`, `NHSNumber`, `accountNumber`) VALUES ('July 2020: Medical records of patient. Diagnosis: Hypertension. Prescription: Lisinopril 10mg, once daily. Allergies: Penicillin. Next Appointment: 2023-06-02, 2:00 PM. Notes: Patients blood pressure readings consistently above normal range. Started on Lisinopril to manage hypertension. Advised dietary changes and regular exercise. Informed patient about potential side effects and cautioned about allergic reaction to Penicillin. Emphasized the importance of regular follow-up visits to monitor blood pressure levels.', '96937978171', '10015');


INSERT INTO `patient_record` (`patientNo`, `medicalRecords`, `NHSNumber`, `accountNumber`) VALUES (NULL, 'May 2022: Medical records of patient. Diagnosis: Acute respiratory infection. Prescription: Amoxicillin 500mg, three times daily for 7 days. Allergies: None. Next Appointment: 2023-05-15, 10:30 AM Notes: Patient presented with cough, fever, and shortness of breath. Chest X-ray showed signs of lung infection. Prescribed Amoxicillin for treatment. Advised patient to rest and drink plenty of fluids. Follow-up appointment scheduled for further evaluation.', '96937978171', '10015');

INSERT INTO `patient_record` (`patientNo`, `medicalRecords`, `NHSNumber`, `accountNumber`) VALUES (NULL, 'September 2022: Medical records of patient. Diagnosis: Diabetes Mellitus Type 2. Prescription: Metformin 1000mg, twice daily. Allergies: None. Next Appointment: 2023-07-10, 9:00 AM. Notes: Patient diagnosed with Diabetes Mellitus Type 2. Prescribed Metformin for glycemic control. Discussed the importance of a balanced diet, regular exercise, and monitoring blood sugar levels. Scheduled follow-up appointment to assess treatment progress and adjust medication if needed.', '96937978171', '10015');