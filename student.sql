-- Create a database named `education_db` and create the following two tables:
create database education_db;
use education_db;

-- *Course

--  `course_id` – Primary Key, Auto Increment
--  `course_name` – NOT NULL, UNIQUE
--  `duration`
--  `fee`



create table course ( course_id int Primary Key Auto_Increment not null,
					  course_name varchar(30) NOT NULL UNIQUE,
                      duration varchar(30),
                      fees int);

insert into course (course_name,duration,fees) values ("python","six months",55000),
 													  ("java","four months",50000),
                                                      ("data analytics","seven months",40000);

-- Student

--  `student_id` – Primary Key, Auto Increment
--  `student_name` – NOT NULL
--  `email` – UNIQUE
--  `age`
--  `gender`
--  `mark`
--  `courseid` – Foreign Key referencing `Course(courseid)`
-- Insert records

create table student (student_id int not null auto_increment primary key,
					  student_name varchar(30),
                      email varchar(30),
                      age int,
                      gender enum('Male','Female') default "Male",
                      mark int,
                      courseid int,
                      foreign key student(courseid) references course(course_id));
                      
insert into student (student_name,email,age,gender,mark,courseid) values ("arun","arun@gmail.com",19,"male",85,1),
																		 ("amal","amal@gmail.com",25,"male",90,1),
                                                                         ("anu","anu@gmail.com",26,"female",87,2),
																		 ("sanu","sanu@gmail.com",30,"female",95,3);
                      
                      
                      

-- ### Questions

-- 1. Write a query to display all students who scored more than *80 marks, ordered by mark in descending order.

select * from student where mark>80;

-- 2. Write a query to find the highest mark, lowest mark, and average mark of all students.

select max(mark),min(mark),avg(mark) from student;

-- 3. Write a query to display the top 5 students based on their marks.

select * from student order by mark desc;

-- 4. Write a query to display the names and marks of students whose age is between 18 and 25, ordered by age.

select student_name,mark from student where age>=18 and age<=25;

-- 5. Write a query to find the number of students in each course.

select course.course_name,count(courseid) from student inner join course on student.courseid=course.courseid group by course.course_name;

-- 6. Write a query to display the courses that have more than 2 students.

SELECT course.course_name, COUNT(student.courseid) 
FROM student
INNER JOIN course
ON student.courseid = course.course_id
GROUP BY course.course_name
HAVING COUNT(student.courseid) > 2;

-- 7. Write a query to display the student name, mark, and course name using an `INNER JOIN`.

select student.student_name,student.mark,course.course_name from student inner join course on  student.courseid = course.course_id;

-- 8. Write a query to display all courses and their students, including courses that have no students, using a `LEFT JOIN`.

select course.course_name,student.student_name from student left join course on student.courseid = course.course_id;

-- 9. Write a query to display students whose marks are greater than the overall average mark using a subquery.

select student_name,mark from student where mark>(select avg(mark) from student);

-- 10. Write a query to find the second-highest mark and display the student name, mark, and course name using a subquery and `JOIN`.

select student.student_name,student.mark,course.course_name from student inner join course on student.courseid = course.course_id where student.mark=(select max(mark) from student where mark<(select max(mark) from student));

-- ### Git Repository Task

-- 1. Create a new GitHub repository for this SQL practice task.
-- 2. Create a file named `answers.sql` and write the SQL queries for all 10 questions in it.
-- 3. Commit and push the file to your GitHub repository.
-- 4. Make the repository public and share the GitHub repository link*.
