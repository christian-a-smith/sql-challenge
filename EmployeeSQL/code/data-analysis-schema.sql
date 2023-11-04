--drop alll views if they exist
drop view q1;
drop view q2;
drop view q3;
drop view q4;
drop view q5;
drop view q6;
drop view q7;
drop view q8;
--List the employee number, last name, first name, sex, and salary of each employee.
create view q1 as
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
	join salaries as s
	on (e.emp_no = s.emp_no);

select * from q1;

--List the first name, last name, and hire date for the employees who were hired in 1986.
create view q2 as
select first_name, last_name, hire_date
from employees
where hire_date BETWEEN '1986-01-01' and '1987-01-01';

select * from q2;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
create view q3 as
select e.first_name, e.last_name, dm.dept_no, d.dept_name, e.emp_no
from employees as e
	join dept_manager as dm
	on (e.emp_no = dm.emp_no)
		join departments as d
		on (dm.dept_no = d.dept_no);
		
select * from q3;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
create view q4 as
select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	join dept_emp as de
	on (e.emp_no=de.emp_no)
		join departments as d
		on (d.dept_no = de.dept_no);

select * from q4;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
create view q5 as
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

select * from q5;

--List each employee in the Sales department, including their employee number, last name, and first name.
create view q6 as
select de.emp_no, e.last_name, e.first_name
from dept_emp as de
	join employees as e
	on (de.emp_no = e.emp_no)
	where de.dept_no = 'd007';
	
select * from q6;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
create view q7 as
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	join dept_emp as de
	on (e.emp_no = de.emp_no)
		join departments as d
		on (d.dept_no = de.dept_no)
	where de.dept_no = 'd007' or de.dept_no = 'd005';

select * from q7;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
create view q8 as
select last_name, count(*) as lastnamecounts
from employees
group by last_name
order by lastnamecounts desc;

select * from q8;