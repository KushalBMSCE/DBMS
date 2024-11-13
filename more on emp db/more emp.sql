use employee_db_408;

select *from employee_408;
select m.e_name, count(*) from employee_408 e, employee_408 m
where e.mgr_no=m.emp_no
group by m.e_name having count(*) =
(select max(mycount) from
(select count(*) mycount from employee_408 group by mgr_no)a);

select m.e_name, m.sal
from employee_408 m
where m.sal>(
select avg(e.sal) from employee_408 e where e.mgr_no=m.emp_no);

select distinct m.mgr_no from employee_408 e, employee_408 m
where e.mgr_no=m.mgr_no and e.dept_no = m.dept_no and
e.emp_no in(
select distinct m.mgr_no from employee_408 m where 
e.mgr_no=m.mgr_no and e.dept_no=m.dept_no);


select *from incentives_408;
select emp_no, e_name from employee_408
where sal = 
(select max(sal) from employee_408 where sal < (select max(sal) from employee_408));

insert into employee_408 values(601,"ksg",101,"21/3/2009",50000,1);
select * from employee_408 e 
where e.dept_no=
(select e1.dept_no from employee_408 e1 where e1.emp_no=e.mgr_no);


select * from employee_408;
select *from assigned_408;
select *from dept;