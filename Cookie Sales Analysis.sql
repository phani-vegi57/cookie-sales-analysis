--##################__ MINI-PROJECT ON SQL(COOKIE SALES) ___###################
use CookieSales
--write an sql query to retreive all the columns from the customer table
select * from Customers;

-- How many rows are there in the "cookiesTypes" table.
select count(*) 'Total Rows' from [Cookie Types];

--what is the maximum number of units sold for a single order in the 'orders' table.
select max(units_sold) as Maximum_amount from orders;

--retrieve the names and phone numbers of customers who are lovcated in the USA.
select name,Phone from Customers 
where Country = 'united states'

--Calculate the total revenue generated from all the orders.
select sum(revenue) as 'Total Revenue' from orders; 

--_______________________-/.. INTERMEDIATE ..-\________________________


--1.list the top 3 cookie types based on the revenue per cookie(desc)
select top 3 Cookie_Type ,Revenue_Per_Cookie
from [Cookie Types] 
order by Revenue_Per_Cookie desc

--2. write a query to get the names and addresses of customers who ordered 'Chocolate Chip' cookies.
select c.name,c.address 
from customers as c join orders as o
on c.Customer_ID = o.Customer_ID
where o.product = 'chocolate chip';

--3.Calculate the total cost incurred for each product and display the result in asending order of the cost
select product,sum(cost) as 'Total Cost' 
from orders
group by product
order by [Total Cost] desc;

--4.find the average revenue per cookie for all the cookie types.
select Cookie_Type,avg(revenue_per_cookie) as Avg_revenue
from [Cookie Types]
group by Cookie_Type
order by Avg_revenue desc
--5.list the customer names and order dates for orders with a profit of more than $500
select * from customers;select * from orders

select c.name,o.date ,o.Profit
from Customers c join orders o
on c.Customer_ID = o.Customer_ID
where o.profit > 500
order by Profit desc


--_____________________Complex____________________


--1.write a query to find the percentage of revenue contributed by each cookie type to the total revenue.
select 
Cookie_Type,cast(Cost_Per_Cookie*100/Revenue_Per_Cookie as decimal(10,2)) as Percentage_of_Revenue
from [Cookie Types] 

--2.calculate the total revenue and total cost for each product for the current year
select		
year(Date) as yearr,Product,sum(Revenue) as 'Total Revenue',sum(cost) as 'Total Cost'
from orders
where year(date) = 2020
group by product,year(date)
order by [Total Revenue] desc

--3.find the customer who made the highest number of orders and the total amount spent by that customer.
select top 1 c.name ,count(o.order_id) as 'Total Orders'
from customers as c join Orders as o
on o.Customer_ID = c.Customer_ID 
group by c.name
order by [Total Orders] desc;

--4. determine the average units sold per order for each product.
select product,cast(avg(units_sold) as decimal(10,2)) as 'Avg Units Sold' 
from orders
group by product 
order by [Avg Units Sold] desc

--5. write a query to find the top 5  customers who spent the most on cookie orders.
select c.name,sum(o.Revenue)  'Total Orders'
from customers as c join orders as o
on c.Customer_ID = o.Customer_ID
group by c.name
order by [Total Orders] desc