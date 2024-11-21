CREATE DATABASE CHECKPOINT__4,
Use CHECKPOINT__4,

CREATE TABLE Customers(
			Customer_id INT PRIMARY KEY not null,
			 name VARCHAR (30) not null,
			 Address  VARCHAR (120) not null);

SELECT* FROM Customers

CREATE TABLE Products(
			 product_id INT PRIMARY KEY not null,
			 name VARCHAR (120) not null,
			 price DECIMAL (20,2) not null);

SELECT * FROM products	

CREATE TABLE ORDERS(
			 order_id INT PRIMARY KEY  not null,
			 customer_id INT FOREIGN KEY  REFERENCES Customers (Customer_id) not null,
			 product_id INT FOREIGN KEY REFERENCES products (product_id) not null,
			 quantity INT not null,
			 order_date DATE );

SELECT * FROM ORDERS

insert into customers(customer_id,name,adress)
values(1,'Adebodun','99 osborn street')
	  (2,'Bosun','2 kareem street')
	  (3,'Chibuzor','5 ikeja GRA')


insert into Products(product_id,name,price)
values(1,'carpet',13000.00),
	   (2,'clothing',5000.00),
	   (3,'toys',2000.00);

insert into orders() 


