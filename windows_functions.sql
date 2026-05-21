CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);


INSERT INTO employees (emp_id, name, department, salary) VALUES
(1, 'Rahul', 'IT', 80000),
(2, 'Sneha', 'IT', 95000),
(3, 'Kiran', 'IT', 95000),
(4, 'Anjali', 'IT', 60000),

(5, 'Ravi', 'HR', 70000),
(6, 'Meena', 'HR', 85000),
(7, 'Arjun', 'HR', 85000),
(8, 'Pooja', 'HR', 50000),

(9, 'Vikram', 'Finance', 90000),
(10, 'Divya', 'Finance', 75000),
(11, 'Suresh', 'Finance', 75000),
(12, 'Neha', 'Finance', 65000),

(13, 'Aman', 'Sales', 55000),
(14, 'Priya', 'Sales', 72000),
(15, 'Rohit', 'Sales', 72000),
(16, 'Kavya', 'Sales', 48000);






desc employees;
-- 👉 Get the highest paid employee in each department
select * from(select name,department,rank() over(partition by department order by salary desc) as r from employees)t where r=1;

-- 👉 Show top 2 salaries in each department
select * from(select name,department,rank() over(partition by department order by salary desc) as r from employees)t where r<=2;

-- 👉 If multiple employees have same highest salary, show all of them
select * from(select name,department,rank() over(partition by department order by salary desc) as r from employees)t where r=1;

-- 👉 Assign a unique row number to employees within each department
select name,department,row_number() over(partition by department order by salary desc) as r from employees;

-- 👉 Rank employees without skipping numbers even if salaries are same
select name,salary,dense_rank() over(partition by department order by salary) from employees;

-- 👉 Rank employees where:
-- Same salary → same rank
-- Next rank is skipped
select name,salary,rank() over(partition by department order by salary) from employees;

-- 👉 Return employees with 2nd highest salary
select * from(select name,department,rank() over(partition by department order by salary desc) as r from employees)t where r=2;

-- 👉 Get lowest 2 salary employees
select * from(select name,salary,department,rank() over(partition by department order by salary) as r from employees)t where r<=2;

-- 👉 Show only one employee per salary per department
select * from(select name,salary,department,row_number() over(partition by department order by salary) as r from employees)t where r<=2;

-- 👉 Display employees sorted by salary with ranking like:
-- IT → Rank 1, 2, 3...
-- HR → Rank 1, 2, 3...
select name,salary,department,rank() over(partition by department order by salary) as r from employees