-- 1
select FirstName,Email from Customers

-- 2
select Orders.OrderID, Orders.OrderDate, Customers.FirstName
from Customers
join Orders 
on Orders.CustomerID=Customers.CustomerID

-- 3
insert into Customers values (11, 'Jackson','West','jackson.west@mail.com',787865653,'ade 936 street')

-- 4
update Products 
set Price=Price*1.1

--5
select * from Orders
select * from OrderDetails

declare @ordid int
set @ordid=11

Delete from Orders
where OrderId=@ordid

Delete from OrderDetails
where OrderID=@ordid

-- 6
insert into Orders values (11, 11, '2020-05-03', 4999.99)
insert into OrderDetails values (11, 11,  9, 1)

-- 7
declare @cid int 
set @cid=1

update Customers 
set Phone=900910019
where CustomerID=@cid

-- 8
update Orders 
set TotalAmount = (select sum(od.Quantity * p.Price) from OrderDetails od join Products p on od.ProductID=p.ProductID where od.OrderID=Orders.OrderID)
where OrderID in (select distinct OrderId from OrderDetails) 

select * from Orders
select * from Products
-- 9
DECLARE @CustomerID INT;
SET @CustomerID = 11;

DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = @CustomerID
);

DELETE FROM Orders
WHERE CustomerID = @CustomerID;

-- 10
insert into Products values (11, 'HDD', '4TB storage, High-speed',8999.99)

-- 11
ALTER TABLE Orders
ADD Status VARCHAR(50) DEFAULT 'Pending';

select * from Orders

UPDATE Orders
SET Status = 'Pending';

declare @Ordid int 
set @Ordid = 1

update Orders set status = 'Shipped' where OrderID=@Ordid

-- 12
select c.CustomerId, count(o.OrderID) as NumberOfOrders
from Customers c
left join Orders o 
on c.CustomerID=o.CustomerID
group by c.CustomerID