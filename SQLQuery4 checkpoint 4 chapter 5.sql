create database CHECKPOINT___4
USE CHECKPOINT___4

CREATE TABLE Customers(
			Customer_id INT PRIMARY KEY not null,
			 name VARCHAR (30) not null,
			 Address  VARCHAR (120) not null);


select * from Customers


CREATE TABLE Products(
			 product_id INT PRIMARY KEY not null,
			 name VARCHAR (120) not null,
			 price DECIMAL (20,2) not null);

select * from Products


CREATE TABLE ORDERS(
			 order_id INT PRIMARY KEY  not null,
			 customer_id INT FOREIGN KEY  REFERENCES Customers (Customer_id) not null,
			 product_id INT FOREIGN KEY REFERENCES products (product_id) not null,
			 quantity INT not null,
			 order_date DATE );


select * from ORDERS

insert into Customers(customer_id,name,Address)
values(1,'Ahmed','Tunisia'),
	   (2,'Coulibaly','Senegal'),
	   (3,'Hasan','Egypt');

insert into Products(product_id,name,price)
values(1,'cookies',10),
       (2,'candy',5.2);

insert into ORDERS(order_id,customer_id,product_id,quantity,order_date)
values(1,1,2,3,'2023-01-22'),
	   (2,2,1,10,'2023-04-14');
