/*
  EC_IT143_W3.4_ar.sql
  Author: Adriyan Rumbaoa
  Assignment: 3.4 AdventureWorks — Create Answers
  Estimated Runtime: ~3–5 minutes
  Description: This script contains answers to 8 selected business and metadata questions using AdventureWorks.
*/

-- Q1 – Marginal | Author: Me
-- What is the name of the product with the highest list price?
SELECT TOP 1 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- Q2 – Marginal | Author: Me
-- How many employees are in the Sales department?
SELECT COUNT(*) AS SalesEmployeeCount
FROM HumanResources.EmployeeDepartmentHistory edh
JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales' AND edh.EndDate IS NULL;

-- Q3 – Moderate | Author: Classmate
-- List of vendors who supply more than 3 different products (Vendor name and product count)
SELECT v.Name AS VendorName, COUNT(pv.ProductID) AS ProductCount
FROM Purchasing.ProductVendor pv
JOIN Purchasing.Vendor v ON pv.BusinessEntityID = v.BusinessEntityID
GROUP BY v.Name
HAVING COUNT(pv.ProductID) > 3;

-- Q4 – Moderate | Author: Classmate
-- Breakdown of total order quantity per product for online sales only
SELECT p.Name, SUM(sod.OrderQty) AS TotalQuantityOrdered
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE soh.OnlineOrderFlag = 1
GROUP BY p.Name;

-- Q5 – Increased | Author: Classmate
-- Top 10 products by revenue in 2014 excluding canceled orders
SELECT TOP 10 
    p.Name,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue,
    AVG(sod.UnitPrice) AS AverageUnitPrice
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE YEAR(soh.OrderDate) = 2014 AND soh.Status <> 6
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

-- Q6 – Increased | Author: Classmate
-- Customers who placed more than 5 orders in a single year
SELECT p.FirstName + ' ' + p.LastName AS CustomerName, 
       YEAR(soh.OrderDate) AS OrderYear, 
       COUNT(soh.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName, YEAR(soh.OrderDate)
HAVING COUNT(soh.SalesOrderID) > 5
ORDER BY OrderCount DESC;

-- Q7 – Metadata | Author: Classmate
-- Which tables contain a column named EmployeeID?
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'EmployeeID';

-- Q8 – Metadata | Author: Classmate
-- List all columns in Person.Person with data types and lengths
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person' AND TABLE_SCHEMA = 'Person';
