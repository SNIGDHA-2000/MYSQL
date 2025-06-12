CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);
-- 1.Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_worker_id INT,
    IN p_first_name CHAR(25),
    IN p_last_name CHAR(25),
    IN p_salary INT,
    IN p_joining_date DATETIME,
    IN p_department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_worker_id, p_first_name, p_last_name, p_salary, p_joining_date, p_department);
END //

DELIMITER ;

CALL AddWorker(101, 'John', 'Doe', 60000, '2023-01-15 09:00:00', 'HR');
CALL AddWorker(102, 'Jane', 'Smith', 75000, '2022-03-20 10:30:00', 'IT');
CALL AddWorker(103, 'Peter', 'Jones', 50000, '2024-06-01 08:45:00', 'HR');

SELECT * FROM Worker;
-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 

DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_worker_id INT,
    OUT p_salary INT
)
BEGIN
    SELECT Salary INTO p_salary
    FROM Worker
    WHERE Worker_Id = p_worker_id;
END //

DELIMITER ;

SET @workerSalary = 0; 
CALL GetWorkerSalary(102, @workerSalary);
SELECT @workerSalary AS 'Worker Salary';

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 

DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_worker_id INT,
    IN p_department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_department
    WHERE Worker_Id = p_worker_id;
END //

DELIMITER ;
CALL UpdateWorkerDepartment(101, 'Marketing');
SELECT * FROM Worker WHERE Worker_Id = 101;
-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 

DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_department;
END //

DELIMITER ;
SET @countHR = 0;
CALL GetWorkerCountByDepartment('HR', @countHR);
SELECT @countHR AS 'Number of Workers in HR';

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER //

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_department CHAR(25),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_department;
END //

DELIMITER ;

SET @avgITSalary = 0.00;
CALL GetAverageSalaryByDepartment('IT', @avgITSalary);
SELECT @avgITSalary AS 'Average IT Salary';
