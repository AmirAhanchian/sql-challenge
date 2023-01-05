-- 1.List the employee number, last name, first name, sex, and salary of each employee.

select "Employee info".emp_no, "Employee info".last_name, "Employee info".first_name, 
"Employee info".sex,  "Salaries".salary
from "Employee info"
left join "Salaries" 
on "Salaries".emp_no = "Employee info".emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986

select "Employee info".last_name, "Employee info".first_name, "Employee info".hire_date
from "Employee info"
where extract (year from hire_date) = 1986;

-- 3. List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
select "Dept_Manager".dept_no, "Departments".dept_name, "Employee info".emp_no, "Employee info".last_name, "Employee info".first_name 
from "Dept_Manager"
left join "Employee info"
on "Employee info".emp_no = "Dept_Manager".emp_no
left join "Departments"
on "Departments".dept_no = "Dept_Manager".dept_no

-- 4. List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.

select "Dept_Employees".dept_no, "Employee info".emp_no, "Employee info".last_name, "Employee info".first_name, "Departments".dept_name 
from "Dept_Employees"
left join "Employee info"
on "Employee info".emp_no = "Dept_Employees".emp_no
left join "Departments"
on "Departments".dept_no = "Dept_Employees".dept_no

-- 5. List first name, last name, and sex of each employee whose first name
-- is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from "Employee info"
where first_name = 'Hercules' and last_name Like 'B%'

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

select "Employee info".emp_no, "Employee info".last_name, "Employee info".first_name, "Departments".dept_name 
from "Dept_Employees"
left join "Employee info"
on "Employee info".emp_no = "Dept_Employees".emp_no
left join "Departments"
on "Departments".dept_no = "Dept_Employees".dept_no
where "Departments".dept_name = 'Sales'

-- 7. List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select "Employee info".emp_no, "Employee info".last_name, "Employee info".first_name, "Departments".dept_name 
from "Dept_Employees"
left join "Employee info"
on "Employee info".emp_no = "Dept_Employees".emp_no
left join "Departments"
on "Departments".dept_no = "Dept_Employees".dept_no
where "Departments".dept_name = 'Sales' or "Departments".dept_name = 'Development'

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

select last_name, count (last_name) as name_count
from "Employee info"
group by last_name
order by name_count desc;




