/*
Task 4
*/

-- 1
SELECT CustomerID, FirstName, LastName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
);

-- 2
SELECT SUM(QuantityInStock) AS TotalProductsAvailable
FROM (
    SELECT QuantityInStock
    FROM Inventory
) AS SubQuery;

-- 3
SELECT SUM(TotalOrderRevenue) AS TotalRevenue
FROM (
    SELECT SUM(od.Quantity * p.Price) AS TotalOrderRevenue
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY od.OrderID
) AS OrderRevenues;

-- 4
DECLARE @CategoryName VARCHAR(255);
SET @CategoryName = 'Electronic';

SELECT AVG(Quantity) AS AverageQuantityOrdered
FROM (
    SELECT od.Quantity
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
) AS SubQueryAlias;

-- 5
DECLARE @CID int;
SET @CID = 1;

SELECT SUM(TotalOrderRevenue) AS TotalRevenue
FROM (
    SELECT SUM(od.Quantity * p.Price) AS TotalOrderRevenue
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID IN (
        SELECT OrderID
        FROM Orders
        WHERE CustomerID = @CID
    )
    GROUP BY od.OrderID
) AS CustomerRevenue;

-- 6
SELECT FirstName, LastName, NumberOfOrders
FROM (
    SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS NumberOfOrders
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
) AS CustomerOrders
WHERE NumberOfOrders = (
    SELECT MAX(NumberOfOrders)
    FROM (
        SELECT COUNT(OrderID) AS NumberOfOrders
        FROM Orders
        GROUP BY CustomerID
    ) AS CustomerOrderCount
);

-- 7
SELECT TOP 1 CategoryName AS MostPopularCategory, TotalQuantityOrdered
FROM (
    SELECT p.CategoryName, SUM(od.Quantity) AS TotalQuantityOrdered
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY p.CategoryName
) AS CategoryQuantities
ORDER BY TotalQuantityOrdered DESC

-- 8
SELECT TOP 1 FirstName, LastName, TotalSpending
FROM (
    SELECT c.FirstName, c.LastName, SUM(od.Quantity * p.Price) AS TotalSpending
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
) AS CustomerSpending
ORDER BY TotalSpending DESC

-- 9 
SELECT AVG(TotalOrderValue) AS AverageOrderValue
FROM (
    SELECT o.OrderID, SUM(od.Quantity * p.Price) AS TotalOrderValue
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY o.OrderID
) AS OrderValues;

-- 10
SELECT FirstName, LastName, OrderCount
FROM (
    SELECT c.FirstName, c.LastName, o.CustomerID, COUNT(o.OrderID) AS OrderCount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY o.CustomerID, c.FirstName, c.LastName
) AS CustomerOrders;





