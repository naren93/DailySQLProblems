-- USE - https://github.com/harryho/db-samples/blob/master/mysql/northwind.sql
-- This is to query the `northwindHarry.sql` 
-- Below solution for SQL Practice Problems By Sylvia Moestl Vasilik
-- Author of solutions - Ramanathan Subramanian

-- 1. All fields of shippers -
SELECT * FROM Northwind.Shipper;

-- 2. Certain fields from categories -
SELECT categoryName, description FROM Northwind.Category;

-- 3. Sales representatives only -
SELECT firstname, lastname, hiredate FROM Northwind.Employee WHERE Title='Sales Representative';

-- 4. Sales representatives in US only -
SELECT firstname, lastname, hiredate FROM Northwind.Employee WHERE title='Sales Representative' AND country='USA';

-- 5. orders placed by specific EmployeeID -
SELECT orderId, orderDate FROM Northwind.SalesOrder WHERE employeeId=5;

-- 6. suppliers and ContactTitles whose ContactTitle is not Marketing Manager
SELECT supplierId, contactName, contactTitle FROM Northwind.Supplier WHERE contactTitle <> 'Marketing Manager';

-- 7. products with “queso” in ProductName
SELECT productId, productName FROM Northwind.Product WHERE productName LIKE '%queso%';
-- No products are named 'queso'.

-- 8. Orders shipping to France or Belgium
SELECT orderId, custId, shipCountry FROM Northwind.SalesOrder WHERE shipCountry IN ('France','Belgium');

-- 9. Return all SalesOrder from Latin American Countries -
SELECT orderId, custId, shipCountry FROM Northwind.SalesOrder WHERE shipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

-- 10. Order by birthdate in descending order (asc, desc) - 
SELECT firstname, lastname, title, birthdate FROM Northwind.Employee ORDER BY birthdate; 

-- 11. Showing only date with datetime field -
SELECT firstname, lastname, title, date(birthdate) AS DOB FROM Northwind.Employee ORDER BY birthdate;

-- 12. Show the FirstName and LastName columns from the Employees table and create a new column called FullName -
SELECT CONCAT(firstname, " ", lastname) AS FullName FROM Northwind.Employee;

--13. In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that multiplies these two together. We’ll ignore the Discount field for now. In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.
SELECT orderId, productId, UnitPrice, quantity, (UnitPrice * quantity) AS TotalPrice FROM Northwind.OrderDetail;

-- 14. How many customers do we have in the Customers table? Show one value only, and don’t rely on getting the recordcount at the end of a resultset.
SELECT count(*) AS TotalCustomers FROM Northwind.Customer;

-- 15. When was the first order? Show the date of the first order ever made in the Orders table.
SELECT min(orderDate) AS FirstOrder FROM Northwind.SalesOrder;

-- 16. Show the list of countries where the NorthWind has customers ?
SELECT distinct(shipCountry) FROM Northwind.SalesOrder;
