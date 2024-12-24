-- Create DATABASE 
CREATE DATABASE OFFICE;

USE OFFICE;

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18),
    Last_Update date,
    Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
    );
    
-- 1. Insert 10 rows
INSERT INTO Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Last_Update, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1980-01-01', 44, '2024-01-01', 'M', 'IT', 30000),
(2, 'Jane', 'Smith', '1985-02-15', 39, '2024-06-01', 'F', 'HR', 25000),
(3, 'Aaliya', 'Khan', '1990-03-20', 34, '2024-09-01', 'F', 'Marketing', 28000),
(4, 'Robert', 'Brown', '1970-04-25', 54, '2024-04-01', 'M', 'Finance', 35000),
(5, 'Sheldon', 'Haiz', '1990-05-01', 34, '2024-05-01', 'M', 'Sales', 40000),
(6, 'Amy', 'Farafoller', '1991-06-14', 33, '2024-06-01', 'F', 'Marketing', 42000),
(7, 'Ricardo', 'Torres', '1992-07-23', 32, '2024-07-01', 'M', 'Engineering', 45000),
(8, 'Ali', 'Zoukayya', '1993-08-12', 31, '2024-08-01', 'M', 'Finance', 38000),
(9, 'John', 'Smith', '1994-09-04', 30, '2024-09-01', 'M', 'IT', 32000),
(10, 'Emma', 'Watson', '1980-10-15', 44, '2024-10-01', 'F', 'HR', 27000);

SELECT * FROM MANAGERS;

-- 2. Retrieve name and DOB of manager with Manager_Id 1

SELECT First_Name, Last_Name, DOB
FROM Managers 
WHERE Manager_Id = 1;

-- 3. Display annual income of all managers

SELECT First_Name, Last_Name, Salary * 12 AS Annual_Income
FROM Managers; 

-- 4. Display records of all managers except 'Aaliya'
SELECT * FROM Managers 
WHERE First_Name <> 'Aaliya';

-- 5. Display details of managers in IT with salary > 25000
SELECT * FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

-- 6. Display details of managers with salary between 10000 and 35000
SELECT * FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;
