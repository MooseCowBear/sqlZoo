/* 
  lesson 7
  a note about these answers: at the time of completing the exercises, the mySQL 
  server was producing an error. Microsoft SQL was producing an error for this
  batch of questions. All the answers in this lesson were submitted with the 
  PostgreSQL server.
*/

/* #1 */
SELECT id, title
FROM movie
WHERE yr = 1962;

/* #2 */
SELECT yr 
FROM movie 
WHERE title = 'Citizen Kane';

/* #3 */
SELECT id, title, yr 
FROM movie 
WHERE title 
LIKE 'Star Trek%' 
ORDER BY yr;

/* #4 */
SELECT id 
FROM actor 
WHERE name = 'Glenn Close';

/* #5 */
SELECT id 
FROM movie 
WHERE title = 'Casablanca';

/* #6 */
SELECT name 
FROM actor 
JOIN casting 
ON actor.id = casting.actorid 
WHERE casting.movieid 
IN 
(
  SELECT id 
  FROM movie 
  WHERE title='Casablanca'
);

/* #7 */
SELECT name 
FROM actor 
JOIN casting 
ON actor.id = casting.actorid 
JOIN movie 
ON casting.movieid = movie.id 
WHERE title = 'Alien';

/* #8 */
SELECT title 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE actor.name = 'Harrison Ford';

/* #9 */
SELECT title 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor 
ON casting.actorid = actor.id 
WHERE actor.name = 'Harrison Ford' 
AND ord != 1;

/* #10 */
SELECT movie.title, actor.name 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
JOIN actor ON 
casting.actorid = actor.id 
WHERE movie.yr = 1962 
AND casting.ord =1;

/* #11 */
SELECT yr, COUNT(title) 
FROM movie 
JOIN casting 
ON movie.id = movieid
JOIN actor 
ON actorid = actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

/* #12 */
SELECT movie.title, actor.name 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid
JOIN actor 
ON casting.actorid = actor.id 
WHERE casting.movieid 
IN 
(
  SELECT casting.movieid 
  FROM casting
  WHERE actorid 
  IN 
  (
    SELECT id 
    FROM actor 
    WHERE name='Julie Andrews'
  )
) 
AND casting.ord = 1;

/* #13 */
SELECT name 
FROM actor 
JOIN casting 
ON actor.id = casting.actorid 
WHERE casting.ord = 1 
GROUP BY name 
HAVING COUNT(*) >= 15;

/* #14 */
SELECT movie.title, COUNT(*) 
FROM movie J
OIN casting 
ON movie.id = casting.movieid 
WHERE yr = 1978 
GROUP BY movie.title 
ORDER BY COUNT(*) DESC, movie.title;

/* #15 */
SELECT DISTINCT name 
FROM casting
JOIN actor 
ON actorid = actor.id
WHERE name != 'Art Garfunkel'
AND movieid 
IN 
(
	SELECT movieid
		FROM movie
		JOIN casting ON movieid = movie.id
		JOIN actor ON actorid = actor.id
		WHERE actor.name = 'Art Garfunkel'
);
