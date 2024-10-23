use bank_408;
create table borrower_408(
customer_name varchar(10),
loan_no int,
primary key(customer_name, loan_no),
foreign key(customer_name) references bank_customer_408(customer_name),
foreign key(loan_no) references loan_408(loan_no)
);
insert into borrower_408 values('Nikhil',1);
insert into borrower_408 values('Avinash',2);
insert into borrower_408 values('Dinesh',3);
insert into borrower_408 values('Mohan',4);
insert into borrower_408 values('Ravi',5);

select distinct d.customer_name from depositer_408 d,
bank_account_408 ba, branch_408 b where d.acc_no=ba.acc_no
and ba.branch_name=b.branch_name and b.branch_city="Delhi" group by d.customer_name having count(b.branch_name)>1;

delete from depositer_408 where acc_no=3;

select b.customer_name
from borrower_408 b
where b.loan_no not in(select d.acc_no from depositer_408 d
where b.loan_no=d.acc_no);

select b.customer_name
from borrower_408 b
where b.loan_no in(select d.acc_no from depositer_408 d,bank_account_408 ba, branch_408 b
where b.loan_no=d.acc_no and d.acc_no=ba.acc_no and
ba.branch_name=b.branch_name
and b.branch_city="Bangalore");

update branch_408 set assets_in_lakhs=200000 where branch_city='Bombay';

select branch_name
from branch_408
where assets_in_lakhs > all (select assets_in_lakhs from branch_408
where branch_city='Bangalore');

delete from bank_account_408 ba where ba.branch_name=
(select b.branch_name from branch_408 b where branch_city='Bombay');

update bank_account_408 set balance=balance+((5*balance)/100) where acc_no in(1,2,4,5,8,9,10,11,12);
select*from bank_account_408;