#drop databse moviereservation -> deletes the database
create database moviereservation;

use moviereservation;

create table onlineuser(
	id varchar(10),
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100),
    phone varchar(10) not null,
    primary key(id)
);

create table cinema(
	id varchar(10),
    cinema_name varchar(50) not null,
    no_of_theatres int,
    primary key(id)    
);

create table theatre(
	id varchar(10),
    cinema_id varchar(10),
    no_of_seats int not null,
    primary key(id),
    # the 'child' foreign key is referenced at the child/'many' (theatre) to the parent (cinema)
    foreign key(cinema_id) references cinema(id)
);

create table movie(
	id varchar(10),
    title varchar(100) not null,
    subtitle varchar(10),
    genre varchar(20),
    primary key(id)    
);

create table screenings(
	id int not null auto_increment,
    show_time time not null,
    show_date date not null,
    seats_left int not null,
    theatre_id varchar(10),
    movie_id varchar(10),
    primary key(id),
    foreign key(theatre_id) references theatre(id),
    foreign key(movie_id) references movie(id)
);

create table booking(
	id varchar(20) not null,
    no_of_tickets int not null,
    total_cost int not null,
    online_user_id varchar(10),
    screening_id int,
    primary key(id),
    foreign key(online_user_id) references onlineuser(id),
    foreign key(screening_id) references screenings(id)
);

insert into onlineuser(id, first_name, last_name, email, phone)
values(0000000001, 'Lady', 'Gaga', 'ladygaga@interscope.com', 911911911);

insert into onlineuser(id, first_name, last_name, email, phone)
values(0000000002, 'Katy', 'Perry', 'katyperry@interscope.com', 933911911);

insert into onlineuser(id, first_name, last_name, email, phone)
values(0000000003, 'Beyonce', 'Knowles', 'beyonce@interscope.com', 911511941);

insert into onlineuser(id, first_name, last_name, email, phone)
values(0000000004, 'Britney', 'Spears', 'spears@interscope.com', 918421911);

insert into onlineuser(id, first_name, last_name, email, phone)
values(0000000005, 'Rihanna', 'Fenty', 'rihanna@interscope.com', 918429251);

insert into cinema(id, cinema_name, no_of_theatres)
values(0000000001, 'Cineleisure', 5);

insert into cinema(id, cinema_name, no_of_theatres)
values(0000000002, 'Cathay', 12);

insert into cinema(id, cinema_name, no_of_theatres)
values(0000000003, 'The Projector', 3);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000001, 0000000003, 400);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000002, 0000000002, 1000);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000003, 0000000003, 540);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000004, 0000000002, 350);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000005, 0000000003, 860);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000006, 0000000002, 940);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000007, 0000000001, 200);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000008, 0000000001, 40);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000009, 0000000002, 89);

insert into theatre(id, cinema_id, no_of_seats)
values(0000000010, 0000000001, 69);

insert into movie(id, title, subtitle, genre)
values(0000000001, 'Her', 'English', 'Scifi');

insert into movie(id, title, subtitle, genre)
values(0000000002, 'Lost In Translation', 'English', 'Drama');

insert into movie(id, title, subtitle, genre)
values(0000000003, 'Speed', 'English', 'Action');

insert into movie(id, title, subtitle, genre)
values(0000000004, 'In The Mood For Love', 'Mandarin', 'Drama');

insert into movie(id, title, subtitle, genre)
values(0000000005, 'House of Gucci', 'English', 'Drama');

insert into movie(id, title, subtitle, genre)
values(0000000006, 'TAR', 'English', 'Suspense');

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000001, '10:00', '2023-02-01', 25, 0000000001, 0000000001);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000002, '11:00', '2023-02-01', 25, 0000000001, 0000000002);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000003, '12:00', '2023-02-01', 25, 0000000002, 0000000001);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000004, '13:00', '2023-02-01', 25, 0000000001, 0000000003);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000005, '14:00', '2023-02-01', 25, 0000000002, 0000000003);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000006, '15:00', '2023-02-01', 25, 0000000003, 0000000004);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000007, '16:00', '2023-02-01', 25, 0000000002, 0000000004);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000008, '17:00', '2023-02-01', 25, 0000000004, 0000000003);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000009, '18:00', '2023-02-01', 25, 0000000003, 0000000001);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000010, '19:00', '2023-02-01', 25, 0000000005, 0000000002);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000011, '19:20', '2023-02-01', 25, 0000000005, 0000000001);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000012, '20:00', '2023-02-01', 25, 0000000006, 0000000004);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000013, '20:30', '2023-02-01', 25, 0000000006, 0000000004);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000014, '20:45', '2023-02-01', 25, 0000000007, 0000000003);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000015, '21:00', '2023-02-01', 25, 0000000007, 0000000001);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000016, '21:10', '2023-02-01', 25, 0000000008, 0000000002);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000017, '21:50', '2023-02-01', 25, 0000000008, 0000000003);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000018, '22:00', '2023-02-01', 25, 0000000009, 0000000004);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000019, '22:40', '2023-02-01', 25, 0000000009, 0000000005);

insert into screenings(id, show_time, show_date, seats_left, theatre_id, movie_id)
values(0000000020, '23:00', '2023-02-01', 25, 0000000010, 0000000006);

insert into booking(id, no_of_tickets, total_cost, online_user_id, screening_id)
values(00000001, 1, 45, 0000000001, 0000000001);

insert into booking(id, no_of_tickets, total_cost, online_user_id, screening_id)
values(00000002, 2, 22, 0000000002, 000000017);

insert into booking(id, no_of_tickets, total_cost, online_user_id, screening_id)
values(00000003, 7, 230, 0000000003, 0000000008);

insert into booking(id, no_of_tickets, total_cost, online_user_id, screening_id)
values(00000004, 3, 67, 0000000004, 0000000002);

insert into booking(id, no_of_tickets, total_cost, online_user_id, screening_id)
values(00000005, 4, 87, 0000000005, 0000000011);

select s.id, s.show_date, s.show_time, s.seats_left, t.cinema_id, t.no_of_seats, m.title, m.genre from screenings s
inner join theatre t
on t.id = s.theatre_id
inner join movie m
on m.id = s.movie_id
where s.show_time between '19:00' and '22:00';

select b.id, ou.first_name, ou.last_name, s.show_time, s.show_date, m.title, m.genre, t.no_of_seats, b.no_of_tickets, b.total_cost from booking b
inner join onlineuser ou
on ou.id = b.online_user_id
inner join screenings s
on s.id = b.screening_id
inner join movie m
on m.id = s.movie_id
inner join theatre t
on t.id = s.theatre_id;





























