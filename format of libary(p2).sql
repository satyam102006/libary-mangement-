-- libary mangement 
drop table if exists branch   ; 
create table branch(
 branch_id	varchar(10) primary key  , 
manager_id	 varchar(10) , 
 branch_address varchar(10) , 
 contact_no     varchar(10)
) ; 


 create  table employees(
 emp_id varchar(25) primary key, 
 emp_name	varchar(25) , 
 position	varchar(25) ,
 salary	 int  , 
 branch_id varchar(25) -- fk 
) ; 


 create table books(
 isbn	   varchar(25)  primary key, 
 book_title	varchar(75) , 
 category	varchar(25) , 
 rental_price	float , 
 status	       varchar(15) , 
 author	        varchar(35) , 
 publisher  varchar(50)
) ;

drop table if exists  members ; 
create table members(
member_id varchar(20) primary key , 
member_name varchar(30) , 
member_address	varchar(75) , 
reg_date date
) ; 




create table issed_states(
issued_id varchar(20) primary key  , 
issued_member_id	varchar(30) , -- fk 
issued_book_name	varchar(65) , 
issued_date	 date , 
issued_book_isbn	varchar(25) , -- fk 
issued_emp_id varchar(20) -- fk 
)


create table return_states(
return_id	varchar(10) primary key ,
issued_id	varchar(10) , 
return_book_name	varchar(75) , 
return_date	 date  ,
return_book_isbn varchar(20)
)

-- foregin key 
alter table issed_states 
add  constraint fk_members 
foreign key (issued_member_id) 
references members(member_id) ; 

alter table issed_states 
add  constraint fk_book_isbn 
foreign key (issued_book_isbn) 
references books(isbn) ; 

alter table issed_states 
add  constraint fk_emp_id 
foreign key (issued_emp_id) 
references employees(emp_id) ; 

alter table employees 
add  constraint fk_branch
foreign key (branch_id) 
references branch(branch_id) ; 

alter table employees 
add  constraint fk_branch
foreign key (branch_id) 
references branch(branch_id) ; 

alter table return_states
add  constraint fkissued
foreign key (issued_id) 
references issed_states(issued_id) ; 



alter table books 
alter column category type varchar(20)

alter table branch 
alter column branch_address type varchar(20)
































