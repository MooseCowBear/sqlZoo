/* 
  lesson 9+
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.

  the site's feedback mechanism seemed to be broken for some of these. so maybe they are 
  what was asked. maybe not. you'll have to figure it out. 

  also i didn't bother to figure out how to format the dates nicely.
*/

/* #1 */
SELECT name, DAY(whn), confirmed, deaths, recovered
FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

/* #2 */
SELECT name, DAY(whn), confirmed,
LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

/* #3 */
SELECT name, DAY(whn), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS new
FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

/* #4 */
SELECT name, confirmed -
LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS new
FROM Covid
WHERE name = 'Italy'
AND DATEPART(weekday, whn) = 2 AND YEAR(whn) = 2020
ORDER BY whn

/* #5 */
SELECT tw.name, tw.whn, tw.confirmed - lw.confirmed AS new
FROM covid tw 
LEFT JOIN covid lw 
ON DATEADD(week, 1, lw.whn) = tw.whn
AND tw.name=lw.name
WHERE tw.name = 'Italy'
AND DATEPART(weekday, tw.whn) = 2
ORDER BY tw.whn

/* #6 */
SELECT name, confirmed, RANK() OVER (ORDER BY confirmed DESC) rc, deaths, RANK() OVER (ORDER BY deaths DESC) rd
FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC

/* #7 */
/* getting a system error message regardless of what I try to enter here */

/* #8 */
WITH temp AS (
  SELECT *, (confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)) day_count
  FROM covid
), peaks AS (
  SELECT name, MAX(day_count) peak
  FROM temp
  GROUP BY name
  HAVING MAX(day_count) > 1000
)
SELECT DISTINCT peaks.name, whn, peaks.peak
FROM peaks LEFT JOIN covid ON (peaks.name = covid.name)
ORDER BY whn;