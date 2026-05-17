/*
Date Functions Practice

Practiced different MySQL date and timestamp functions.
Solved queries related to orders, delivery dates and date calculations using real-time examples.
*/

-- Q1 Show current date
SELECT CURDATE();

-- Q2 Show current date and time
SELECT NOW();

-- Q3 Extract year from order_date
SELECT YEAR(order_date)
FROM orders;

-- Q4 Extract month from order_date
SELECT MONTH(order_date)
FROM orders;

-- Q5 Extract day from order_date
SELECT DAY(order_date)
FROM orders;

-- Q6 Show month name from order_date
SELECT MONTHNAME(order_date)
FROM orders;

-- Q7 Show day name from order_date
SELECT DAYNAME(order_date)
FROM orders;

-- Q8 Find delivery days difference
SELECT order_id,
DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- Q9 Find month difference using TIMESTAMPDIFF
SELECT TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff
FROM orders;

-- Q10 Format order date
SELECT DATE_FORMAT(order_date, '%d-%m-%Y')
FROM orders;

-- Q11 Show orders placed in January
SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- Q12 Show weekend orders
SELECT *
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday','Sunday');
