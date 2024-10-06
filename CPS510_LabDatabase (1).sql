-- Create table for Employee
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_SIN VARCHAR(15) NOT NULL UNIQUE,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255),
    Salary DECIMAL(10, 2)
);

-- Create table for Patient
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    HC_Number VARCHAR(50)
);

-- Create table for Medical Professional
CREATE TABLE Medical_Professional (
    Medical_ID INT PRIMARY KEY,
    Emp_ID INT,
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

-- Create table for Receptionist (inherits from Employee)
CREATE TABLE Receptionist (
    Emp_ID INT PRIMARY KEY,
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

-- Create table for Doctor (inherits from Medical Professional)
CREATE TABLE Doctor (
    Medical_ID INT PRIMARY KEY,
    Specialty VARCHAR(255),
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Professional(Medical_ID)
);

-- Create table for Nurse (inherits from Medical Professional)
CREATE TABLE Nurse (
    Medical_ID INT PRIMARY KEY,
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Professional(Medical_ID)
);

-- Create table for Medical Record
CREATE TABLE Medical_Record (
    Medical_Record_ID INT PRIMARY KEY,
    Patient_ID INT,
    Medical_History CLOB,
    Condition VARCHAR2(255),
    Allergies VARCHAR2(255),
    Height DECIMAL(5, 2),
    Weight DECIMAL(5, 2),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

-- Create table for Updates (M:N relationship between Medical Record and Medical Professional)
CREATE TABLE Updates (
    Medical_Record_ID INT,
    Medical_ID INT,
    Update_ID INT PRIMARY KEY,
    FOREIGN KEY (Medical_Record_ID) REFERENCES Medical_Record(Medical_Record_ID),
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Professional(Medical_ID)
);

-- Create table for Prescription
CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY,
    Medical_ID INT,
    HC_Number VARCHAR(50),
    Name VARCHAR(255),
    Dosage VARCHAR(255),
    Frequency VARCHAR(255),
    Patient_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Medical_ID) REFERENCES Doctor(Medical_ID)
);

-- Create table for Appointment
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Room_Number INT,
    Medical_ID INT,
    Appointment_Date TIMESTAMP,
    Reason VARCHAR(255),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Professional(Medical_ID)
);

-- Create table for Lab Test
CREATE TABLE Lab_Test (
    Test_ID INT PRIMARY KEY,
    Test_Type VARCHAR(255),
    Test_Result VARCHAR2(255),
    Doctor_ID INT,
    Patient_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Medical_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


