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

-- (1)Perform inner join, Left join, and Right join on the tables.
SELECT C.Country_name AS Country,P.Fname,P.Lname FROM Country AS C INNER JOIN Persons AS P ON C.Id = P.Country_Id;
    
SELECT C.Country_name AS Country,P.Fname,P.Lname FROM Country AS C LEFT JOIN Persons AS P ON C.Id = P.Country_Id;

SELECT C.Country_name AS Country,P.Fname,P.Lname FROM Country AS C RIGHT JOIN Persons AS P ON C.Id = P.Country_Id;

--  (2)List all distinct country names from both the Country and Persons tables.
 SELECT Country_name FROM Country UNION SELECT Country_name FROM Persons;

-- (3)List all country names from both the Country and Persons tables, including duplicates. 
SELECT Country_name FROM Country UNION ALL SELECT Country_name FROM Persons;

-- (4)Round the ratings of all persons to the nearest integer in the Persons table.
SELECT Id,Fname,Lname,Rating, ROUND(Rating) AS RoundedRating FROM Persons;
