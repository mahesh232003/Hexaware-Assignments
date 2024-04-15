create table Customers(
CustomerID int primary key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(30),
Phone int,
Address varchar(35)
);

create table Products(
ProductID int primary key,
ProductName varchar(15),
Description varchar(30),
Price decimal(10,2)
);

create table Orders(
OrderID int primary key,
CustomerID int references Customers,
OrderDate date,
TotalAmount decimal(10,2)
);

create table OrderDetails(
OrderDetailID int primary key,
OrderID int references Orders,
ProductID int references Products,
Quantity int
);

create table Inventory(
InventoryID int primary key,
ProductID int references Products,
QuantityInStock int ,
LastStockUpdate date
);