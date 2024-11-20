create database supplier_408;
use supplier_408;

create table supplier_408(
sid int primary key,
sname varchar(20),
city varchar(20));

create table parts_408(
pid int primary key,
pname varchar(20),
color varchar(20));

create table catalog_408(
sid int,
pid int,
cost int,
primary key(sid, pid),
foreign key(sid) references supplier_408(sid),
foreign key(pid) references parts_408(pid));

insert into supplier_408 values(10001,'Acme Widget','Begaluru');
insert into supplier_408 values(10002,'Johns','Kolkata');
insert into supplier_408 values(10003,'Vimal','Mumbai');
insert into supplier_408 values(10004,'Reliance','Delhi');

insert into parts_408 values(20001,'Book','Red');
insert into parts_408 values(20002,'Pen','Red');
insert into parts_408 values(20003,'Pencil','Green');
insert into parts_408 values(20004,'Mobile','Green');
insert into parts_408 values(20005,'Charger','Black');

insert into catalog_408 values(10001,20001,10);
insert into catalog_408 values(10001,20002,10);
insert into catalog_408 values(10001,20003,30);
insert into catalog_408 values(10001,20004,10);
insert into catalog_408 values(10001,20005,10);
insert into catalog_408 values(10002,20001,10);
insert into catalog_408 values(10002,20002,20);
insert into catalog_408 values(10003,20003,30);
insert into catalog_408 values(10004,20003,40);
select *from catalog_408;
select distinct p.pname from parts_408 p, catalog_408 c
where p.pid=c.pid;

SELECT DISTINCT s.sname
FROM catalog_408 c, supplier_408 s
WHERE c.sid = s.sid
AND NOT EXISTS (
    SELECT p.pid
    FROM parts_408 p
    WHERE NOT EXISTS (
        SELECT c1.sid
        FROM catalog_408 c1
        WHERE c1.sid = c.sid
        AND c1.pid = p.pid
    )
);


select distinct s.sname from catalog_408 c, supplier_408 s
where c.sid=s.sid and 
not exists
(select p.pid from parts_408 p where p.color="Red" and
not exists 
(select c1.sid from catalog_408 c1 
where c1.sid=c.sid and c1.pid=p.pid and p.color="Red")); 

select p.pname from parts_408 p, catalog_408 c, supplier_408 s
where p.pid=c.pid and c.sid=s.sid and
s.sname='Acme Widget' and 
not exists
(select * from catalog_408 c1, supplier_408 s1
where p.pid=c1.pid and c1.sid=s1.sid and
s1.sname != 'Acme Widget');

select distinct c.sid from catalog_408 c
where c.cost>(select avg(c1.cost)
from catalog_408 c1 where c1.pid=c.pid);

select p.pid, s.sname from parts_408 p, supplier_408 s, catalog_408 c
where c.pid=p.pid and c.sid=s.sid and c.cost=
(select max(c1.cost) from catalog_408 c1 where c1.pid=p.pid);