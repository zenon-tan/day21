use hotelreservation;

/*
insert into customer(first_name, last_name)
values ('Lady', 'Gaga');

insert into customer(first_name, last_name)
values ('Katy', 'Perry');

insert into customer(first_name, last_name)
values ('Beyonce', 'Knowles');

insert into customer(first_name, last_name)
values ('Rihanna', 'Fenty');

insert into customer(first_name, last_name)
values ('Taylor', 'Swift');

insert into customer(first_name, last_name)
values ('Britney', 'Spears');

insert into customer(first_name, last_name)
values ('The', 'Weeknd');

insert into customer(first_name, last_name)
values ('Sophie', 'Xeon');

insert into customer(first_name, last_name)
values ('Arca', 'Dona');

insert into customer(first_name, last_name)
values ('Dorian', 'Electra');

insert into customer(first_name, last_name)
values ('Rebecca', 'Black');

insert into customer(first_name, last_name)
values ('Brian', 'Eno');

insert into customer(first_name, last_name)
values ('Mac', 'Miller');

insert into customer(first_name, last_name)
values ('Floating', 'Points');

insert into customer(first_name, last_name)
values ('Nick', 'Drake');
*/

create table customer2(
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key(id)
);
# duplicate a table
create table customer2 as select * from customer;

select * from customer2;

#Update statement
update customer2
set first_name = 'Nicki',
last_name = 'Minaj'
where id = 11;

#Delete
delete from customer2 where id=15;

#Delete all the records (won't work with safe update mode)
delete from customer2;

insert into room(room_type, price)
values('suite', 1000);
insert into room(room_type, price)
values('standard', 100);
insert into room(room_type, price)
values('deluxe', 300);
insert into room(room_type, price)
values('president', 500);

/* select * from customer;
select * from room; */

# inserting customer_id and room_id (that are already linked) into the table
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(1, 1, '2023-02-01', '2023-02-5', 4000);

select * from reservation;

# We want to view the customer and room info by joining
# Inner join (overlapping data)

#r.id as r_id -> setting an alias for easier identification since both are 'ids'
select r.id as r_id, c.id as c_id, c.first_name, c.last_name, 
r.start_date, r.end_date, r.total_cost, room.price, room.room_type from customer c
inner join reservation r
#using the same id to join reservation and customer
on c.id = r.customer_id
#joining again with the room table
inner join room
on r.room_id = room.id
where last_name in ('Gaga', 'Knowles');

/*
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(3, 2, '2023-02-01', '2023-03-4', 3000);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(4, 1, '2023-02-02', '2023-03-3', 400);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(1, 3, '2023-02-02', '2023-03-3', 4040);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(6, 1, '2023-03-02', '2024-04-3', 40000);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(4, 4, '2023-03-02', '2023-03-16', 5000);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(2, 1, '2023-03-06', '2023-03-28', 1600);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(4, 2, '2023-02-05', '2023-03-18', 7800);
insert into reservation(customer_id, room_id, start_date, end_date, total_cost)
values(5, 4, '2023-03-02', '2023-03-3', 4500);
*/


# select distinct values from column with first name and last name
select distinct c.first_name, c.last_name full_name
from customer c
inner join reservation r
#using the same id to join reservation and customer
on c.id = r.customer_id
#joining again with the room table
inner join room
on r.room_id = room.id;

# average and sum
select start_date, sum(total_cost) total_revenue from reservation
where start_date = '2023-02-01';

select start_date, avg(total_cost) average_revenue from reservation
where start_date = '2023-02-01';

select *, length(first_name), length(last_name) from customer;

# Group by count and filter by date
select room_id, count(*) from reservation
where start_date between '2023-01-01' and '2023-12-31'
group by room_id;

select * from reservation;

select * from reservation
where start_date between '2023-02-01' and '2023-02-28';

select 'Feb 2023' as period, room_id, count(*) cnt from reservation
# 'Feb 2023' as period -> static text
where start_date between '2023-02-01' and '2023-02-28'
group by room_id;

select 'Feb 2023' as period, room_id, count(*) cnt from reservation
# 'Feb 2023' as period -> static text
where start_date between '2023-02-01' and '2023-02-28'
group by room_id
union #requires both column names to be the same
select 'Mar 2023' as period, room_id, count(*) cnt from reservation
# 'Mar 2023' as period -> static text
where start_date between '2023-03-01' and '2023-03-31'
group by room_id
order by cnt asc;

select 'Feb 2023' as period, room_id, count(*) cnt from reservation
# 'Feb 2023' as period -> static text
where start_date between '2023-02-01' and '2023-02-28'
group by room_id
# when using aggregate functions (e.g. count, sum)
#the results above must be processed first before filtering with 'having'
# 'where' can be used to query non aggregated results
having cnt > 3;



# sorting with multiple column
select distinct first_name, last_name from customer
order by first_name asc, last_name desc; #alphabetically

select *, length(first_name) from customer;

select * from employee;

insert into employee(first_name, last_name, salary)
values('Paris', 'Hilton', 5);

insert into employee(first_name, last_name, salary)
values('Lindsay', 'Lohan', 4);

insert into employee(first_name, last_name, salary)
values('Britney', 'Spears', 7);

insert into dependent(employee_id, first_name, last_name, relationship, birthdate)
values(1, 'Nicky', 'Hilton', 'Mother', '2020-01-01');

insert into dependent(employee_id, first_name, last_name, relationship, birthdate)
values(2, 'LiLo', 'Stitch', 'Son', '2020-01-01');

insert into dependent(employee_id, first_name, last_name, relationship, birthdate)
values(3, 'Jaime', 'Spears', 'Father', '2020-01-01');

insert into dependent(employee_id, first_name, last_name, relationship, birthdate)
values(3, 'Jaime', 'Lynn', 'Mother', '2020-01-01');

insert into dependent(employee_id, first_name, last_name, relationship, birthdate)
values(3, 'Justin', 'Timberlake', 'Partner', '2020-01-01');

select e.id emp_id, e.first_name, e.last_name, e.salary,
d.id dep_id, d.first_name dfirst_name, d.last_name dlast_name, d.relationship, d.birthdate
from employee e
inner join dependent d
on e.id = d.employee_id;

select e.id emp_id, e.first_name, e.last_name, e.salary,
d.id dep_id, d.first_name dfirst_name, d.last_name dlast_name, d.relationship, d.birthdate
from employee e
inner join dependent d
on e.id = d.employee_id
where e.id = 3;

select d.id, d.first_name, d.last_name, d.relationship, d.birthdate, 
e.first_name efirst_name, e.last_name elast_name, e.salary from dependent d
inner join employee e
on e.id = d.employee_id
where d.id = 1;

select 'Feb 2023' as Feb, room_id Feb_room_id, count(*) Feb_cnt,
'' as Marc, null as Mar_Room_id, null as Mar_cnt from reservation
# 'Feb 2023' as period -> static text
where start_date between '2023-02-01' and '2023-02-28'
group by room_id
union #requires both column names to be the same
select '' as Fev, null as Feb_Room_id, null as Feb_cnt, 'Mar 2023' as March, 
room_id Mar_room_id, count(*) cnt as Mar_cnt from reservation
# 'Mar 2023' as period -> static text
where start_date between '2023-03-01' and '2023-03-31'
group by room_id
order by cnt asc;










