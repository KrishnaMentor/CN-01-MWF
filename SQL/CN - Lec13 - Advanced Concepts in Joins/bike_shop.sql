CREATE DATABASE bike_shop;
DROP DATABASE codingninja;
DROP database shop;
DROP DATABASE bikeshop;

SHOW DATABASES;
USE bike_shop;
SELECT DATABASE();
SHOW TABLES;
DESC Customers;

SELECT * FROM Customers;

SELECT 
	FirstName , MaritalStatus , Gender , AnnualIncome 
FROM Customers;


SELECT 
	FirstName , Gender , AnnualIncome , Occupation 
FROM Customers 
WHERE Gender = "M" 
LIMIT 10;

DESC Customers;

SELECT 
FirstName , HomeOwner, Gender , Occupation
FROM Customers 
WHERE MaritalStatus = "M"
LIMIT 10;

SELECT 
FirstName , LastName, Gender , MaritalStatus , Occupation, AnnualIncome
FROM Customers 
WHERE MaritalStatus = "M" 
AND Gender = "F"
LIMIT 10;

SELECT 
Prefix, FirstName , LastName, Gender , MaritalStatus , Occupation
FROM Customers 
WHERE Prefix = "Mrs."
LIMIT 10;

DESC Products;
SELECT 
	ProductName , ProductSize, ProductCost, ProductPrice
FROM Products
WHERE productPrice > 1000;

SELECT  
FirstName , LastName, Gender ,TotalChildren, MaritalStatus , Occupation
FROM Customers 
WHERE TotalChildren <> 5
ORDER BY TotalChildren ASC;


SELECT 
Prefix, FirstName , LastName, Gender , MaritalStatus , Occupation
FROM Customers 
WHERE Prefix = "Mrs."
LIMIT 10 OFFSET 10;

SELECT 
Prefix, FirstName , LastName, Gender , EducationLevel, Occupation
FROM Customers 
WHERE Occupation = "Professional" 
	AND EducationLevel = "Bachelors"
LIMIT 10 OFFSET 10;

SELECT 
Prefix, FirstName , LastName, Gender , MaritalStatus, TotalChildren
FROM Customers 
WHERE MaritalStatus = 'M' 
	AND TotalChildren = 0
LIMIT 10 OFFSET 10;

SELECT 
Prefix, FirstName , LastName, Gender , HomeOwner, TotalChildren
FROM Customers 
WHERE HomeOwner = 'Y' 
	AND TotalChildren = 0
LIMIT 10 OFFSET 10;

SELECT 
Prefix, FirstName , LastName, Gender , HomeOwner, TotalChildren
FROM Customers 
WHERE NOT HomeOwner = 'Y' 
LIMIT 10;


SELECT 
Prefix, FirstName , LastName, Gender 
FROM Customers 
WHERE FirstName NOT LIKE "S%" 
LIMIT 10;

SELECT 
Prefix, FirstName , LastName, Gender 
FROM Customers 
WHERE LastName LIKE "%A_G" 
LIMIT 10;

SELECT 
  Prefix, FirstName, LastName, Gender 
FROM Customers 
WHERE 
  (
    LOWER(LEFT(FirstName, 1)) LIKE 'a' OR
    LOWER(LEFT(FirstName, 1)) LIKE 'e' OR
    LOWER(LEFT(FirstName, 1)) LIKE 'i' OR
    LOWER(LEFT(FirstName, 1)) LIKE 'o' OR
    LOWER(LEFT(FirstName, 1)) LIKE 'u'
  )
  AND
  (
    LOWER(RIGHT(FirstName, 1)) LIKE 'a' OR
    LOWER(RIGHT(FirstName, 1)) LIKE 'e' OR
    LOWER(RIGHT(FirstName, 1)) LIKE 'i' OR
    LOWER(RIGHT(FirstName, 1)) LIKE 'o' OR
    LOWER(RIGHT(FirstName, 1)) LIKE 'u'
  )
LIMIT 10;


SELECT 
Prefix, FirstName , LastName, Gender 
FROM Customers 
WHERE LEFT(FirstName,1) IN ('a','e','i','o','u') AND
RIGHT(FirstName,1) IN ('a','e','i','o','u');

