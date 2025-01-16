CREATE TABLE therapists (
    Therapist_Number INT(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Patient_Number INT(4) NOT NULL,
    Therapist_Name VARCHAR(100) NOT NULL,
    Therapist_Address VARCHAR(200),
    CONSTRAINT fk_patient FOREIGN KEY (Patient_Number) REFERENCES patients (Patient_Number) ON DELETE CASCADE
);