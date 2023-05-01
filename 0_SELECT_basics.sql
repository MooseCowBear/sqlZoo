/* 
  sql zoo, lesson 0 
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1. */
SELECT population FROM world
  WHERE name = 'Germany';

/* #2. */
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* #3. */
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000; 