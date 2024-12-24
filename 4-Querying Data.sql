-- CREATE DATABASE
CREATE DATABASE WORLD;

USE WORLD;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
-- Insert 10 rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 330000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'UK', 67000000, 242500),
(4, 'India', 1400000000, 3287000),
(5, 'Australia', 26000000, 7692000),
(6, 'USA', 65000000, 87659000),
(7, 'Australia', 56000000, 754000),
(8, 'Canada', 34000000, 453000),
(9, 'UK', 32000000, 128000),
(10, 'India', 95000000, 396000);

-- Insert 10 rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 1000, 4.5, 1, 'USA'),
(2, 'Emma', 'Smith', 500, 3.8, 2, 'Canada'),
(3, 'Alice', 'Johnson', 2000, 4.2, 3, 'UK'),
(4, 'Bob', 'Brown', 1500, 4.7, 1, 'USA'),
(5, 'Charlie', 'Davis', 800, 3.5, 4, 'India'),
(6, 'David', 'Miller', 1200, 4.0, 5, 'Australia'),
(7, 'Emily', 'Wilson', 600, 4.9, 2, 'Canada'),
(8, 'Frank', 'Taylor', 900, 3.2, 3, 'UK'),
(9, 'Grace', 'Anderson', 1100, 4.6, 1, 'USA'),
(10, 'Harry', 'Thomas', 700, 3.9, 4, 'India');

-- 1. List the distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

-- 2. Select first names and last names from the Persons table with aliases.
SELECT Fname AS FirstName, Lname AS LastName FROM Persons;

-- 3. Find all persons with a rating greater than 4.0.
SELECT * FROM Persons WHERE Rating > 4.0;

-- 4. Find countries with a population greater than 10 lakhs.
SELECT * FROM Country WHERE Population > 1000000;

-- 5. Find persons who are from 'USA' or have a rating greater than 4.5.
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- 6. Find all persons where the country name is NULL.
SELECT * FROM Persons WHERE Country_name IS NULL;

-- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'.
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 8. Find all persons not from the countries 'India' and 'Australia'.
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- 9. Find all countries with a population between 5 lakhs and 20 lakhs.
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- 10. Find all countries whose names do not start with 'C'.
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';



