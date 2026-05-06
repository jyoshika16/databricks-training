-- Day 1 SQL Practice
-- Practiced all queries one by one and checked outputs.
-- Understood the concepts and solved them for better practice.

--Q1 Select all columns from Employee table
SELECT * FROM Employee;

-- Q2 Select name and salary from Employee table
SELECT name, salary FROM Employee;

-- Q3 Select employees older than 30
SELECT * FROM Employee
WHERE age > 30;

-- Q4 Select names of all departments
SELECT name FROM Department;

-- Q5 Select employees who work in IT department
SELECT * FROM Employee
WHERE department_id = 1;

-- Q6 Select employees whose names start with J
SELECT * FROM Employee
WHERE name LIKE 'J%';

-- Q7 Select employees whose names end with e
SELECT * FROM Employee
WHERE name LIKE '%e';

-- Q8 Select employees whose names contain a
SELECT * FROM Employee
WHERE name LIKE '%a%';

-- Q9 Select employees whose names are exactly 9 characters long
SELECT * FROM Employee
WHERE LENGTH(name) = 9;

-- Q10 Select employees whose names have o as second character
SELECT * FROM Employee
WHERE name LIKE '_o%';

-- Q11 Select employees hired in the year 2020
SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

-- Q12 Select employees hired in January
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

-- Q13 Select employees hired before 2019
SELECT * FROM Employee
WHERE YEAR(hire_date) < 2019;

-- Q14 Select employees hired on or after March 1 2021
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

-- Q15 Select employees hired in the last 2 years
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Q16 Select total salary of all employees
SELECT SUM(salary) FROM Employee;

-- Q17 Select average salary of employees
SELECT AVG(salary) FROM Employee;

-- Q18 Select minimum salary in Employee table
SELECT MIN(salary) FROM Employee;

-- Q19 Select number of employees in each department
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id;

-- Q20 Select average salary of employees in each department
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id;

-- Q21 Select total salary in each department
SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id;

-- Q22 Select average age of employees in each department
SELECT department_id, AVG(age)
FROM Employee
GROUP BY department_id;

-- Q23 Select number of employees hired each year
SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date);

-- Q24 Select highest salary in each department
SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id;

-- Q25 Select department with highest average salary
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

-- Q26 Select departments with more than 2 employees
SELECT department_id, COUNT(*)
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Q27 Select departments with average salary greater than 55000
SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Q28 Select years where more than one employee was hired
SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- Q29 Select departments with total salary less than 100000
SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- Q30 Select departments with maximum salary greater than 75000
SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- Q31 Select all employees ordered by salary in ascending order
SELECT * FROM Employee
ORDER BY salary ASC;

-- Q32 Select all employees ordered by age in descending order
SELECT * FROM Employee
ORDER BY age DESC;

-- Q33 Select all employees ordered by hire date
SELECT * FROM Employee
ORDER BY hire_date ASC;

-- Q34 Select employees ordered by department and salary
SELECT * FROM Employee
ORDER BY department_id, salary;

-- Q35 Select departments ordered by total salary
SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
ORDER BY SUM(salary);

-- Q36 Select employee names with their department names
SELECT Employee.name, Department.name
FROM Employee
JOIN Department
ON Employee.department_id = Department.department_id;

-- Q37 Select project names with department names
SELECT Project.name, Department.name
FROM Project
JOIN Department
ON Project.department_id = Department.department_id;

-- Q38 Select employee names with project names
SELECT Employee.name, Project.name
FROM Employee
JOIN Project
ON Employee.department_id = Project.department_id;

-- Q39 Select all employees and their departments including employees without departments
SELECT Employee.name, Department.name
FROM Employee
LEFT JOIN Department
ON Employee.department_id = Department.department_id;

-- Q40 Select all departments and their employees including departments without employees
SELECT Department.name, Employee.name
FROM Department
LEFT JOIN Employee
ON Department.department_id = Employee.department_id;
