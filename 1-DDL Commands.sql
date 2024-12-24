-- Create the database
CREATE DATABASE School;

-- Use the database
USE School;

-- Create the table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1));

-- INSERTING VALUES TO TABLE
-- adding values to the table

INSERT INTO STUDENT VALUES (1, 'John', 75, 'A');
INSERT INTO STUDENT VALUES (2, 'Mary', 93, 'B');
INSERT INTO STUDENT VALUES (3, 'Peter', 85, 'C');

-- 1. To Display the table

SELECT * FROM CLASSTEN;

-- 2. Add a column

ALTER TABLE STUDENT ADD Contact VARCHAR(15);

-- 3. Remove a column

ALTER TABLE STUDENT DROP COLUMN Grade;

-- 4. Rename the table

RENAME TABLE STUDENT TO CLASSTEN;

-- 5. Delete all rows

TRUNCATE TABLE CLASSTEN;

-- 6. Remove the table

DROP TABLE CLASSTEN;
