--Drop tables if they exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

--create all tables
create table departments(
dept_no varchar PRIMARY KEY NOT NULL,
dept_name varchar NOT NULL);

create table titles(
title_id varchar PRIMARY KEY NOT NULL,
title varchar NOT NULL);

create table employees(
emp_no int PRIMARY KEY NOT NULL,
emp_title varchar NOT NULL, 
foreign key (emp_title) references titles(title_id),
birth_date DATE,
first_name varchar NOT NULL,
last_name varchar NOT NULL,
sex varchar(1) NOT NULL,
hire_date DATE);

create table dept_manager(
dept_no varchar NOT NULL,
emp_no int NOT NULL,
FOREIGN KEY (dept_no) references departments(dept_no),
foreign key (emp_no) references employees(emp_no),
PRIMARY KEY (dept_no, emp_no));

create table dept_emp(
emp_no int NOT NULL,
dept_no varchar NOT NULL,
foreign key (emp_no) references employees(emp_no),
foreign key (dept_no) references departments(dept_no),
PRIMARY KEY (emp_no, dept_no));

create table salaries(
emp_no int NOT NULL PRIMARY KEY,
foreign key (emp_no) references employees(emp_no),
salary int NOT NULL) ;