/*insert into tutorials
(title, author, submission_date)
values('CS102', 'Jesus', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS103', 'Jesus', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS104', 'Jesus', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS105', 'Jesus', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS106', 'Mary', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS107', 'Joseph', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS108', 'Judas', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS109', 'Gaga', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS110', 'Kayla', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS111', 'Katy', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS112', 'Britney', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS113', 'Beyonce', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS114', 'Ariana', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS115', 'Arca', '2023-02-01');

insert into tutorials
(title, author, submission_date)
values('CS116', 'Elsa', '2023-02-01');

select * from tutorials; */

#select a.* from tutorials a; #Providing an alias allows for a shorter name
# instead of select tutorials.* from tutorials;
select a.id, a.title, a.author from tutorials a
where a.author like '%j%'; 
#anything that contains 'j' % -> dont care anything in front or behind
# a% -> don't care anything thats behind, and it starts with a

#Filtering data between dates
select a.* from tutorials a
where submission_date > '2023-02-01' and submission_date < '2023-02-04';


# Combining multiple conditions
select a.* from tutorials a where a.submission_date between
'2023-02-01' and '2023-02-04'
and a.author like 'g%';

#In operator
# Picking specific records from a set
select a.* from tutorials a
where a.id in (1,2,3,6,10);

select a.* from tutorials a
where a.author in ('Gaga', 'Judas');

#Not operator
select a.* from tutorials a
where submission_date not between
'2023-02-01' and '2023-02-04';

select a.* from tutorials a
where a.id not in (1,2,3,6,10)
and a.author not in ('Katy', 'Beyonce')
and a.author like '%g%';














































