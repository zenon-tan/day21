#create database hotelreservation;

use hotelreservation;

/*create table employee(
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    salary int not null,
    primary key(id)
    
);

create table room(
	id int not null auto_increment,
    room_type enum('standard', 'deluxe', 'president', 'suite') not null,
    price int not null,
    primary key(id)
);

create table customer(
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key(id)
);

create table reservation(
	id int not null auto_increment,
    #These two are keys that allow you to link the other tables
    # Foreign keys
    customer_id int not null,
    room_id int not null,
    start_date date,
    end_date date,
    total_cost int not null,
    #total_cost decimal(0,2) not null
    primary key(id),
    #create a foreign key
    foreign key(customer_id) references customer(id),
    foreign key(room_id) references room(id)
    
); */

create table dependent(
id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    relationship enum('father', 'mother', 'son', 'daughter', 'partner') not null,
    birthdate date not null,
    employee_id int not null,
    primary key(id),
    foreign key(employee_id) references employee(id)
);




