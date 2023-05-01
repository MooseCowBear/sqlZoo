/* 
  lesson 9
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT COUNT(*) 
FROM stops;

/* #2 */
SELECT id 
FROM stops 
WHERE name = 'Craiglockhart';

/* #3 */
SELECT stops.id, stops.name 
FROM stops 
JOIN route 
ON stops.id = route.stop 
WHERE route.num = 4 
AND route.company = 'LRT';

/* #4 */
SELECT company, num, COUNT(*)
FROM route 
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

/* #5 */
SELECT a.company, a.num, a.stop, b.stop
FROM route a 
JOIN route b 
ON
(
  a.company=b.company 
  AND a.num=b.num
)
WHERE a.stop = 
(
  SELECT id 
  FROM stops 
  WHERE name = 'Craiglockhart'
) 
AND b.stop = 
(
  SELECT id 
  FROM stops 
  WHERE name = 'London Road'
);

/* #6 */
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a 
JOIN route b 
ON
(
  a.company = b.company 
  AND a.num = b.num
)
JOIN stops stopa 
ON 
(
  a.stop = stopa.id
)
JOIN stops stopb ON 
(
  b.stop = stopb.id
)
WHERE stopa.name = 'Craiglockhart' 
AND stopb.name = 'London Road';

/* #7 */
SELECT DISTINCT a.company, a.num
FROM route a 
JOIN route b 
ON
(
  a.company = b.company
   AND a.num = b.num
)
JOIN stops stopa 
ON 
(
  a.stop = stopa.id
)
JOIN stops stopb 
ON 
(
  b.stop = stopb.id
)
WHERE stopa.name = 'Haymarket' 
AND stopb.name = 'Leith';

/* #8 */
SELECT DISTINCT a.company, a.num
FROM route a 
JOIN route b 
ON
(
  a.company = b.company 
  AND a.num=b.num
)
JOIN stops stopa 
ON 
(
  a.stop = stopa.id
)
JOIN stops stopb 
ON 
(
  b.stop = stopb.id
)
WHERE stopa.name = 'Craiglockhart' 
AND stopb.name = 'Tollcross';

/* #9 */
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a 
JOIN route b 
ON
(
  a.company = b.company 
  AND a.num = b.num
)
JOIN stops stopa 
ON 
(
  a.stop = stopa.id
)
JOIN stops stopb 
ON 
(
  b.stop = stopb.id
)
WHERE stopa.name = 'Craiglockhart';

/* #10 */
SELECT DISTINCT second.bus_num, second.comp, first.stop_name, first.bus_num, first.comp 
FROM 
(
  SELECT DISTINCT stopb.name AS stop_name, a.company AS comp, a.num AS bus_num
  FROM route a 
  JOIN route b 
  ON
  (
    a.company = b.company 
    AND a.num = b.num
  )
  JOIN stops stopa 
  ON 
  ( 
    a.stop = stopa.id
  )
  JOIN stops stopb 
  ON 
  (
    b.stop = stopb.id
  )
  WHERE stopa.name = 'Craiglockhart'
) 
AS second
JOIN 

(
  SELECT DISTINCT stopb.name AS stop_name, a.company AS comp, a.num AS bus_num
  FROM route a 
  JOIN route b 
  ON
  (
    a.company = b.company 
    AND a.num = b.num
  )
  JOIN stops stopa 
  ON 
  (
    a.stop = stopa.id
  )
  JOIN stops stopb 
  ON 
  (
    b.stop = stopb.id
  )
  WHERE stopa.name='Lochend'
) 
AS first
ON first.stop_name = second.stop_name;