create database employee_db_408;
use employee_db_408;
create table dept(
dept_no varchar(20) primary key,
d_name varchar(20),
d_loc varchar(20)
);

create table employee_408(
emp_no int,
e_name varchar(20),
mgr_no int,
hire_date varchar(20),
sal float,
dept_no varchar(20),
primary key(emp_no, dept_no),
foreign key(dept_no) references dept(dept_no));

create table incentives_408(
emp_no int,
date varchar(20),
amt float,
primary key(emp_no, date),
foreign key(emp_no) references employee_408(emp_no));

create table project_408(
p_no int primary key,
p_loc varchar(20),
p_name varchar(20)
);

create table assigned_408(
emp_no int,
p_no int,
job_role text,
primary key(emp_no, p_no),
foreign key(emp_no) references employee_408(emp_no),
foreign key(p_no) references project_408(p_no)
);

insert into dept values(1,'cse','bengaluru');
insert into dept values(2,'ise','bombay');
insert into dept values(3,'csds','hyderabad');
insert into dept values(4,'ece','mysore');
insert into dept values(5,'aiml','delhi');

insert into employee_408 values(101,"mdr",100,"12/01/1999",100000,1);
insert into employee_408 values(201,"sak",200,"17/01/2020",50000,2);
insert into employee_408 values(301,"grp",100,"01/09/2004",30000,3);
insert into employee_408 values(401,"sws",101,"03/08/2000",10000,4);
insert into employee_408 values(501,"sks",101,"29/04/2008",90000,5);

insert into incentives_408 values(101,"12/03/2004",50000);
insert into incentives_408 values(201,"17/03/2024",25000);
insert into incentives_408 values(301,"01/12/2019",15000);
insert into incentives_408 values(401,"03/11/2019",5000);
insert into incentives_408 values(501,"29/04/2019",45000);

insert into project_408 values(10,"bengaluru","chatbot");
insert into project_408 values(40,"delhi","ml hotel");
insert into project_408 values(50,"bombay","block chain");
insert into project_408 values(30,"chennai","stocks");
insert into project_408 values(80,"mysore","android app");

insert into assigned_408 values(101,10,"devops");
insert into assigned_408 values(201,40,"sde");
insert into assigned_408 values(301,50,"manager");
insert into assigned_408 values(401,30,"jpa");
insert into assigned_408 values(501,80,"pa");

select *from dept;
select *from employee_408;
select *from incentives_408;
select *from project_408;
select *from assigned_408;

select emp_no from assigned_408 a, project_408 p where 
a.p_no=p.p_no and 
p.p_loc in('bengaluru','hyderabad','mysore');

update incentives_408 set amt=null where emp_no=401;
select emp_no from incentives_408 where amt is null;

select e.e_name, e.emp_no, d.d_name, a.job_role, d.d_loc, p.p_loc from 
employee_408 e, dept d, project_408 p, assigned_408 a where
e.emp_no=a.emp_no and e.dept_no=d.dept_no and p.p_no=a.p_no and p.p_loc=d.d_loc;