/*
CASE Statements and Real-Time SQL Scenarios

Practiced CASE WHEN conditions and real-time business logic using employee and order data.
Learned how conditional expressions are used in SQL reporting and analysis.
*/

-- Q1 Categorize employees based on salary
SELECT name, salary,
CASE
WHEN salary >= 70000 THEN 'High Salary'
WHEN salary >= 50000 THEN 'Medium Salary'
ELSE 'Low Salary'
END AS salary_category
FROM Employees;

-- Q2 Show order amount status
SELECT order_id, amount,
CASE
WHEN amount >= 3000 THEN 'High Order'
WHEN amount >= 1500 THEN 'Medium Order'
ELSE 'Low Order'
END AS order_status
FROM Orders;

-- Q3 Identify employees with NULL salary
SELECT name,
CASE
WHEN salary IS NULL THEN 'Salary Missing'
ELSE 'Salary Available'
END AS salary_status
FROM Employees;

-- Q4 Generate financial year
SELECT order_date,
CASE
WHEN MONTH(order_date) >= 4
THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
FROM orders;

-- Q5 Categorize products based on stock
SELECT product_name, stock,
CASE
WHEN stock = 0 THEN 'Out of Stock'
WHEN stock IS NULL THEN 'Stock Not Available'
ELSE 'Available'
END AS stock_status
FROM Products;

-- Q6 Show bonus status
SELECT name, bonus,
CASE
WHEN bonus IS NULL THEN 'No Bonus'
ELSE 'Bonus Available'
END AS bonus_status
FROM Employees;

-- Q7 Identify weekend and weekday orders
SELECT order_id, order_date,
CASE
WHEN DAYNAME(order_date) IN ('Saturday','Sunday')
THEN 'Weekend'
ELSE 'Weekday'
END AS order_day_type
FROM orders;

-- Q8 Categorize employee experience
SELECT emp_name, experience_years,
CASE
WHEN experience_years >= 7 THEN 'Senior'
WHEN experience_years >= 4 THEN 'Mid Level'
ELSE 'Junior'
END AS experience_level
FROM employee_salary;
