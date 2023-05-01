/* 
  lesson 8+
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. The overwhelming majority of these answers were 
  tested with the Microsoft SQL. There are a few questions for which only the PostgreSQL
  server worked. Those answers are labeled as such.
*/

/* #1 */
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
AND institution='Edinburgh Napier University'
AND subject='(8) Computer Science';

/* #2 */
SELECT institution, subject
FROM nss
WHERE question='Q15' 
AND score >= 100;

/* #3 */
SELECT institution,score
FROM nss
WHERE question='Q15' 
AND score < 50
AND subject='(8) Computer Science';

/* #4 */
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
AND (
  subject='(H) Creative Arts and Design'
  OR subject='(8) Computer Science'
)
GROUP BY subject;

/* #5 */
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
FROM nss
WHERE question='Q22'
AND 
(
  subject ='(H) Creative Arts and Design'
  OR subject='(8) Computer Science'
)
GROUP BY subject;

/* #6 (not sure why round gave the wrong answer, but floor gave the one they wanted... */
SELECT subject, FLOOR(SUM(response * A_STRONGLY_AGREE / 100.0) / SUM(response) * 100)
FROM nss
WHERE question='Q22'
AND 
(
  subject ='(H) Creative Arts and Design'
  OR subject='(8) Computer Science'
)
GROUP BY subject;

/* #7 */
SELECT institution, ROUND(SUM(score *  response) / SUM(response), 0)
FROM nss
WHERE question='Q22'
AND 
(
  institution LIKE '%Manchester%'
)
GROUP BY institution;

/* #8 */
SELECT institution, 
SUM(sample), 
(
  SELECT sample 
  FROM nss y 
  WHERE subject = '(8) Computer Science'
  AND x.institution = y.institution 
  AND question='Q01'
) 
AS computing 
FROM nss x 
WHERE question='Q01'
AND institution LIKE '%Manchester%'
GROUP BY institution;
