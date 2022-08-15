# ERP-semister-registration-SYSTEM
for sql
(copy and paste these content in note pad then only you can see the tables correctly aligned OR view RAW)

MySQL
Database opentext

**tables**:
admin
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | varchar(50) | YES  |     | NULL    |       |
| name     | varchar(50) | YES  |     | NULL    |       |
| password | varchar(50) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

contact
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | varchar(100) | YES  |     | NULL    |       |
| issue | varchar(20)  | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+

courses
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| Course_id  | varchar(10)  | YES  |     | NULL    |       |
| CourseName | varchar(50)  | NO   | PRI | NULL    |       |
| subject    | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

student
+------------+-------------+------+-----+----------+-------+
| Field      | Type        | Null | Key | Default  | Extra |
+------------+-------------+------+-----+----------+-------+
| Student_ID | int         | NO   | PRI | NULL     |       |
| NAME       | varchar(50) | YES  |     | NULL     |       |
| password   | varchar(50) | YES  |     | password |       |
| sub1fac    | varchar(50) | YES  |     | NULL     |       |
| sub2fac    | varchar(50) | YES  |     | NULL     |       |
| sub3fac    | varchar(50) | YES  |     | NULL     |       |
| sub4fac    | varchar(50) | YES  |     | NULL     |       |
| sub5fac    | varchar(50) | YES  |     | NULL     |       |
| sub6fac    | varchar(50) | YES  |     | NULL     |       |
| sub7fac    | varchar(50) | YES  |     | NULL     |       |
| sub8fac    | varchar(50) | YES  |     | NULL     |       |
+------------+-------------+------+-----+----------+-------+

teacher
+------------+-------------+------+-----+----------+-------+
| Field      | Type        | Null | Key | Default  | Extra |
+------------+-------------+------+-----+----------+-------+
| Teacher_id | varchar(50) | NO   | PRI | NULL     |       |
| name       | varchar(50) | YES  |     | NULL     |       |
| password   | varchar(50) | YES  |     | password |       |
| subject1   | varchar(50) | YES  |     | NULL     |       |
| subject2   | varchar(50) | YES  |     | NULL     |       |
| subject3   | varchar(50) | YES  |     | NULL     |       |
+------------+-------------+------+-----+----------+-------+


How to run:
1.clone this repository into folder 
2.open it from eclipse workspace
3.makesure you change mysql password in every file
4.in Eclipse workspace windows>preferances>server>runtime environment>add(apache tomcat 9.0 server jar file)

