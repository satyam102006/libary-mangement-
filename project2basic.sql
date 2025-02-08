SELECT
    issued_emp_id,
    COUNT(*)
FROM issed_states
GROUP BY 1
HAVING COUNT(*) > 1





CREATE TABLE book_issued_cnt AS
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
FROM issed_states as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;



select* from book_issued_cnt
select* from issed_states



SELECT 
    b.category,
    SUM(b.rental_price),
    COUNT(*)
FROM 
issed_states as ist
JOIN
books as b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1


SELECT 
    e1.emp_id,
    e1.emp_name,
    e1.position,
    e1.salary,
    b.*,
    e2.emp_name as manager
FROM employees as e1
JOIN 
branch as b
ON e1.branch_id = b.branch_id    
JOIN
employees as e2
ON e2.emp_id = b.manager_id


SELECT * FROM issed_states as ist
LEFT JOIN
return_states as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;



































