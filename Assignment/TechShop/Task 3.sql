
-- 1
select o.OrderID, o.OrderDate, o.TotalAmount, c.FirstName, c.LastName, c.Email, c.Phone, c.Address
from Orders o
left join Customers c
on o.CustomerID=c.CustomerID

-- 2
select p.ProductName, sum(od.Quantity * p.Price) as Revenue 
from Products p
join OrderDetails od
on p.ProductID=od.ProductID
group by p.ProductID, p.ProductName


-- 3
select c.FirstName, c.LastName, c.Email, c.Phone, c.Address 
from Customers c
join Orders o
on c.CustomerID=o.CustomerID
group by c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone, c.Address

select * from Orders 
select * from OrderDetails
select * from Customers


-- 4
select p.ProductID,p.ProductName 
from Products p
join OrderDetails od 
on p.ProductID=od.ProductID
group by p.ProductID,p.ProductName
having sum(od.Quantity)=(select max(TotalQuantity) from (select sum(Quantity) as TotalQuantity from OrderDetails group by ProductID) as MaxQuantity);


-- 5
SELECT p.ProductName AS ElectronicGadget, p.CategoryName AS Category
FROM Products p
WHERE p.CategoryName = 'Electronic';

-- 6

SELECT c.CustomerId, c.FirstName, c.LastName, AVG(od.Quantity * p.Price) AS AverageOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
JOIN Products p ON od.ProductId = p.ProductId
GROUP BY c.CustomerId, c.FirstName, c.LastName;

-- 7
SELECT top 1 o.OrderId, c.FirstName, c.LastName, c.Email, c.Phone, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerId = c.CustomerId
JOIN OrderDetails od ON o.OrderId = od.OrderId
JOIN Products p ON od.ProductId = p.ProductId
GROUP BY o.OrderId, c.FirstName, c.LastName, c.Email, c.Phone
ORDER BY TotalRevenue DESC

-- 8
select p.ProductID, p.ProductName, count(od.orderID) as NumberOfOrders 
from Products p
left join OrderDetails od
on p.ProductID = od.ProductID
group by p.ProductID,p.ProductName

-- 9
DECLARE @PName VARCHAR;
SET @PName = 'Laptop';

SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @PName;

-- 10
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;

SET @StartDate = '2020-01-05';
SET @EndDate = '2020-04-05';

SELECT SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN @StartDate AND @EndDate;

