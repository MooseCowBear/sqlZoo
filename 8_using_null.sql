/* 
  lesson 8
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT name 
FROM teacher 
WHERE dept IS NULL;

/* #2 */
SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept
ON 
(
  teacher.dept=dept.id
);

/* #3 */
SELECT teacher.name, dept.name
FROM teacher 
LEFT JOIN dept 
ON teacher.dept = dept.id;

/* #4 */
SELECT teacher.name, dept.name
FROM teacher 
RIGHT JOIN dept 
ON teacher.dept = dept.id;

/* #5 */
SELECT teacher.name, COALESCE(mobile, '07986 444 2266') 
FROM teacher;

/* #6 */
SELECT teacher.name, COALESCE(dept.name, 'None') 
FROM teacher 
LEFT JOIN dept 
ON teacher.dept = dept.id;

/* 7 */
SELECT COUNT(id), COUNT(mobile) 
FROM teacher;

/* #8 */
SELECT dept.name, COUNT(teacher.dept) 
FROM teacher 
RIGHT JOIN dept 
ON teacher.dept = dept.id 
GROUP BY dept.name;

/* #9 */
SELECT name, 
CASE
WHEN dept = 1 OR dept = 2 THEN 'Sci'
ELSE 'Art'
END
FROM teacher

/* #10 */
SELECT name, 
CASE
  WHEN dept = 1 OR dept = 2 THEN 'Sci'
  WHEN dept = 3 THEN 'Art'
  ELSE 'None'
END
FROM teacher;
