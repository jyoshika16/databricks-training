/*
Number Functions Practice

Practiced different MySQL numeric functions using employee salary and bonus data.
Learned how mathematical calculations and rounding operations work in SQL.
*/

-- Q1 Find absolute value
SELECT ABS(-100);

-- Q2 Round salary values
SELECT ROUND(base_salary,2)
FROM employee_salary;

-- Q3 Round salary upward
SELECT CEIL(base_salary)
FROM employee_salary;

-- Q4 Round salary downward
SELECT FLOOR(base_salary)
FROM employee_salary;

-- Q5 Remove decimals without rounding
SELECT TRUNCATE(base_salary,1)
FROM employee_salary;

-- Q6 Find remainder using MOD
SELECT MOD(experience_years,2)
FROM employee_salary;

-- Q7 Find power value
SELECT POWER(2,3);

-- Q8 Find square root
SELECT SQRT(64);

-- Q9 Identify sign of salary
SELECT SIGN(base_salary)
FROM employee_salary;

-- Q10 Generate random number
SELECT RAND();

-- Q11 Format salary values
SELECT FORMAT(base_salary,2)
FROM employee_salary;

-- Q12 Find highest value between salary and bonus
SELECT emp_name,
GREATEST(base_salary, IFNULL(bonus,0))
FROM employee_salary;

-- Q13 Find lowest value between salary and bonus
SELECT emp_name,
LEAST(base_salary, IFNULL(bonus,0))
FROM employee_salary;
