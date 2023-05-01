/* 
  lesson 3
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

/* #2 */
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';

/* #3 */
SELECT yr, subject 
FROM nobel
WHERE winner = 'albert einstein';

/* #4 */
SELECT winner 
FROM nobel 
WHERE subject = 'peace' AND yr >= 2000;

/* #5 */
SELECT * 
FROM nobel 
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989;

/* #6 */
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

/* #7 */
SELECT winner 
FROM nobel
WHERE winner LIKE 'John%';

/* #8 */
SELECT * 
FROM nobel 
WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984);

/* #9 */
SELECT * 
FROM nobel
WHERE subject NOT IN ('chemistry', 'medicine') AND yr = 1980;

/* #10 */
SELECT * 
FROM nobel 
WHERE (subject = 'medicine' AND yr < 1910) OR (subject = 'literature' AND yr >= 2004);

/* #11 */
SELECT * 
FROM nobel 
WHERE winner = 'Peter GrÜnberg';

/* #12 */
SELECT * 
FROM nobel 
WHERE winner = 'Eugene O''Neill';

/* #13 */
SELECT winner, yr, subject 
FROM nobel 
WHERE winner LIKE 'sir%'
ORDER BY yr DESC, winner;

/* #14 */
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY
CASE
WHEN subject IN ('Physics', 'Chemistry') THEN 1
ELSE 0
END, 
subject, winner
