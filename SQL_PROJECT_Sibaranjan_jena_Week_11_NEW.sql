--1.How can you retrieve all the information from the cd.facilities table?--
SELECT * FROM cd.facilities;
--2.You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
SELECT name,membercost FROM cd.facilities;
--3.How can you produce a list of facilities that charge a fee to members?
SELECT * FROM cd.facilities
WHERE membercost > 0; 
--4.How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
SELECT facid,name,membercost,monthlymaintenance FROM cd.facilities
WHERE membercost != 0 AND membercost < monthlymaintenance/50;
--5.How can you produce a list of all facilities with the word 'Tennis' in their name?--
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';
--6.How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.--
SELECT * FROM cd.facilities
WHERE facid IN(1,5);
--7.How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.--
SELECT memid,surname,firstname,joindate FROM cd.members
WHERE joindate > '2012-09-01 00:00:00' ;
--8.How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.--
SELECT DISTINCT surname FROM cd.members
ORDER BY surname ASC
LIMIT 10;
---9.You'd like to get the signup date of your last member. How can you retrieve this information?--
SELECT max(joindate) FROM cd.members;
---10.Produce a count of the number of facilities that have a cost to guests of 10 or more.--
SELECT COUNT(facid) FROM cd.facilities
WHERE guestcost >= 10;
--11.Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.--
SELECT facid,sum(slots) AS Total_Slots FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-09-30'
GROUP BY facid
ORDER BY sum(slots);
---12.Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.--
SELECT facid, SUM(slots) AS Total_Slots FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;
---13.How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.--
SELECT starttime, name
FROM cd.bookings
INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
WHERE name LIKE '%Tennis Court%' AND starttime BETWEEN '2012-09-21 00:00:00' AND '2012-09-21 23:59:59' 
ORDER BY starttime;
--14.How can you produce a list of the start times for bookings by members named 'David Farrell'?--
SELECT (firstname||surname) AS full_name,starttime FROM cd.bookings
INNER JOIN cd.members ON cd.members.memid = cd.bookings.memid
WHERE  firstname LIKE '%David%' AND surname LIKE '%Farrell%' 
ORDER BY starttime;
-----------------------------SQL DATABASE-------------------------------------------------------------
-----Create a new database called "School" this database should have two tables: teachers and students.--
---------1.The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year.--
CREATE TABLE Students(
student_id serial primary key,
first_name varchar(100) unique not null,
last_name varchar(100) unique not null,
homeroom_number int,
phone varchar(100) not null,
email varchar(100) not null,
graduation_year int
)
---- checking the columns of the Students table ,whether they are exsists or not----
SELECT * FROM Students;
------insert a student named Mark Watney (student_id=1) who has a phone number of 777-555-1234 and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.--
INSERT INTO Students(first_name,last_name,homeroom_number,phone,email,graduation_year)
VALUES('Mark','Watney',5,'777-555-1234','NA',2035)
-----making sure whether these values have inserted or not----
SELECT * FROM Students;
--------2.The teachers table should have columns for teacher_id, first_name, last_name, homeroom_number, department, email, and phone.--
CREATE TABLE teachers(
teacher_id serial primary key,
first_name varchar(100) unique not null,
last_name varchar(100) unique not null,
homeroom_number bigint,
department varchar(50),
email varchar(100) not null,	
phone varchar(100) not null
)
---- checking the columns of the teachers table ,whether they are exsists or not----
SELECT * FROM teachers;
---Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. His contact info is: jsalk@school.org and a phone number of 777-555-4321.--
INSERT INTO teachers(first_name,last_name,homeroom_number,department,email,phone)
VALUES('Jonas','Salk',5,'Biology','jsalk@school.org','777-555-4321')
-----making sure whether these values have inserted or not----
SELECT * FROM teachers;




