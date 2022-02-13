--*****************************************
--   Deliverable 1 Steps 1-7
--*****************************************

DROP TABLE IF EXISTS retirement_title;

SELECT e.emp_no
	,e.first_name
	,e.last_name
	,t.title
	,t.from_date
	,t.to_date
INTO retirement_title
FROM emp e
  JOIN emp_title t ON e.emp_no = t.emp_no
WHERE DATE_PART('year', e.birth_date) BETWEEN 1952 AND 1955
ORDER BY e.emp_no, t.from_date;

--*****************************************
--   Deliverable 1 Steps 8-15
--*****************************************

DROP TABLE IF EXISTS retirement_unique_title;

SELECT DISTINCT ON (emp_no) emp_no
	,first_name
	,last_name
	,title
INTO retirement_unique_title
FROM retirement_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--*****************************************
--   Deliverable 1 Steps 16-22
--*****************************************

DROP TABLE IF EXISTS retiring_titles;

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM retirement_unique_title
GROUP BY title
ORDER BY COUNT(emp_no) DESC;




