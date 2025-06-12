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

-- 1. Find the number of persons in each country. 
SELECT Country_name,
COUNT(Id) AS NumberOfPersons
FROM Persons
GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low. 
SELECT Country_name,
COUNT(Id) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
SELECT Country_name,
AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA. 
SELECT P.Country_name,P.Rating
FROM Persons P
WHERE P.Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations. 
SELECT Country_name,Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
    
    CREATE database sales ;
USE sales;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone_no VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'Alice', 'Smith', 'alice.s@example.com', '123-456-7890', '123 Main St', 'Los Angeles', 'CA', '90001', 'USA'),
(2, 'Bob', 'Johnson', 'bob.j@example.com', '987-654-3210', '456 Oak Ave', 'New York', 'NY', '10001', 'USA'),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', '555-123-4567', '789 Pine Ln', 'Houston', 'TX', '77001', 'USA'),
(4, 'Diana', 'Miller', 'diana.m@example.com', '111-222-3333', '101 Elm Rd', 'San Francisco', 'CA', '94101', 'USA'),
(5, 'Eve', 'Davis', 'eve.d@example.com', '444-555-6666', '202 Birch Ct', 'Chicago', 'IL', '60601', 'USA'),
(6, 'Frank', 'Garcia', 'frank.g@example.com', '777-888-9999', '303 Cedar Blvd', 'Miami', 'FL', '33101', 'USA'),
(7, 'Grace', 'Rodriguez', 'grace.r@example.com', '222-333-4444', '404 Willow Dr', 'Seattle', 'WA', '98101', 'USA'),
(8, 'Heidi', 'Martinez', 'heidi.m@example.com', '666-777-8888', '505 Maple Pkwy', 'Boston', 'MA', '02108', 'USA'),
(9, 'Ivan', 'Hernandez', 'ivan.h@example.com', '999-000-1111', '606 Spruce St', 'Dallas', 'TX', '75201', 'USA'),
(10, 'Judy', 'Lopez', 'judy.l@example.com', '333-444-5555', '707 Poplar Cir', 'Denver', 'CO', '80201', 'USA'),
(11, 'Kevin', 'Scott', 'kevin.s@example.com', '123-123-1234', '808 Fir Ave', 'San Diego', 'CA', '92101', 'USA'),
(12, 'Liam', 'White', 'liam.w@example.com', '456-456-4567', '909 Palm St', 'London', 'ENG', 'SW1A 0AA', 'UK'),
(13, 'Mia', 'Green', 'mia.g@example.com', '789-789-7890', '111 King St', 'Toronto', 'ON', 'M5V 2L9', 'Canada'),
(14, 'Noah', 'Black', 'noah.b@example.com', '111-111-1111', '222 Queen Rd', 'Los Angeles', 'CA', '90002', 'USA'),
(15, 'Olivia', 'King', 'olivia.k@example.com', '222-222-2222', '333 Prince Ln', 'Sacramento', 'CA', '95814', 'USA'),
(16, 'Peter', 'Wright', 'peter.w@example.com', '333-333-3333', '444 Duke Dr', 'Los Angeles', 'CA', '90003', 'USA');

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name,Email FROM Customer;
    
    SELECT *FROM customer_info;
    
-- 2. Create a view named US_Customers that displays customers located in the US. 
CREATE VIEW US_Customers AS 
SELECT*FROM Customer WHERE Country = 'USA';
SELECT *FROM US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email,Phone_no,State FROM Customer;
    SELECT *FROM Customer_details;
    
-- 4. Update phone numbers of customers who live in California for Customer_details view. 
UPDATE Customer SET Phone_no = '555-999-XXXX'WHERE State = 'CA';
SELECT *FROM Customer_details;

-- 5. Count the number of customers in each state and show only states with more than 5 customers. 
SELECT State,COUNT(Customer_Id) AS NumberOfCustomers FROM Customer GROUP BY State HAVING COUNT(Customer_Id) > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
SELECT State,COUNT(Full_Name) AS NumberOfCustomers FROM Customer_details GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT*FROM Customer_details ORDER BY State ASC;
