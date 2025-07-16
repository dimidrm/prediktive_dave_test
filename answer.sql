/*
 * Question: 
 * 		Write a SQL query to calculate the total number of customers, total orders, 
 * 		and total amount spent, grouped by the year the customer signed up, 
 * 		but only include customers who have placed at least one order. 
 */

select 
	date_trunc('year', customers.signup_date) as signup_year
	, count(distinct orders.customer_id) as total_customers
-- considering the order table has as an unique primary key the order_id
	, count(1) as total_orders
	, sum(orders.total_amount) as total_amount_spent
-- Considering we only want customers with at least one order
-- I can use the orders table as my main table and perform a left join with the customers table
-- No need to use having count(1) >= 1 			
from orders 
left join customers 
	on orders.customer_id = customers.customer_id
group by 1 
order by 1 desc
