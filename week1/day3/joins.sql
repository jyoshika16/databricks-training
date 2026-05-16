/*
Day 3 SQL JOIN Practice

Practiced different SQL JOIN concepts using multiple tables.
Solved queries using LEFT JOIN, RIGHT JOIN and FULL OUTER JOIN.
Checked outputs and understood how tables are connected using common IDs and relationships.
*/

-- Q1 Display all students and the courses they are enrolled in including students with no courses
SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
LEFT JOIN courses
ON enrollments.course_id = courses.course_id;

-- Q2 Find all courses that currently have no students enrolled
SELECT courses.course_name
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
WHERE enrollments.course_id IS NULL;

-- Q3 Display all instructors and the courses they teach including instructors with no courses
SELECT instructors.instructor_name, courses.course_name
FROM instructors
LEFT JOIN courses
ON instructors.instructor_id = courses.instructor_id;

-- Q4 Find all courses that do not have an instructor assigned
SELECT course_name
FROM courses
WHERE instructor_id IS NULL;

-- Q5 Display all students and enrollment information using RIGHT JOIN
SELECT students.student_name, enrollments.course_id
FROM enrollments
RIGHT JOIN students
ON enrollments.student_id = students.student_id;

-- Q6 Find students who are not enrolled in any course
SELECT students.student_name
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

-- Q7 Use FULL OUTER JOIN to display all students and enrollments including unmatched rows
SELECT students.student_name, enrollments.course_id
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id

UNION

SELECT students.student_name, enrollments.course_id
FROM students
RIGHT JOIN enrollments
ON students.student_id = enrollments.student_id;

-- Q8 Find all courses that have never appeared in the enrollments table
SELECT courses.course_name
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
WHERE enrollments.course_id IS NULL;

-- Q9 Display all instructors and courses using FULL OUTER JOIN and identify unmatched rows
SELECT instructors.instructor_name, courses.course_name
FROM instructors
LEFT JOIN courses
ON instructors.instructor_id = courses.instructor_id

UNION

SELECT instructors.instructor_name, courses.course_name
FROM instructors
RIGHT JOIN courses
ON instructors.instructor_id = courses.instructor_id;

-- Q10 Create a report showing student name, course name and instructor name
SELECT students.student_name, courses.course_name, instructors.instructor_name
FROM students
LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
LEFT JOIN courses
ON enrollments.course_id = courses.course_id
LEFT JOIN instructors
ON courses.instructor_id = instructors.instructor_id;

-- Bonus Question Display every student and every course even if no enrollment exists
SELECT students.student_name, courses.course_name
FROM students
CROSS JOIN courses;
