-- CREATE DATABASE
CREATE database WORLD;
USE WORLD;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population BIGINT,
    Area FLOAT
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


select * from Country;
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50)
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

select * from Persons;

-- 1.Write an SQL query to print the first three characters of Country_name from the Country table. 

SELECT SUBSTRING(Country_name, 1, 3)
FROM Country;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.
SELECT CONCAT(Fname, ' ', Lname) AS FullName
FROM Persons;

-- 3. Write an SQL query to count the number of unique country names from Persons table. 
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries
FROM Persons;

-- 4. Write a query to print the maximum population from the Country table.
SELECT MAX(Population) AS MaxCountryPopulation
FROM Country;

-- 5. Write a query to print the minimum population from Persons table.
SELECT MIN(Population) AS MinPersonPopulation
FROM Persons;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
-- Insert 2 new rows with NULL Lname into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(13, 'Grace', NULL, 120000, 3.5, 1, 'USA'),
(14, 'Frank', NULL, 90000, 3.2, 2, 'Canada');

-- 7. Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) AS NumberOfRowsInPersons
FROM Persons;

-- 8. Write an SQL query to show the population of the Country table for the first 3 rows.
SELECT Population
FROM Country
LIMIT 3;


-- 9. Write a query to print 3 random rows of countries.
SELECT Id, Country_name, Population, Area
FROM Country
ORDER BY RAND()
LIMIT 3;


-- 10. List all persons ordered by their rating in descending order. 
SELECT Id, Fname, Lname, Rating
FROM Persons
ORDER BY Rating DESC;

 -- 11. Find the total population for each country in the Persons table
 SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name;
 
 -- 12. Find countries in the Persons table with a total population greater than 50,000
 SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;
 
 -- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
 SELECT Country_name, COUNT(Id) AS NumberOfPersons, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(Id) > 2
ORDER BY AverageRating ASC;