SELECT 
  Prefix, FirstName, LastName, Gender 
FROM Customers 
WHERE 
  FirstName REGEXP '^[aeiou].*[aeiou]$';
  
  
SELECT 
	ProductName, PrdouctSKU , ProductColor , ProductSize, ProductCost, ProductPrice 
FROM Products
WHERE productCost > 1000
ORDER BY 5 DESC, 3 ASC;

DESC Customers;

/* 
SELECT 
	CONCAT(FirstName, " ", LastName) AS FullName, -- fullName is used to save space.
    MaritalStatus, Gender, AnnualIncome,
    TotalChildren, EducationLevel
FROM Customers
LIMIT 10;
*/

CREATE TABLE Employees(
	EmployeeID INT auto_increment,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2),
    BirthDate DATE NOT NULL,
    Gender CHAR(1),
    PhoneNumber BIGINT,
    Active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(EmployeeID),
    UNIQUE(Email, PhoneNumber)
);

INSERT INTO Employees
VALUES(123232,"Debasis","Saha","debasis.saha@gmail.com", 99999.99, '1995-01-10','M',982987923,0);

DESCRIBE Employees;
-- Insertion Command to fill some data in Employees Table;
-- Single Insertion.
INSERT INTO Employees(EmployeeID,FirstName, LastName, Email, Salary, BirthDate)
VALUES(1212121,"Abhishek","Behal"," abhishek@google.com",56560.56,"1991-01-01");
-- yyyy-mm-dd;

INSERT INTO Employees(FirstName, LastName, Email, Salary, BirthDate)
VALUES ('Riya', 'Sharma', 'riya.sharma@example.com', 62500.00, '1993-07-15'), 
('Rahul', 'Verma', 'rahulv@gmail.com', 51000.75, '1989-12-05'), 
('Neha', 'Kapoor', 'neha.kapoor@company.com', 72000.00, '1990-03-22'), 
('Aman', 'Singh', 'aman.singh@yahoo.com', 58000.10, '1992-10-10');

INSERT INTO Employees(FirstName, Email, BirthDate, EmployeeID, LastName)
VALUES("Krishna","krishna@gmail.com", "1990-01-01", 132332,"Madan");

INSERT INTO Employees(EmployeeID, FirstName, LastName, Email, Salary, BirthDate,active)
VALUES (12, 'Vineet', 'Dhaka', 'vineet.Dhaka@example.com', 62500.00, '1993-07-15',0); 

INSERT INTO Employees(EmployeeID, FirstName, LastName, Email, Salary, BirthDate)
VALUES (14, 'Vineet', 'Dholakiya', 'vineet.Dhaka@example.com', 62500.00, '1993-07-15'); 

-- Backup Table or Filter Table
CREATE TABLE CustomerDetails AS 
SELECT * FROM Customers;

-- UPDATE COMMAND

UPDATE Customers
SET HomeOwner = "Y"
WHERE CustomerKey = 11588;

SELECT CustomerKey , FirstName , LastName , EmailAddress , HomeOwner, Occupation
FROM CustomerDetails WHERE LastName = "Mehta";

UPDATE CustomerDetails
SET EmailAddress = "Mehta@learnsector"
WHERE LastName = "Mehta";

UPDATE CustomerDetails
SET HomeOwner = "Y";

-- DELETE Command [CustomerDetails]
DELETE FROM CustomerDetails 
WHERE CustomerKey = 11000;

DELETE FROM CustomerDetails 
WHERE LastName = "Mehta";

 SELECT CustomerKey , FirstName , LastName , EmailAddress , HomeOwner, Occupation
 FROM CustomerDetails WHERE LastName = "Mehta";
 
 
 SELECT CustomerKey , Prefix , FirstName , LastName , EmailAddress , HomeOwner, Occupation 
 FROM Customers WHERE Prefix = "";
 
 SELECT CustomerKey , Prefix , FirstName , LastName , Gender, EmailAddress , HomeOwner, Occupation 
 FROM Customers WHERE Prefix IS NULL;
 
 SELECT CustomerKey , Prefix , FirstName , LastName , Gender, EmailAddress , HomeOwner, Occupation 
 FROM Customers WHERE GENDER = "NA";
 
 -- UPDATE 
 UPDATE Customers 
 SET Prefix = NULL
 WHERE Prefix = "";
 
 -- ALTER COMMAND 
 ALTER TABLE Customers
 ADD PRIMARY KEY(CustomerKey);
 
 ALTER TABLE Customers
 ADD COLUMN COUNTRY VARCHAR(50);
 
 ALTER TABLE Customers 
 DROP COLUMN COUNTRY;
 
 ALTER TABLE Customers
 ADD COLUMN COUNTRY VARCHAR(50)
 AFTER MaritalStatus;
 
