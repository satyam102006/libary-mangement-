-- INSERT INTO book_issued in last 30 days
-- SELECT * from employees;
-- SELECT * from books;
-- SELECT * from members;
-- SELECT * from issued_status


INSERT INTO issed_states(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
VALUES
('IS151', 'C118', 'The Catcher in the Rye', CURRENT_DATE - INTERVAL '24 days',  '978-0-553-29698-2', 'E108'),
('IS152', 'C119', 'The Catcher in the Rye', CURRENT_DATE - INTERVAL '13 days',  '978-0-553-29698-2', 'E109'),
('IS153', 'C106', 'Pride and Prejudice', CURRENT_DATE - INTERVAL '7 days',  '978-0-14-143951-8', 'E107'),
('IS154', 'C105', 'The Road', CURRENT_DATE - INTERVAL '32 days',  '978-0-375-50167-0', 'E101');

-- Adding new column in return_status

ALTER TABLE return_states
ADD Column book_quality VARCHAR(15) DEFAULT('Good');

UPDATE return_states
SET book_quality = 'Damaged'
WHERE issued_id 
    IN ('IS112', 'IS117', 'IS118');
SELECT * FROM return_states;
SELECT * FROM issed_states;














--- advance problem 

-- Q13
select ist.issued_member_id  , m.member_name , bk.book_title , ist.issued_date  , current_date - ist.issued_date   as overdue
from issed_states as ist 
join  members as m 
on m.member_id = ist.issued_member_id
join books as bk 
on bk.isbn = ist.issued_book_isbn 
left join  
return_states as rs 
on rs.issued_id = ist.issued_id
where rs.return_id is null and( current_date - ist.issued_date)> 30
order by 5 desc

select * from members
select * from books



-- store pro
create or replace procedure  add_return_records(p_return_id varchar(10), p_issued_id varchar(20) , p_book_quality varchar(15))
language plpgsql
as $$ 

declare
    v_isbn varchar(25) ; 
    v_book_title varchar(75) ;

begin 

-- insert into return 
     INSERT INTO return_states(return_id , issued_id , return_date , book_quality )
	 values 
	 (p_return_id ,p_issued_id , current_date , p_book_quality ) ;


      select 
	  issued_book_isbn  , 
	  issued_book_name
	  into 
	  v_isbn  , 
	  v_book_title
	  from issed_states
      where issued_id = p_issued_id  ; 
	  
	  update books 
	  set status = 'yes'
	  where isbn = v_isbn   ; 
	  
	  raise notice 'thank you for returning this book : %' , v_book_title    ;


end ; 
$$


call  add_return_records('RS138' , 'IS135' , 'good')


select issed_states


-- 978-0-307-58837-1












