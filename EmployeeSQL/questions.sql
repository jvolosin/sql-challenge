--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
"Employees".emp_no, 
"Employees".last_name, 
"Employees".first_name, 
"Employees".sex, 
"Salaries".salary 
FROM "Employees"
INNER JOIN "Salaries" ON
"Employees".emp_no = "Salaries".emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date
FROM "Employees"
WHERE hire_date LIKE '%1986'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
"Departments".dept_no,
"Departments".dept_name,
"Dept_Manager".emp_no,
"Employees".last_name,
"Employees".first_name
FROM "Departments"
INNER JOIN "Dept_Manager" ON
"Departments".dept_no = "Dept_Manager".dept_no
INNER JOIN "Employees" ON
"Dept_Manager".emp_no = "Employees".emp_no;


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
"Employees".emp_no,
"Employees".last_name,
"Employees".first_name,
"Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_Emp" ON
"Employees".emp_no = "Dept_Emp".emp_no
INNER JOIN "Departments" ON
"Dept_Emp".dept_no = "Departments".dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
first_name,
last_name,
sex
FROM "Employees"
WHERE (first_name = 'Hercules')
AND (last_name LIKE 'B%');

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
"Employees".emp_no,
"Employees".last_name,
"Employees".first_name,
"Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_Emp" ON
"Dept_Emp".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON
"Departments".dept_no = "Dept_Emp".dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
emp_no,
last_name,
first_name
FROM "Employees"
WHERE emp_no IN
(
	SELECT emp_no
	FROM "Dept_Emp"
	WHERE dept_no IN
	(	
		SELECT dept_no
		FROM "Departments"
		WHERE (dept_name = 'Sales') OR (dept_name = 'Development')
	)
);

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "Last Name Count"
FROM "Employees"
GROUP BY last_name 
ORDER BY "Last Name Count" DESC;