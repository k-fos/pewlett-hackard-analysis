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

SELECT COUNT(*)
FROM retirement_title;
