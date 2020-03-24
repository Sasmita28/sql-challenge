SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender,s.salary
FROM employees AS e
JOIN salaries AS s
on e.emp_no = s.emp_no
;

--List employees who were hired in 1986.
SELECT first_name, last_name,hire_date
FROM employees
WHERE hire_date >='19860101'
AND hire_date < '19870101';

--List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.

CREATE VIEW dept_manager_info AS
SELECT dm.dept_no, d.dept_name,dm.emp_no,
e.last_name,e.first_name,dm.from_date,dm.to_date 

	FROM dept_manager AS dm LEFT JOIN employees AS e
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON dm.dept_no = d.dept_no;

SELECT * 
FROM dept_manager_info;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

CREATE VIEW employee_info AS
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees  AS e JOIN dept_emp AS demp
ON e.emp_no = demp.emp_no
JOIN departments  AS d
ON demp.dept_no = d.dept_no;

SELECT * FROM employee_info;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name


CREATE VIEW sales_employee AS
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e JOIN dept_emp AS demp
ON e.emp_no = demp.emp_no
JOIN departments AS d
ON demp.dept_no = d.dept_no
where dept_name = 'Sales';

SELECT * FROM sales_employee ;

-- List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
CREATE VIEW employee_sales_development AS
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e JOIN dept_emp AS demp
ON e.emp_no = demp.emp_no
JOIN departments AS d
ON demp.dept_no = d.dept_no
where dept_name = 'Development'
OR dept_name = 'Sales';

SELECT * FROM employee_sales_development;

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

CREATE VIEW same_last_name AS
SELECT last_name,COUNT(last_name) AS "same last name"
FROM employees 
GROUP BY last_name
order by "same last name" DESC;

SELECT * FROM same_last_name;
