create database CHECKPOINT6;
USE CHECKPOINT6





CREATE TABLE Customers(
			Customer_id INT PRIMARY KEY not null,
			 name VARCHAR (30) not null,
			 Address  VARCHAR (120) not null);

Alter table customers
add customer_tell varchar (20)check(customer_tell like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')

alter table customers
drop column customer_tell


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

INSERT INTO Products(product_id,name,price)
values(1,'widget',10.00),
		(2,'gadget',20.00),
		(3,'doohickey',15.00);

insert into customers(customer_id,name,address)
values(1, 'Alice','123 Main street'),
	   (2, 'Bob', '456 Market street'),
	   (3, 'Charlie','789 Elm street');

insert into ORDERS(order_id,customer_id,product_id,quantity,order_date)
values (1,1,1,10,'2021-01-01'),
	  (2,1,2,5,'2021-01-02'),
	  (3,2,2,3,'2021-01-03'),
	  (4,2,2,7,'2021-01-04'),
	  (5,3,1,2,'2021-01-05'),
	  (6,3,3,3,'2021-01-06');

--- A query to retrieve the names of customers who have placed an order for at least one widget and one gadget
--along with the total cost of widgets and gadgets ordered by each customer. the cost of each item should be calculated by multiplying the quantity by the price
-- firstly , joining of the three tables 

select orders.order_id,quantity,Customers.name,Products.name,price,orders.order_date
from ORDERS
inner join Customers on
orders.customer_id = Customers.customer_id
inner join Products on 
orders.product_id = Products.product_id

--3)customers that have at least one widget and one gadget along with th total cost of the products 
select orders.order_id, quantity,customers.name,Products.name,products.price,orders.order_date,
orders.quantity * Products.price as total_amount
from orders
inner join customers on
orders.customer_id = Customers.customer_id
inner join Products on
orders.product_id = products.product_id
where Products.name = 'widget' and quantity >= 1
order by customers.name

--5 customers who have retrieved atleast 1 gadget
select orders.order_id, quantity,customers.name,Products.name,products.price,orders.order_date,
orders.quantity * Products.price as total_amount
from orders
inner join customers on
orders.customer_id = Customers.customer_id
inner join Products on
orders.product_id = products.product_id
where Products.name = 'gadget' and quantity >= 1
order by customers.name


--customers that ordered atleast 1 doohickey
select orders.order_id, quantity,customers.name,Products.name,products.price,orders.order_date,
orders.quantity * Products.price as total_amount
from orders
inner join customers on
orders.customer_id = Customers.customer_id
inner join Products on
orders.product_id = products.product_id
where Products.name = 'doohickey' and quantity >= 1
order by customers.name

--retrieving total numbers of widget and gadget ordered by each customer along with the total cost
select 
C.name,  count(*) as total_count,o.quantity * p.price as total_cost
from
Customers as c
inner join orders as o
on C.Customer_id = O.product_id
inner join products as p
on o.product_id = P.product_id
where
P.name in ('widget','gadget')
group by c.name, p.price, o.quantity
--8
select products.name,
sum(orders.quantity) as total_quantity
from products
join orders 
on orders.product_id = products.product_id
group by products.name
having sum(orders.quantity)>=1

--9

select Customers .name, count (quantity) as total_orders
from Customers
join orders
on customers.Customer_id = orders.customer_id
group by Customers. name
order by total_orders desc

--10
select Products.name,
sum(orders.quantity) as total_quantity
from Products
join orders
on products.product_id = orders.product_id
group by Products.name
order by total_quantity desc

--11
select Customers.name,
count (distinct ORDERS.order_id) as totaldayorders
from Customers
join ORDERS
on customers.Customer_id = orders.customer_id
group by Customers.name
having count (distinct datepart(weekday, orders.order_date))=7