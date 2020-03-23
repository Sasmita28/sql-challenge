--DROP TABLE IF EXISTS  departments;
--DROP TABLE IF EXISTS  dept_emp;
--DROP TABLE IF EXISTS  dept_manager;
--DROP TABLE IF EXISTS  employees;
--DROP TABLE IF EXISTS  salaries;
--DROP TABLE IF EXISTS  titles;
CREATE TABLE departments(
	dept_no VARCHAR (20) PRIMARY KEY NOT NULL UNIQUE,
	dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL ,
	dept_no VARCHAR(20) NOT NULL,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY(emp_no,dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY(dept_no,emp_no)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(10),
	hire_date DATE
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT ,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	PRIMARY KEY(emp_no,title,from_date)
);


ALTER TABLE "dept_manager"  ADD CONSTRAINT "fk_dept_manager_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");