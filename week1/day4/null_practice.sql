/*
NULL Functions Practice

Practiced handling NULL values using IFNULL, COALESCE, NULLIF and IS NULL conditions.
Solved practice queries related to salaries, bonuses, discounts and missing records.
*/

-- Q1 Show all employees whose salary is NULL
SELECT * FROM Employees
WHERE salary IS NULL;

-- Q2 Show all orders where discount is NOT NULL
SELECT * FROM Orders
WHERE discount IS NOT NULL;

-- Q3 Get products where category is NULL
SELECT * FROM Products
WHERE category IS NULL;

-- Q4 Count employees with NULL manager_id
SELECT COUNT(*) FROM Employees
WHERE manager_id IS NULL;

-- Q5 Replace NULL salary with 0
SELECT name, IFNULL(salary,0) AS salary
FROM Employees;

-- Q6 Replace NULL bonus with 1000
SELECT name, IFNULL(bonus,1000) AS bonus
FROM Employees;

-- Q7 Show employee earnings using salary, if NULL use bonus
SELECT name, COALESCE(salary, bonus) AS earnings
FROM Employees;

-- Q8 Show first available value salary → bonus → 0
SELECT name, COALESCE(salary, bonus, 0) AS income
FROM Employees;

-- Q9 Show products where price is NULL but category is NOT NULL
SELECT * FROM Products
WHERE price IS NULL
AND category IS NOT NULL;

-- Q10 Show employees where both salary and bonus are NULL
SELECT * FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;
