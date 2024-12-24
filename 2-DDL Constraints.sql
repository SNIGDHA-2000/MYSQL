-- Create Database and Table
CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255) NOT NULL,
    Product_Category VARCHAR(255),
    Ordered_Item VARCHAR(255) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE
);

SELECT * FROM SALES_ORDERS;

-- 1. Add a new column
ALTER TABLE Orders ADD order_quantity INT;

-- 2. Rename the table
ALTER TABLE Orders RENAME TO sales_orders;

-- 3. Insert 10 rows 
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_Item, Contact_No, order_quantity)
VALUES
(1,'John Doe', 'Electronics', 'Laptop', '1234567890', 2),
(2,'Jane Smith', 'Books', 'Novel', '9876543210', 1),
(3,'John Wick','clothing','Shirt','85319864532',3),
(4,'Ben Terry','books','text book','4215790653',2),
(5,'henry parker','electronics','smart phone','7548032174',1),
(6,'denise frank','electronics','fridge','9876543212',1),
(7,'ben ten','accessory','watch','12345678901',4),
(8,'mr bean','toy','teddy bear','6543210987',1),
(9,'tom jerry','electronics','television','1111111111',5),
(10, 'Alice Lee', 'Clothing', 'T-shirt', '5555555555', 3);

-- 4. Retrieve data

SELECT Customer_name, Ordered_Item FROM sales_orders;

-- 5. Update product name

UPDATE sales_orders 
SET Ordered_Item = 'Smartphone'
WHERE Order_Id = 1;

-- 6. Delete the table

DROP TABLE sales_orders;
