use moviedb;
#1 Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.
SELECT act_fname,act_lname,role
  FROM actors 
	  JOIN movie_cast ON actors.act_id=movie_cast.act_id
		JOIN movie ON movie_cast.mov_id=movie.mov_id 
		  AND movie.mov_title='Annie Hall';
          
#2. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.

SELECT dir_fname, dir_lname, mov_title
FROM  director 
NATURAL JOIN movie_direction
NATURAL JOIN movie
NATURAL JOIN movie_cast
WHERE role IS  NOT NULL
AND mov_title='Eyes Wide Shut';

#3.Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.

SELECT dir_fname, dir_lname, mov_title
FROM  director, movie_direction, movie, movie_cast
WHERE director.dir_id=movie_direction.dir_id
AND movie_direction.mov_id=movie.mov_id
AND movie.mov_id=movie_cast.mov_id
AND movie_cast.role='Sean Maguire';

#4.Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year. 

SELECT act_fname, act_lname, mov_title, mov_year
FROM actors
JOIN movie_cast 
ON actor.act_id=movie_cast.act_id
JOIN movie 
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year NOT BETWEEN 1990 and 2000;

#5. Write a SQL query to find the directors with number of genres movies. 
#Group the result set on director first name, last name and generic title. 
#Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.

SELECT dir_fname,dir_lname, gen_title,count(gen_title)
FROM director
NATURAL JOIN movie_direction
NATURAL JOIN movie_genres
NATURAL JOIN genres
GROUP BY dir_fname, dir_lname,gen_title
ORDER BY dir_fname,dir_lname;

#6. Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
SELECT mov_title, mov_year, gen_title
FROM movie
NATURAL JOIN movie_genres
NATURAL JOIN genres;

#7. Write a SQL query to find all the movies with year, genres, and name of the director. 
SELECT mov_title, mov_year, gen_title, dir_fname, dir_lname
FROM movie
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director;

#8. Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director. 
SELECT movie.mov_title, mov_year, mov_dt_rel,
       mov_time,dir_fname, dir_lname 
FROM movie
JOIN  movie_direction 
   ON movie.mov_id = movie_direction.mov_id
JOIN director 
   ON movie_direction.dir_id=director.dir_id
WHERE mov_dt_rel <'1989-01-01'
ORDER BY mov_dt_rel desc;

#9. Write a SQL query to compute the average time and count number of movies for each genre. Return genre title, average time and number of movies for each genre.
SELECT gen_title, AVG(mov_time), COUNT(gen_title) 
FROM movie
NATURAL JOIN  movie_genres
NATURAL JOIN  genres
GROUP BY gen_title;

#10. Write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.
SELECT mov_title, mov_year, dir_fname, dir_lname, 
       act_fname, act_lname, role 
FROM  movie
NATURAL JOIN movie_direction
NATURAL JOIN movie_cast
NATURAL JOIN director
NATURAL JOIN actor
WHERE mov_time=(SELECT MIN(mov_time) FROM movie);
