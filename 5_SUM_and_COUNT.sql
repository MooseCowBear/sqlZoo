/* 
  lesson 5
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT SUM(population)
FROM world;

/* #2 */
SELECT DISTINCT continent 
FROM world;

/* #3 */
SELECT SUM(gdp) 
FROM world 
WHERE continent = 'Africa';

/* #4 */
SELECT COUNT(DISTINCT name) 
FROM world 
WHERE area >= 1000000;

/* #5 */
SELECT SUM(population) 
FROM world 
WHERE name in ('Estonia', 'Latvia', 'Lithuania');

/* #6 */
SELECT continent, COUNT(name) 
FROM world 
GROUP BY continent;

/* #7 */
SELECT continent, COUNT(name) 
FROM world
WHERE population >= 10000000
GROUP BY continent;

/* #8 */
SELECT continent 
FROM world 
GROUP BY continent 
HAVING SUM(population) >= 100000000;