ALTER TABLE Customers 
MODIFY COLUMN EmailAddress VARCHAR(100);

-- RENAME Column
ALTER TABLE Customers
RENAME COLUMN BirthDate TO DateOfBirth;

-- DROP COLUMN 
ALTER TABLE Customers
DROP COLUMN MyUnknownColumn;

-- STRING Operations
SELECT LENGTH("KrishnaMadan");
SELECT 
	EmailAddress,
    LENGTH(EmailAddress) AS Length_of_an_email 
FROM Customers LIMIT 10; 

SELECT LENGTH("NULL");
SELECT LENGTH(NULL);

-- TRIM()
SELECT TRIM("   Coding Ninja");
SELECT TRIM(BOTH '$' FROM "$$$Coding Ninja$$$") as trimmed_data;
SELECT TRIM(BOTH '@' FROM "@@@@Krishnamadan77@gmail.com@@@@@") as trimmed_data;

-- LTRIM()
SELECT LTRIM("     Hello         ");
-- RTRIM()
SELECT RTRIM("     Hello         ");

-- CONCAT 
SELECT 
	CONCAT(Prefix , ' ' , FirstName , ' ', LastName) AS FullName
FROM Customers
LIMIT 10;

-- CONCAT_WS 
SELECT 
	CONCAT_WS(' -> ', Prefix , FirstName , LastName) AS FullName
FROM Customers
LIMIT 10;

-- Creating a New column Name FullName;
ALTER TABLE Customers
ADD Column FullName Varchar(100)
AFTER LastName;

-- MODIFY/Updating the existing data
UPDATE Customers
SET FullName = CONCAT(FirstName , ' ', LastName);

-- DROP FirstName , LastName
ALTER TABLE Customers
DROP Column FirstName,
DROP Column LastName;

-- SUBSTRING INDEX (string, delimeter , count)
-- Count > 0 , LEFT
-- Count < 0 , RIGHT
-- FULL NAME = 1(FIRSTNAME) (LASTNAME)-1

-- ADD Column FirstName , LastName;
ALTER TABLE Customers
ADD COLUMN FirstName Varchar(50)
AFTER Prefix;

ALTER TABLE Customers
ADD COLUMN LastName Varchar(50)
AFTER FirstName;

-- SPLIT THE FULLNAME INTO FIRSTNAME & LASTNAME.
UPDATE Customers
SET FirstName = SUBSTRING_INDEX(FullName, ' ', 1);

UPDATE Customers
SET LastName = SUBSTRING_INDEX(FullName, ' ', -1);

-- UPPER() -- Capatilise the word
SELECT 
	UPPER(EmailAddress) AS Email
FROM Customers
LIMIT 10;

-- LOWER() -- Lowercase each character of a word
SELECT 
	LOWER(EmailAddress) AS Email
FROM Customers
LIMIT 10;

-- Proper() -- We have to make it work like a proper function.


-- LEFT()  -- Extract From Start.
-- LEFT(String, number of characters)
SELECT
	EmailAddress,
	LEFT(EmailAddress , 5) As shortmail
FROM Customers
LIMIT 10;

-- RIGHT()  -- Extract From END.
-- RIGHT(String, number of characters)
SELECT
	EmailAddress,
	RIGHT(EmailAddress , 15) As domainName
FROM Customers
LIMIT 10;

-- LPAD() -- Left Padding
-- It adds characters to the left side to reach a certain length
-- LPAD(str , len , padstr);

ALTER TABLE Customers
ADD COLUMN Formatted_Number VARCHAR(25);

ALTER TABLE Customers
DROP Column Formatted_Number;

