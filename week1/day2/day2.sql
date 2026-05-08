-- Q46 Select employees who earn more than the highest salary in HR department
SELECT * FROM Employee WHERE salary > (SELECT MAX(salary) FROM Employee WHERE department_id = 2);

-- Q47 Select employees who work in departments having more than 2 employees
SELECT * FROM Employee WHERE department_id IN (SELECT department_id FROM Employee GROUP BY department_id HAVING COUNT(*) > 2);

-- Q48 Select employees who are not assigned to any department
SELECT * FROM Employee WHERE department_id IS NULL;

-- Q49 Select projects that are not assigned to any department
SELECT * FROM Project WHERE department_id IS NULL;

-- Q50 Select employees whose salary is equal to the minimum salary
SELECT * FROM Employee WHERE salary = (SELECT MIN(salary) FROM Employee);

-- Q51 Select employees whose age is greater than average age
SELECT * FROM Employee WHERE age > (SELECT AVG(age) FROM Employee);

-- Q52 Select department names with total number of projects
SELECT Department.name, COUNT(Project.project_id) FROM Department LEFT JOIN Project ON Department.department_id = Project.department_id GROUP BY Department.name;

-- Q53 Select departments that do not have any projects
SELECT Department.name FROM Department LEFT JOIN Project ON Department.department_id = Project.department_id WHERE Project.project_id IS NULL;

-- Q54 Select employees hired after the average hire date
SELECT * FROM Employee WHERE hire_date > (SELECT AVG(hire_date) FROM Employee);

-- Q55 Select employees whose salary is between 50000 and 70000
SELECT * FROM Employee WHERE salary BETWEEN 50000 AND 70000;

-- Q56 Select employees whose names contain exactly one space
SELECT * FROM Employee WHERE name LIKE '% %';

-- Q57 Select all projects ordered by project name
SELECT * FROM Project ORDER BY name;

-- Q58 Select employees along with department names and project names
SELECT Employee.name, Department.name, Project.name FROM Employee JOIN Department ON Employee.department_id = Department.department_id JOIN Project ON Department.department_id = Project.department_id;

-- Q59 Select department with minimum average salary
SELECT department_id, AVG(salary) FROM Employee GROUP BY department_id ORDER BY AVG(salary) LIMIT 1;

-- Q60 Select employees whose salary is greater than all employees in Finance department
SELECT * FROM Employee WHERE salary > ALL (SELECT salary FROM Employee WHERE department_id = 3);
