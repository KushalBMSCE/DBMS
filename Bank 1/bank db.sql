use bank_408;
create table branch_408(
branch_name varchar(25),
branch_city varchar(15),
assets real,
primary key(branch_name));
create table bank_account_408(
acc_no int,
balance int,
branch_name varchar(25),
primary key(acc_no),
foreign key(branch_name) references branch_408(branch_name)
);
create table bank_customer_408(
customer_name varchar(10),
customer_street varchar(25),
customer_city varchar(15),
primary key(customer_name)
);
create table depositer_408(
customer_name varchar(10),
acc_no int,
primary key(customer_name, acc_no),
foreign key(customer_name) references bank_customer_408(customer_name),
foreign key(acc_no) references bank_account_408(acc_no)
);
create table loan_408(
loan_no int,
branch_name varchar(25),
amount int,
primary key(loan_no),
foreign key(branch_name) references branch_408(branch_name)
);

insert into branch_408 values('SBI_Chamrajpet','Bangalore',50000);
insert into branch_408 values('SBI_Residency Road','Bangalore',10000);
insert into branch_408 values('SBI_Shivaji Road','Bombay',20000);
insert into branch_408 values('SBI_Parliament Road','Delhi',10000);
insert into branch_408 values('SBI_Jantarmantar','Delhi',20000);
select *from branch_408;

insert into bank_account_408 values(1,2000,'SBI_Chamrajpet');
insert into bank_account_408 values(2,5000,'SBI_Residency Road');
insert into bank_account_408 values(3,6000,'SBI_Shivaji Road');
insert into bank_account_408 values(4,9000,'SBI_Parliament Road');
insert into bank_account_408 values(5,8000,'SBI_Jantarmantar');
insert into bank_account_408 values(6,4000,'SBI_Shivaji Road');
insert into bank_account_408 values(8,4000,'SBI_Residency Road');
insert into bank_account_408 values(9,3000,'SBI_Parliament Road');
insert into bank_account_408 values(10,5000,'SBI_Residency Road');
insert into bank_account_408 values(11,2000,'SBI_Jantarmantar');
select *from bank_account_408;

insert into bank_customer_408 values('Avinash','Bull Temple Road','Bangalore');
insert into bank_customer_408 values('Dinesh','Bannerghatta Road','Bangalore');
insert into bank_customer_408 values('Mohan','National College Road','Bangalore');
insert into bank_customer_408 values('Nikhil','Akbar Road','Delhi');
insert into bank_customer_408 values('Ravi','Prithviraj Road','Delhi');
select *from bank_customer_408;

insert into depositer_408 values('Avinash',1);
insert into depositer_408 values('Dinesh',2);
insert into depositer_408 values('Mohan',3);
insert into depositer_408 values('Nikhil',4);
insert into depositer_408 values('Ravi',5);
insert into depositer_408 values('Avinash',8);
insert into depositer_408 values('Nikhil',9);
insert into depositer_408 values('Dinesh',10);
insert into depositer_408 values('Nikhil',11);
select *from depositer_408;


insert into loan_408 values(1,'SBI_Chamrajpet',1000);
insert into loan_408 values(2,'SBI_Residency Road',2000);
insert into loan_408 values(3,'SBI_Shivaji Road',3000);
insert into loan_408 values(4,'SBI_Parliament Road',4000);
insert into loan_408 values(5,'SBI_Jantarmantar',5000);
select *from loan_408;

alter table branch_408 change assets assets_in_lakhs real;

select distinct c.customer_name from bank_customer_408 c, bank_account_408 b 
where exists 
(select d.customer_name, count(d.customer_name) from depositer_408 d, bank_account_408 ba where ba.acc_no = d.acc_no and
c.customer_name = d.customer_name and ba.branch_name = 'SBI_Residency Road'
group by
d.customer_name having count(d.customer_name)>=2);

create view br1
as select branch_name, sum(amount) from loan_408
group by branch_name;
select *from br1;

show tables;