UPDATE Customers 
	SET Formatted_Number = LPAD(LEFT(Phone_number,10),10,"0");
    
UPDATE Customers 
	SET Formatted_Number = LPAD(LEFT(Phone_number,10),16,"(+91) 0");
    
UPDATE customers 
	SET Formatted_Number= CONCAT('(+91)', ' ', LPAD(RIGHT(phone_number, 10), 10, '0'));

SELECT 
	Phone_number,
    LPAD(Phone_number,10,0)
FROM Customers
LIMIT 100;

-- REVERSE 
SELECT
	Phone_number,
	REVERSE(Phone_number) 
FROM Customers
LIMIT 10;

-- RACECAR -- RACECAR [Palindrome]
-- MOM NON NAMAN EYE

SELECT 
	CONCAT(
		FirstName,
        REVERSE(FirstName)
	) AS Palindrome
FROM Customers
LIMIT 10;

SELECT 
	CONCAT(
		"moon",
        REVERSE("moon")
	) AS Palindrome;

-- REPLACE() -Substring Replacement
SELECT
	REPLACE(productStyle, 0, 'NA') AS ProductStyle
FROM Products;
	
-- UPDATING Annual Income data / Modify DATA-TYPE.
UPDATE Customers
	SET AnnualIncome = REPLACE(AnnualIncome,'$','');
    
UPDATE Customers
	SET AnnualIncome = REPLACE(AnnualIncome,',','');
    
UPDATE Customers
	SET AnnualIncome = NULL 
WHERE AnnualIncome = "";

-- USE Alter command to modify the data type of AnnualIncome
ALTER TABLE Customers
MODIFY AnnualIncome INT;

-- SUBSTRING() / SUBSTR() - Extract the part of a string.
-- SUBSTR(str, startingPosition, length)

SELECT 
	SUBSTR(ModelName , 1 , 6) as ExtractModelName
FROM Products 
LIMIT 20;

SELECT 
	SUBSTRING(ModelName , 1 , 6) as ExtractModelName
FROM Products 
LIMIT 20;

-- PROPER -- Substring / Lower / Upper
SELECT 
	CONCAT(
		Left(FirstName,1),
        SUBSTRING(Lower(FirstName),2)
	) AS ProperName
FROM Customers
LIMIT 10;

-- INSTR() -- return the position of a character in a string
SELECT
	EmailAddress,
	INSTR(EmailAddress, "@") as idx_pos
FROM Customers
LIMIT 10;

-- Fetching UserName From EmailAddress
SELECT 
	EmailAddress,
	LEFT(EmailAddress, INSTR(EmailAddress, "@")-1) As UserName
FROM Customers
LIMIT 10;

-- AGGREGATION -- [Numerical Column].
-- Category Column [Count , Distinct Count].
SELECT
	COUNT(customerKey)
FROM Customers;

SELECT
	COUNT(*)
FROM Customers;

SELECT 
	DISTINCTROW(AnnualIncome)
FROM Customers;

SELECT 
	DISTINCT AnnualIncome
FROM Customers;

SELECT
	COUNT(DISTINCT AnnualIncome)
FROM Customers;

-- SUM with GROUP BY
-- Which territory has high return orders.
SELECT
	TerritoryKey,
    SUM(ReturnQuantity) AS TotalReturn
FROM Returns
GROUP BY TerritoryKey;

SELECT 
	COUNT(TerritoryKey) as TotalCount
FROM Returns;

-- On individual day how many returns appeared.
SELECT
	ReturnDate,
    SUM(ReturnQuantity) AS TotalReturn
FROM Returns
GROUP BY ReturnDate
LIMIT 10;

-- Provide Top 5 Days where the return is maximum
SELECT
	ReturnDate,
    SUM(ReturnQuantity) AS TotalReturn
FROM Returns
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Based on Unique ProductSubcategory, Can we find the Total Profit.
SELECT 
	ProductSubcategoryKey,
    ROUND(SUM(ProductPrice),2) AS TotalProductPrice,
    ROUND(SUM(ProductCost),2) As TotalProductCost,
    ROUND(SUM(ProductPrice) - SUM(ProductCost),2) AS TotalProfit
