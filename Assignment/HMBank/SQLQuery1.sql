create table Customers (
customer_id int	primary key,
first_name varchar(20),
last_name varchar(20),
DOB date,
email varchar(50),
phone_number int,
address varchar(75)
);

create table Accounts(
account_id int primary key,
customer_id int references Customers,
account_type varchar(20),
balance numeric(10,2)
);

create table Transactions(
transaction_id int primary key,
account_id int references Accounts,
transaction_type varchar(20),
amount numeric(10,2),
transaction_date date
);

