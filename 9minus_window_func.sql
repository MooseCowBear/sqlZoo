/* 
  lesson 2
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT lastName, party, votes
FROM ge
WHERE constituency =  'S14000024' 
AND yr = 2017
ORDER BY votes DESC;

/* #2 */
SELECT party, votes, RANK() OVER (ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000024' 
AND yr = 2017
ORDER BY party;

/* #3 */
SELECT yr,party, votes, RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party,yr;

/* #4 */
SELECT ge.constituency, party, votes, RANK() OVER(PARTITION BY ge.constituency ORDER BY ge.votes DESC) posn
FROM ge
WHERE ge.constituency 
BETWEEN 'S14000021' AND 'S14000026'
AND yr  = 2017
ORDER BY posn, constituency;

/* #5 */
SELECT constituency, party FROM (SELECT ge.constituency, party, 
RANK() OVER(PARTITION BY ge.constituency ORDER BY ge.votes DESC) posn
FROM ge
WHERE ge.constituency 
BETWEEN 'S14000021' AND 'S14000026'
AND yr  = 2017) AS res 
WHERE res.posn = 1;

/* #6 */
SELECT party, COUNT(*) FROM (SELECT ge.constituency, party,
RANK() OVER(PARTITION BY ge.constituency ORDER BY ge.votes DESC) posn
FROM ge
WHERE ge.constituency LIKE 'S%'
AND yr  = 2017) AS res 
WHERE res.posn = 1 
GROUP BY party;