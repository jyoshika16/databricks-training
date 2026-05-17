/*
REGEX Foundation Practice

Practiced basic regular expression patterns using emails, phone numbers and mixed text values.
Learned how pattern matching and text extraction work in SQL.
*/

-- Q1 Extract first digit from text
SELECT REGEXP_SUBSTR('123ABC','[0-9]');

-- Q2 Extract first alphabet from text
SELECT REGEXP_SUBSTR('123ABC','[A-Za-z]');

-- Q3 Extract digit at beginning of string
SELECT REGEXP_SUBSTR('123abc','^[0-9]+');

-- Q4 Extract digit at end of string
SELECT REGEXP_SUBSTR('abc123','[0-9]+$');

-- Q5 Extract exactly two digits
SELECT REGEXP_SUBSTR('abc12345','[0-9]{2}');

-- Q6 Extract continuous alphabets
SELECT REGEXP_SUBSTR('abc123xyz','[A-Za-z]+');

-- Q7 Extract continuous digits
SELECT REGEXP_SUBSTR('abc123xyz','[0-9]+');

-- Q8 Extract everything together
SELECT REGEXP_SUBSTR('abc123xyz','[A-Za-z0-9]+');

-- Q9 Extract email domain
SELECT REGEXP_SUBSTR('jyoshika@gmail.com','@[A-Za-z.]+');

-- Q10 Extract email extension
SELECT REGEXP_SUBSTR('jyoshika@gmail.com','\\.[A-Za-z]+$');

-- Q11 Extract phone country code
SELECT REGEXP_SUBSTR('+91-9876543210','\\+91');

-- Q12 Validate email format
SELECT REGEXP_SUBSTR(
'jyoshika.kumar@gmail.com',
'[A-Za-z0-9._-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}'
);