FROM Products
GROUP BY ProductSubcategoryKey
ORDER BY TotalProfit DESC;

SELECT 
	ProductSubcategoryKey,
    ROUND(SUM(ProductPrice),2) AS TotalProductPrice,
    ROUND(SUM(ProductCost),2) As TotalProductCost,
    ROUND(SUM(ProductPrice) - SUM(ProductCost),2) AS TotalProfit
FROM Products
GROUP BY 1
ORDER BY 4 DESC;

-- Based ON ProductKey , Provide a TotalOrderQuantity
SELECT
	ProductKey,
    SUM(OrderQuantity) AS total_quantity_sold
FROM `sales-2015`
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT
	SUM(OrderQuantity) AS totalOrderQty
FROM `sales-2015`;

-- AVGERAGE
SELECT 
	ProductSubcategoryKey,
    ROUND(AVG(ProductPrice),2) AS AvgProductPrice,
    ROUND(AVG(ProductCost),2) As AvgProductCost,
    ROUND(AVG(ProductPrice) - AVG(ProductCost),2) AS AverageProfit
FROM Products
GROUP BY 1
ORDER BY 4 DESC;

-- FIND the average AnnualIncome of different Occupation.
SELECT 
	Occupation,
    ROUND(AVG(AnnualIncome),0) AS AvgIncome,
    COUNT(*) AS TotalPerson
FROM Customers
GROUP BY 1
ORDER BY 2 DESC;

-- FIND the average AnnualIncome of different EducationLevel. 
SELECT 
	EducationLevel,
    ROUND(AVG(AnnualIncome),0) AS AvgIncome,
    COUNT(*) AS TotalPerson
FROM Customers
GROUP BY 1
ORDER BY 2 DESC;

-- FIND the average AnnualIncome of different Occupation & EducationLevel.
SELECT 
	Occupation,
	EducationLevel,
    ROUND(AVG(AnnualIncome),0) AS AvgIncome,
    COUNT(*) AS TotalPerson
FROM Customers
GROUP BY 1,2
ORDER BY 3 DESC;

-- MIN & MAX Function
SELECT
	OrderNumber, 
    MAX(OrderLineItem) as MaxItem_In_Invoice
FROM `sales-2017`
GROUP BY 1
LIMIT 5;

SELECT
	OrderNumber, 
    COUNT(OrderLineItem) as Total_Order_In_Invoice
FROM `sales-2017`
GROUP BY 1
ORDER BY 2
LIMIT 5;


-- MIN 
SELECT
	OrderNumber, 
    MIN(OrderQuantity) as Min_Order_Qty
FROM `sales-2017`
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- MIN / MAX 
-- [5,10,15,20,25,30] -> MIN : 5 , MAX:30 , COUNT : 6
-- [1,2,3,4,5,6,7,8,9,10] -> MIN:1 , MAX : 10 , COUNT 10

-- ROUND()
SELECT 
	Round(ProductPrice,0) AS RoundedPrice, 
    ROUND(ProductCost,2) AS RoundedCost 
FROM Products 
LIMIT 10;

-- CAST()
SELECT 
	CAST(ProductPrice AS DECIMAL(10,2)) AS RoundedPrice, 
    CAST(ProductCost AS DECIMAL(10,2)) AS RoundedCost 
FROM Products 
LIMIT 10;

-- ABS 
SELECT
	ProductSubcategoryKey,
	Round(SUM(ProductCost),2) AS TotalProductCost,
	Round(SUM(ProductPrice),2) AS TotalProductPrice,
    ABS(ROUND(SUM(ProductCost - ProductPrice),2)) AS GrossProfit
FROM Products
GROUP BY ProductSubcategoryKey
ORDER BY GrossProfit DESC
LIMIT 5;

-- GROUP_CONCAT
SELECT
	GROUP_CONCAT(CategoryName SEPARATOR " - ") AS AllCategories
FROM `product-categories`;

SELECT
	GROUP_CONCAT(DISTINCT EducationLevel SEPARATOR " - ") AS UniqueEducationLevel
FROM Customers;

SELECT
	GROUP_CONCAT(DISTINCT Occupation SEPARATOR " - ") AS UniqueOccupation
FROM Customers;

