/* 
  lesson 1 
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT name FROM world
WHERE name LIKE 'Y%';

/* #2 */
SELECT name FROM world
WHERE name LIKE '%Y';

/* #3 */
SELECT name FROM world
WHERE name LIKE '%x%';

/* #4 */
SELECT name FROM world
WHERE name LIKE '%land';

/* #5 */
SELECT name FROM world
WHERE name LIKE 'C%ia';

/* #6 */
SELECT name FROM world
WHERE name LIKE '%oo%';

/* #7 */
SELECT name FROM world
WHERE name LIKE '%a%a%a%';

/* #8 */
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name;

/* #9 */
SELECT name FROM world
WHERE name LIKE '%o__o%';

/* #10 */
SELECT name FROM world
WHERE name LIKE '____';

/* #11 */
SELECT name
FROM world
WHERE name LIKE capital;

/* #12 */
SELECT name
FROM world
WHERE capital LIKE concat(name, ' city');

/* #13 */
SELECT capital, name 
FROM world
WHERE capital LIKE concat('%', name, '%');

/* #14 */
SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%') AND name != capital;

/* #15 -- did not get feedback */
/* option one, extension must be nonempty */
SELECT name, REPLACE(capital, name, '') AS extension
FROM world
WHERE  capital LIKE concat('%', name, '%') AND name != capital; 

/* option two, empty extension is ok */
SELECT name, REPLACE(capital, name, '') AS extension
FROM world
WHERE  capital LIKE concat('%', name, '%');