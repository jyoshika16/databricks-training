/*
Window Functions Practice

Practiced ROW_NUMBER(), RANK() and DENSE_RANK() functions using employee salary and department data.
Learned how ranking and analytical functions work in SQL.
*/

-- Q1 Assign row numbers based on highest salary
SELECT emp_name, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

-- Q2 Assign row numbers within each department
SELECT emp_name, department, salary,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

-- Q3 Rank employees based on highest salary
SELECT emp_name, salary,
RANK() OVER(ORDER BY salary DESC) AS emp_rank
FROM employees;

-- Q4 Rank employees within each department
SELECT emp_name, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

-- Q5 Assign dense rank based on highest salary
SELECT emp_name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num
FROM employees;

-- Q6 Assign dense rank within each department
SELECT emp_name, department, salary,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_dense_rank
FROM employees;

-- Q7 Assign row numbers based on latest joining date
SELECT emp_name, join_date,
ROW_NUMBER() OVER(ORDER BY join_date DESC) AS joining_order
FROM employees;

-- Q8 Rank employees alphabetically
SELECT emp_name,
RANK() OVER(ORDER BY emp_name ASC) AS name_rank
FROM employees;
