/* 
  lesson 4
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT name 
FROM world
WHERE population >
(SELECT population 
FROM world
WHERE name='Russia');

/* #2 */
SELECT name 
FROM world
WHERE continent = 'europe' 
AND gdp/population > 
(SELECT gdp/population 
FROM world
WHERE name = 'united kingdom');

/* #3 */
SELECT name, continent 
FROM world
WHERE continent IN 
(SELECT continent 
FROM world 
WHERE name = 'Argentina' 
OR name = 'Australia')
ORDER BY name;

/* #4 */
SELECT name, population 
FROM world
WHERE population > 
(SELECT population 
FROM world 
WHERE name = 'united kingdom') 
AND population < 
(SELECT population 
FROM world 
WHERE name = 'germany');

/* #5 -- PostgreSQL bc getting server error */
SELECT name, 
CONCAT(ROUND(population::float / (SELECT population FROM world WHERE name = 'Germany')*100), '%') 
AS percentage
FROM world
WHERE continent = 'Europe';

/* #6 */
SELECT name 
FROM world
WHERE gdp > 
ALL(SELECT gdp 
FROM world 
WHERE gdp > 0 
AND continent = 'Europe');

/* #7 */
SELECT continent, name, area 
FROM world x
WHERE area >= 
ALL(SELECT area 
FROM world y
WHERE y.continent = x.continent
AND area > 0);

/* #8 */
SELECT continent, name 
FROM world x
WHERE name <= 
ALL(SELECT name 
FROM world y 
WHERE y.continent = x.continent);

/* #9 */
SELECT name, continent, population 
FROM world x
WHERE 25000000 >= 
ALL(SELECT population 
FROM world y 
WHERE x.continent = y.continent);

/* #10 (postgreSQL) */
SELECT name, continent
FROM world x
WHERE x.population / 3.0 > 
ALL(SELECT population 
FROM world y 
WHERE x.continent = y.continent 
AND x.name != y.name);
