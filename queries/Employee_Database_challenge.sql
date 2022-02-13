--TABLES
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS emp;

CREATE TABLE dept (
	 dept_no VARCHAR(10) NOT NULL PRIMARY KEY
	,dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE emp (
	 emp_no INT NOT NULL PRIMARY KEY
	,birth_date DATE
	,first_name VARCHAR(100)
	,last_name VARCHAR(100)
	,gender VARCHAR(2)
	,hire_date DATE
);

CREATE TABLE dept_emp (
	 emp_no INT NOT NULL
	,dept_no VARCHAR(10) NOT NULL
	,from_date DATE
	,to_date DATE
	,PRIMARY KEY (emp_no, dept_no)
	,FOREIGN KEY (emp_no) REFERENCES emp(emp_no)
	,FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);

CREATE TABLE dept_manager (
	 dept_no VARCHAR(10) NOT NULL
	,emp_no INT NOT NULL
	,from_date DATE
	,to_date DATE
	,PRIMARY KEY (dept_no, emp_no)
	,FOREIGN KEY (emp_no) REFERENCES emp(emp_no)
	,FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);
