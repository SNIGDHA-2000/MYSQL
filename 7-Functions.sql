CREATE database WORLD;
USE WORLD;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255),
    Population BIGINT,
    Area DECIMAL(10, 0)
);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'Germany', 83000000, 357000),
(4, 'France', 67000000, 551000),
(5, 'Brazil', 212000000, 8516000),
(6, 'India', 1393000000, 3287000),
(7, 'China', 1440000000, 9597000),
(8, 'Australia', 25600000, 7692000),
(9, 'UK', 68200000, 243000),
(10, 'Japan', 125800000, 377900);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(255)
);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 500000, 4.5, 1, 'USA'),
(2, 'Alice', 'Smith', 200000, 4.2, 2, 'Canada'),
(3, 'Hans', 'Zimmer', 100000, 4.7, 3, 'Germany'),
(4, 'Marie', 'Curie', 150000, 4.8, 4, 'France'),
(5, 'Carlos', 'Silva', 300000, 4.3, 5, 'Brazil'),
(6, 'Amit', 'Kumar', 600000, 4.6, 6, 'India'),
(7, 'Li', 'Wang', 750000, 4.9, 7, 'China'),
(8, 'Emma', 'Brown', 180000, 4.1, 8, 'Australia'),
(9, 'Oliver', 'Jones', 220000, 4.0, 9, 'UK'),
(10, 'Sakura', 'Tanaka', 170000, 4.4, 10, 'Japan');

-- 1. Add a new column called DOB in Persons table with data type as Date. 
ALTER TABLE Persons
ADD COLUMN DOB DATE;

select * from Persons;
UPDATE Persons SET DOB = '1985-05-15' WHERE Id = 1;  -- John Doe
UPDATE Persons SET DOB = '1990-11-22' WHERE Id = 2;  -- Alice Smith
UPDATE Persons SET DOB = '1970-03-01' WHERE Id = 3;  -- Hans Zimmer
UPDATE Persons SET DOB = '1867-11-07' WHERE Id = 4;  -- Marie Curie
UPDATE Persons SET DOB = '1992-07-20' WHERE Id = 5;  -- Carlos Silva
UPDATE Persons SET DOB = '1988-01-25' WHERE Id = 6;  -- Amit Kumar
UPDATE Persons SET DOB = '1975-09-03' WHERE Id = 7;  -- Li Wang
UPDATE Persons SET DOB = '1995-04-10' WHERE Id = 8;  -- Emma Brown
UPDATE Persons SET DOB = '1980-12-05' WHERE Id = 9;  -- Oliver Jones
UPDATE Persons SET DOB = '1993-02-14' WHERE Id = 10; -- Sakura Tanaka

-- 2. Write a user-defined function to calculate age using DOB. 
DELIMITER //

CREATE FUNCTION CalculateAge(dob_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob_date, CURDATE());
END //

DELIMITER ;


-- 3. Write a select query to fetch the Age of all persons using the function that has been created. 

SELECT
    Id,
    Fname,
    Lname,
    DOB,
    CalculateAge(DOB) AS Age
FROM
    Persons;

-- 4. Find the length of each country name in the Country table. 
SELECT
    Country_name,
    LENGTH(Country_name) AS CountryNameLength -- Use LEN(Country_name) for SQL Server
FROM
    Country;

-- 5. Extract the first three characters of each countrys name in the Country table. 
SELECT
    Country_name,
    SUBSTRING(Country_name, 1, 3) AS FirstThreeChars -- Use SUBSTR(Country_name, 1, 3) for Oracle
FROM
    Country;



-- 6. Convert all country names to uppercase and lowercase in the Country table.

SELECT
    Country_name,
    UPPER(Country_name) AS UppercaseCountryName,
    LOWER(Country_name) AS LowercaseCountryName
FROM
    Country;