-- This query calculates the total salary for each unique job title, helping the clinic manage payroll expenses across different roles.
SELECT DISTINCT Emp_ID, SUM(Salary) AS Total_Salary
FROM Employee
GROUP BY Emp_ID
ORDER BY Total_Salary DESC;

-- Shows the distribution of patients by gender, helping the clinic analyze its patient demographic breakdown.
SELECT DISTINCT Gender, COUNT(Patient_ID) AS Patient_Count
FROM Patient
GROUP BY Gender
ORDER BY Patient_Count DESC;

-- Displays Employee ID with their associtaed medical ID
SELECT Emp_ID, Medical_ID
FROM Medical_Professional;

-- Shows a list of all unique receptionists in the clinic, ordered by employee ID, for front-desk management.
SELECT Emp_ID
FROM Receptionist
ORDER BY Emp_ID;

-- Shows how many doctors specialize in different fields, allowing the clinic to balance its specialization focus.
SELECT DISTINCT Specialty, COUNT(Medical_ID) AS Doctor_Count
FROM Doctor
GROUP BY Specialty
ORDER BY Doctor_Count DESC;

-- Displays how many nurses are available in the clinic, helping with staffing and resource allocation.
SELECT DISTINCT Medical_ID, COUNT(Medical_ID) AS Nurse_Count
FROM Nurse
GROUP BY Medical_ID
ORDER BY Nurse_Count DESC;

-- Displays the Patient ID with their Name and Dosage for easy viewing of patient data
SELECT Patient_ID, Name, Dosage
FROM Prescription;

-- Shows which patients have the most appointments, allowing the clinic to monitor frequent visitors and plan resources accordingly.
SELECT DISTINCT Patient_ID, COUNT(Appointment_ID) AS Appointment_Count
FROM Appointment
GROUP BY Patient_ID
ORDER BY Appointment_Count DESC;

-- This Medical Record Query checks for patients with Obesity, and it displays their height and weight for verification
-- We Order By Lightest to Heaviest
SELECT Patient_ID, Height AS Height_CM, Weight AS Weight_KG, Condition
FROM Medical_Record
WHERE Condition LIKE '%Obesity%'
ORDER BY Weight;

-- Check Which Medical Proffesional has Been updating the records, to keep in track of how consistent each medical proffesional is
SELECT Medical_id, COUNT(Update_id) AS Update_Count
FROM Updates
GROUP BY Medical_id
ORDER BY Update_count;

-- Check the Number of Results each lab test result has, this will allow the clinic to correctly stock up on the 
SELECT Test_result AS Status, COUNT(*) AS Result_Count
FROM Lab_test
GROUP BY Test_result
ORDER BY Result_Count DESC;

