CREATE DATABASE  library;
USE library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);
INSERT INTO Branch VALUES 
(1, 101, 'MG Road, Kochi', '9999988888'),
(2, 102, 'Beach Road, Kollam', '8888877777');

SELECT * FROM Branch;

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary INT,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee VALUES
(101, 'Anjali', 'Manager', 70000, 1),
(102, 'Ravi', 'Clerk', 30000, 1),
(103, 'Meera', 'Manager', 60000, 2),
(104, 'Kiran', 'Assistant', 40000, 2),
(105, 'Divya', 'Clerk', 25000, 1),
(106, 'Arun', 'Assistant', 48000, 2);
SELECT * FROM employee;
CREATE TABLE Books (
    ISBN VARCHAR(10) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price INT,
    Status VARCHAR(3), -- 'Yes' or 'No'
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);
INSERT INTO Books VALUES
('B001', 'History of India', 'History', 30, 'No', 'Author A', 'Pub A'),
('B002', 'Python Basics', 'Technology', 45, 'Yes', 'Author B', 'Pub B'),
('B003', 'World War II', 'History', 35, 'No', 'Author C', 'Pub C'),
('B004', 'Data Science', 'Technology', 50, 'Yes', 'Author D', 'Pub D'),
('B005', 'History of Kerala', 'History', 25, 'Yes', 'Author E', 'Pub E');
SELECT * FROM Books;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);
INSERT INTO Customer VALUES
(201, 'Lakshmi', 'Kochi', '2021-05-10'),
(202, 'George', 'Alleppey', '2022-03-15'),
(203, 'Anu', 'Kollam', '2021-12-30');
SELECT * FROM customer;
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(10),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus VALUES
(301, 201, 'History of India', '2023-06-15', 'B001'),
(302, 202, 'Python Basics', '2023-06-20', 'B002');
SELECT * FROM issuestatus;
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(10),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus VALUES
(401, 201, 'History of India', '2023-07-10', 'B001');
SELECT * FROM returnstatus;

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';

-- 2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
 SELECT Issued_book_name, Customer_name FROM IssueStatus JOIN Customer ON Issued_cust = Customer_Id;

-- 4. Display the total count of books in each category. 
SELECT Category, COUNT(*) FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023. 
SELECT Customer_name FROM IssueStatus JOIN Customer ON Issued_cust = Customer_Id WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book_title from book table containing history. 
SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT Branch_no, COUNT(*) FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
SELECT Emp_name, Branch_address FROM Branch JOIN Employee ON Manager_Id = Emp_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT Customer_name FROM IssueStatus JOIN Books ON IssueStatus.Isbn_book = Books.ISBN JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id WHERE Rental_Price > 25;
