/*
Task -  3
*/

-- 1
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 1001
group by s.student_id,s.first_name,s.last_name

-- 2
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 3
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 4
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- 5
SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id;

-- 6
SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Mathematics'; 

-- 7
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;

-- 8
SELECT c.course_name 
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id=e.course_id
WHERE c.course_id IS NULL

-- 9
SELECT DISTINCT e1.student_id 
FROM Enrollments e1
JOIN  Enrollments e2 ON e1.student_id=e2.student_id
WHERE e1.course_id <> e2.course_id

-- 10
SELECT t.first_name,t.last_name 
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id=c.teacher_id
WHERE c.teacher_id IS NULL