-- HAVING() 
SELECT
	ProductSubcategoryKey,
	Round(SUM(ProductCost),2) AS TotalProductCost,
	Round(SUM(ProductPrice),2) AS TotalProductPrice,
    ABS(ROUND(SUM(ProductCost - ProductPrice),2)) AS GrossProfit
FROM Products
GROUP BY ProductSubcategoryKey
HAVING GrossProfit > 10000
ORDER BY GrossProfit DESC
LIMIT 5;


SELECT
	ProductSubcategoryKey,
	Round(SUM(ProductCost),2) AS TotalProductCost,
	Round(SUM(ProductPrice),2) AS TotalProductPrice,
    ABS(ROUND(SUM(ProductCost - ProductPrice),2)) AS GrossProfit
FROM Products
WHERE ProductSubcategoryKey IN (2,1,3,14,12,16,17)
GROUP BY ProductSubcategoryKey
HAVING GrossProfit > 5000
ORDER BY GrossProfit DESC
LIMIT 10;

-- Find the total income of customers grouped by gender, 
-- but only include those with a total income greater than 1,000,000.

SELECT 
	Gender,
    SUM(AnnualIncome) AS TotalIncome
FROM Customers
GROUP BY Gender 
HAVING TotalIncome > 100000
ORDER BY 2 DESC;

-- Find the minimum and maximum income for each educational level, but only include groups 
-- where the difference between the maximum and minimum income is more than 50,000.

SELECT 
	EducationLevel,
    MIN(AnnualIncome) AS Min_Income,
    MAX(AnnualIncome) AS Max_Income,
    ABS(MIN(AnnualIncome) - MAX(AnnualIncome)) AS Abs_Income
FROM Customers
GROUP BY 1
HAVING Abs_Income > 50000
ORDER BY 4 DESC;

-- Find the average cost, price, and price difference for each product subcategory where the
-- average price difference is more than 20, and order the results in descending order of the  price difference.

SELECT 
	ProductSubcategoryKey,
    ROUND(AVG(ProductCost),2) AS AvgCost,
    ROUND(AVG(ProductPrice),2) AS AvgPrice,
    ROUND(ABS(AVG(ProductCost - ProductPrice)),2) AS Avg_Price_Diff
FROM Products
GROUP BY 1
HAVING Avg_Price_Diff > 20
ORDER BY 4 DESC;

-- Find the total products, total cost, total price, and rounded profit for each product key 
-- and subcategory key. Order the results by profit in descending order.

SELECT 
    ProductSubcategoryKey,
    COUNT(ProductKey) As TotalProducts,
    SUM(ProductCost) AS TotalCost,
    SUM(ProductPrice) AS TotalPrice,
    ROUND(ABS(SUM(ProductCost - ProductPrice)),2) AS RoundedProfit
FROM Products
GROUP BY 1,2
ORDER BY 6 DESC
LIMIT 10;
    
-- Find the total absolute profit for each product subcategory, only including those with a profit 
-- difference greater than 5,000. Order the results by total profit in descending order.

SELECT 
    ProductSubcategoryKey,
    ROUND(ABS(SUM(ProductCost - ProductPrice)),2) AS RoundedProfit
FROM Products
GROUP BY 1
Having RoundedProfit > 5000
ORDER BY 2 DESC
LIMIT 10;

-- INTRODUCTION TO JOINS [P.K, F.K]

-- Let Create 2 Dummy Table to have a discussion on Constraints.

CREATE TABLE Customer(
	Customer_id INT NOT NULL,
    Customer_name VARCHAR(100) NOT NULL,
    age int
);

ALTER TABLE Customer
MODIFY Customer_name varchar(100) NOT NULL DEFAULT 'Unknown';

INSERT INTO Customer(customer_id , age)
VALUES(1,29);

INSERT INTO Customer(customer_id , age)
VALUES(2,30);

ALTER TABLE Customer
ADD PRIMARY KEY(customer_id); 

