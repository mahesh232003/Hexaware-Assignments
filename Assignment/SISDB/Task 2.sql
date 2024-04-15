/*
Task - 2
*/

-- 1
insert into Students values (1011,'John','Doe','1995-08-15','john.doe@example.com',1234567890)

-- 2
insert into Enrollments values (21, 1001, 2, '2020-02-02')

-- 3
Update Teacher set email='aaa.yut@mail.com' where teacher_id=105

select * from students
select * from Teacher
select * from Enrollments
select * from Courses
select * from Payments

-- 4
delete from enrollments
where student_id=1001 and course_id=2

-- 5
update courses set teacher_id=110 where course_id=9

-- 6
insert into Enrollments values (21, 1011, 2, '2020-02-02')

DELETE FROM Enrollments
WHERE student_id = 1011; 

DELETE FROM Payments 
WHERE student_id=1011

DELETE FROM Students
WHERE student_id = 1011;

-- 7
update Payments set amount=450 where payment_id=5
