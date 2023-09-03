use music_store_check
--Who is the senior most employee based on job title?

select * from employee
select * from employee order by levels desc
select * from employee order by levels desc limit 1 --donot work in sql server
select top 1 * from employee order by levels desc 
---------------
--Which countries have the most Invoices?
select * from invoice
select count(billing_country) as no_of_invoices,billing_country from invoice group by billing_country order by no_of_invoices desc
--------------------

--What are top 3 values of total invoice?
select * from invoice
select top 3 total,customer_id,billing_country from invoice order by total desc


--Which city has the best customers? We would like to throw a promotional Music
--Festival in the city we made the most money. Write a query that returns one city that
--has the highest sum of invoice totals. Return both the city name & sum of all invoice
--totals

select * from invoice
select sum(total) as total_invoice,billing_city from invoice group by billing_city order by total_invoice desc
-------------------

-- Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money
select * from customer

select top 1 customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) as total
from customer join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id,customer.first_name,customer.last_name
order by total desc


select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) as total
from customer join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id,customer.first_name,customer.last_name
order by total desc















