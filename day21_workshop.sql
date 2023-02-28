use northwind;

select * from customers;

select id, company, first_name, last_name, job_title, address from customers
where id = 1;

select * from orders;

select id, customer_id, order_date, shipped_date, ship_address from orders;

select c.id, c.company, c.first_name, c.last_name, c.job_title, c.address,
o.id, o.customer_id, o.order_date, o.shipped_date, o.ship_address 
from customers c
inner join orders o
on c.id = o.customer_id
where c.id = 1;

select
o.id, o.order_date, o.shipped_date, o.ship_address 
from customers c
inner join orders o
on c.id = o.customer_id
where c.id = 7;

