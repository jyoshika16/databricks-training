/*
String Functions Practice

Practiced different MySQL string functions using employee and department data.
Learned how to clean, format and manipulate text values in SQL.
*/

-- Q1 Find length of employee names
SELECT full_name, LENGTH(full_name)
FROM employees;

-- Q2 Convert department to uppercase
SELECT UPPER(department)
FROM employees;

-- Q3 Convert city names to lowercase
SELECT LOWER(city)
FROM employees;

-- Q4 Remove spaces from names
SELECT TRIM(full_name)
FROM employees;

-- Q5 Combine employee name and department
SELECT CONCAT(full_name, ' - ', department) AS emp_details
FROM employees;

-- Q6 Extract first 5 characters from email
SELECT SUBSTRING(email,1,5)
FROM employees;

-- Q7 Get first 4 characters from employee name
SELECT LEFT(full_name,4)
FROM employees;

-- Q8 Get last 3 characters from city
SELECT RIGHT(city,3)
FROM employees;

-- Q9 Find position of @ in email
SELECT email, INSTR(email,'@')
FROM employees;

-- Q10 Replace Data with Big Data
SELECT REPLACE(department,'Data','Big Data')
FROM employees;

-- Q11 Reverse employee names
SELECT REVERSE(full_name)
FROM employees;

-- Q12 Handle NULL remarks
SELECT full_name, IFNULL(remarks,'No remarks')
FROM employees;
