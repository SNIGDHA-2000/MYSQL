CREATE database school;
USE school;

-- Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Insert 8 rows into the teachers table
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Smith', 'Math', 8, 60000.00),
('Bob Johnson', 'Science', 12, 75000.00),
('Charlie Brown', 'English', 5, 55000.00),
('Diana Miller', 'History', 15, 80000.00),
('Eve Davis', 'Art', 3, 50000.00),
('Frank White', 'Computer Science', 10, 70000.00),
('Grace Lee', 'Math', 7, 62000.00),
('Harry Wilson', 'Science', 9, 68000.00);
SELECT * FROM teachers;

-- 2.Create a before insert trigger (before_insert_teacher) to validate salary.This trigger will stop an INSERT operation if the salary is negative.

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END;
//

DELIMITER ;

INSERT INTO teachers (id, name, subject, experience, salary) VALUES (9, 'Ivy', 'Art', 4, -20000);

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 
CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;
//

DELIMITER ;
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (9, 'Ivy', 'Art', 4, 39000);
SELECT * FROM teacher_log;

-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 
DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with experience greater than 10 years';
    END IF;
END;
//

DELIMITER ;
DELETE FROM teachers WHERE id = 4;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;
//

DELIMITER ;

DELETE FROM teachers WHERE id = 1;
SELECT * FROM teacher_log;





