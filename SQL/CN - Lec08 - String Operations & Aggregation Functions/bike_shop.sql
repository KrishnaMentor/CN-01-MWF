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