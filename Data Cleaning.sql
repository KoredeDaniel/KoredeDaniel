create database projects;
use projects;
select * from hr;
alter table hr change column ï»¿id emp_id varchar(20) null;
describe hr;
set sql_safe_updates = 0;
select age from hr;
select birthdate, hire_date from hr;
alter table hr
modify column birthdate date;
update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate !='';


alter table hr
modify column hire_date date;

select
	min(age) as youngest,
    max(age) as oldest
    from hr;
select count(*) from hr where age <18;
alter table hr
add column age int;

update hr
set age = timestampdiff(year, birthdate, curdate());

update hr 
set hire_date = case 
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
    end;
    