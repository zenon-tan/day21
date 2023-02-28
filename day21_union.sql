use adventureworks;

# Count the number of entries
# Union to join two queries into a single table
select gender, count(*) from employee
where gender = 'M'
union
select gender, count(*) from employee
where gender = 'F';