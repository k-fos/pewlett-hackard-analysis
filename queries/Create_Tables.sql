--TABLES
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS emp_title;
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

CREATE TABLE emp_title (
	 title_no INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,emp_no INT NOT NULL
	,title VARCHAR(100) NOT NULL
	,from_date DATE
	,to_date DATE
	,FOREIGN KEY (emp_no) REFERENCES emp(emp_no)
);
--ALTER SEQUENCE title_no_seq RESTART WITH 10

-- IMPORT DATA
COPY emp(emp_no, birth_date, first_name, last_name, gender, hire_date)
FROM 'C:\Users\k-fos\OneDrive\UoM\Data Visualization\Pewlett_Analysis\employees.csv'
DELIMITER ','
CSV HEADER;

COPY dept(dept_no, dept_name)
FROM 'C:\Users\k-fos\OneDrive\UoM\Data Visualization\Pewlett_Analysis\departments.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp(emp_no, dept_no, from_date, to_date)
FROM 'C:\Users\k-fos\OneDrive\UoM\Data Visualization\Pewlett_Analysis\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager(dept_no, emp_no, from_date, to_date)
FROM 'C:\Users\k-fos\OneDrive\UoM\Data Visualization\Pewlett_Analysis\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY emp_title(emp_no, title, from_date, to_date)
FROM 'C:\Users\k-fos\OneDrive\UoM\Data Visualization\Pewlett_Analysis\titles.csv'
DELIMITER ','
CSV HEADER;