-- Order Table
CREATE TABLE Orders(
	order_id INT PRIMARY KEY,
	customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Orders(
	order_id INT PRIMARY KEY
);
-- CONSTRAINTS 
-- 1. NOT NULL
ALTER TABLE Customer
MODIFY age int NOT NULL;

-- 2. UNIQUE [Refer Employee TABLE]

-- 3. PRIMARY KEY 
-- ALTER TABLE Customer
-- ADD PRIMARY KEY(customer_id);  

-- 4. Foreign Key
ALTER TABLE Orders
DROP FOREIGN KEY fk_customer_id;

ALTER TABLE Orders
DROP COLUMN customer_id;

ALTER TABLE Orders
ADD COLUMN customer_id INT;

ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY(customer_id) REFERENCES Customer(Customer_id);


-- CHECK CONSTRAINT
ALTER TABLE Customer
ADD CONSTRAINT check_age CHECK(age>=18); 

INSERT INTO Customer
VALUES(3,"Naveen",16);

-- Making a duplicate of Returns
CREATE TABLE  returns2 
AS (SELECT * FROM returns);

ALTER TABLE returns2
ADD CONSTRAINT return_quantity_is_negative CHECK(ReturnQuantity > 0); 

INSERT INTO returns2(ReturnQuantity)
VALUE(-5);

ALTER TABLE Customers
ADD CONSTRAINT check_gender CHECK (Gender IN ('M','F'));

-- Add TerritoryKey a foreign key in returns2 table

ALTER TABLE returns2
ADD CONSTRAINT fk_territory_key
FOREIGN KEY(TerritoryKey) REFERENCES territory(SalesTerritoryKey);

-- Duplicate the territory table as a backup

CREATE TABLE territory AS
(SELECT * FROM territories);

ALTER TABLE territory
ADD PRIMARY KEY(SalesTerritoryKey);

-- INNER JOIN 
/* SELECT column1 , column2 .....
	FROM Table1 
    [INNER/LEFT/RIGHT] JOIN Table2
	ON table1.key = table2.key
*/

-- INNER JOIN 
SELECT 
	Region, 
    SUM(ReturnQuantity) AS TotalReturns
FROM territories 
INNER JOIN returns 
ON territories.SalesTerritoryKey = returns.TerritoryKey
GROUP BY Region
ORDER BY 2 DESC;

-- LEFT JOIN
SELECT 
	Region,
    Country,
    SUM(ReturnQuantity) AS TotalReturns
FROM territories 
LEFT JOIN returns 
ON territories.SalesTerritoryKey = returns.TerritoryKey
GROUP BY 1,2
HAVING TotalReturns IS NULL
ORDER BY 2 DESC;

-- RIGHT JOIN
SELECT 
	SUM(ReturnQuantity) AS TotalReturns,
	Region
FROM returns 
RIGHT JOIN territories 
ON territories.SalesTerritoryKey = returns.TerritoryKey
GROUP BY Region
ORDER BY 1 DESC;

-- Aliases Multi Join.
-- CategoryName , TotalReturn
SELECT 
	CategoryName, 
	SUM(ReturnQuantity) AS TotalReturns
FROM `product-categories` AS pc
JOIN `product-subcategories` AS ps
ON pc.ProductCategoryKey = ps.ProductCategoryKey 
JOIN Products AS p
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
JOIN Returns AS r 
ON p.ProductKey = r.ProductKey
GROUP BY 1 
ORDER BY 2 DESC;

SELECT 
	CategoryName, 
	SUM(ReturnQuantity) AS TotalReturns
FROM `product-categories`
JOIN `product-subcategories` 
ON `product-categories`.ProductCategoryKey = `product-subcategories`.ProductCategoryKey 
JOIN Products 
ON `product-subcategories`.ProductSubcategoryKey = Products.ProductSubcategoryKey
JOIN Returns  
ON Products.ProductKey = Returns.ProductKey
GROUP BY 1 
ORDER BY 2 DESC;

-- Challenge 1
SELECT 
	p.ProductKey,
    p.ProductName,
    p.ProductPrice,
    r.ReturnQuantity
FROM Products p 
LEFT JOIN Returns r
ON p.ProductKey = r.ProductKey
WHERE r.ProductKey IS NULL;

-- Challenge 2 
/* List products that were sold in 2015, 2016, and 2017. 
Ensure the product appears in all 3 sales tables. */

SELECT 
	DISTINCT p.ProductName
FROM Products p
WHERE p.ProductKey IN (SELECT ProductKey FROM `sales-2015`)
AND p.ProductKey IN (SELECT ProductKey FROM `sales-2016`)
AND p.ProductKey IN (SELECT ProductKey FROM `sales-2017`);

SELECT 
	DISTINCT p.ProductName
FROM Products p
WHERE p.ProductKey IN (SELECT ProductKey FROM `sales-2015`)
OR p.ProductKey IN (SELECT ProductKey FROM `sales-2016`)
OR p.ProductKey IN (SELECT ProductKey FROM `sales-2017`);

-- UNION ALL [Append Queries]
-- FULL JOIN []
SELECT 
	t.*,
    r.*
FROM territories t
LEFT JOIN returns r
ON t.SalesTerritoryKey = r.TerritoryKey
UNION 
SELECT 
	t.*,
    r.*
FROM territories t
RIGHT JOIN returns r
ON t.SalesTerritoryKey = r.TerritoryKey;

-- Display full customer names and the names of the products they bought by 
-- combining sales from all 3 years.

SELECT 
	CONCAT(c.FirstName , " ", c.LastName) AS CustomerName,
    p.ProductName,
    s.OrderQuantity
FROM (
	SELECT * FROM `sales-2015`
    UNION ALL 
    SELECT * FROM `sales-2016`
    UNION ALL 
	SELECT * FROM `sales-2017`
) AS s
INNER JOIN Customers AS c
ON s.CustomerKey = c.CustomerKey
INNER JOIN Products AS p
ON s.ProductKey = p.ProductKey;

-- CROSS JOIN
SELECT * 
FROM 
	`product-categories`pc
CROSS JOIN `product-subcategories`ps
WHERE pc.ProductCategoryKey = ps.ProductCategoryKey
ORDER BY pc.ProductCategoryKey;

-- SELF JOIN
-- If I want to find a clan or community of same LastName.
SELECT 
	c1.customerKey AS Customer1_ID,
    CONCAT(c1.FirstName, ' ', c1.LastName) as Customer1_Name,
    c2.customerKey AS Customer2_ID,
    CONCAT(c2.FirstName, ' ', c2.LastName) as Customer2_Name,
    c1.LastName
FROM customers c1
JOIN Customers c2
ON c1.LastName = c2.LastName
AND c1.customerKey < c2.customerKey
LIMIT 20;

-- Customer with Same AnnualIncome
SELECT 
	c1.customerKey AS Customer1_ID,
    CONCAT(c1.FirstName, ' ', c1.LastName) as Customer1_Name,
    c1.AnnualIncome AS customer1_Income,
    c2.customerKey AS Customer2_ID,
    CONCAT(c2.FirstName, ' ', c2.LastName) as Customer2_Name,
    c2.AnnualIncome AS customer2_Income
FROM customers c1
JOIN Customers c2
ON c1.AnnualIncome = c2.AnnualIncome
AND c1.customerKey < c2.customerKey
ORDER BY c2.AnnualIncome DESC
LIMIT 20;

-- Customer With same DateOfBirth (SELF JOIN)
SELECT 
	c1.customerKey AS Customer1_ID,
    CONCAT(c1.FirstName, ' ', c1.LastName) as Customer1_Name,
    c1.DateOfBirth as Customer1_dob,
    c2.customerKey AS Customer2_ID,
    CONCAT(c2.FirstName, ' ', c2.LastName) as Customer2_Name,
    c2.DateOfBirth as Customer2_dob
FROM customers c1
JOIN Customers c2
ON c1.DateOfBirth = c2.DateOfBirth
AND c1.customerKey < c2.customerKey;

-- IFNULL Vs COALESCE()
SELECT 
	CustomerKey,
    FullName,
    AnnualIncome
FROM Customers
WHERE AnnualIncome IS NULL;

SELECT 
	CustomerKey,
    FullName,
    AnnualIncome,
    IFNULL(AnnualIncome , "Not Available") As IncomeStatus
FROM Customers
WHERE AnnualIncome IS NULL;


SELECT 
	CustomerKey,
    FullName,
    AnnualIncome,
    COALESCE(AnnualIncome , "Not Available") As IncomeStatus
FROM Customers
LIMIT 10;



