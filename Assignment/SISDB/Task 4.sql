/*
Task -4
*/

-- 1
SELECT c.course_id, c.course_name, AVG(num_students) AS average_students_enrolled
FROM Courses c
JOIN (
    SELECT course_id, COUNT(student_id) AS num_students
    FROM Enrollments
    GROUP BY course_id
) AS enrollment_counts ON c.course_id = enrollment_counts.course_id
GROUP BY c.course_id, c.course_name;


-- 2
SELECT Students.student_id, first_name, last_name, MAX(amount) as highest_payment_amount
FROM Students
JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.student_id, first_name, last_name
HAVING MAX(amount) = (
    SELECT MAX(amount)
    FROM Payments
);


-- 3
SELECT Courses.course_id, course_name, COUNT(Enrollments.enrollment_id) AS enrollment_count
FROM Courses
JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_id, course_name
HAVING COUNT(Enrollments.enrollment_id) = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT course_id, COUNT(enrollment_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS enrollment_counts
);


-- 4
SELECT t.first_name,t.last_name,
       (SELECT SUM(p.amount)
        FROM Payments p
        INNER JOIN Enrollments e ON p.student_id = e.student_id
        WHERE e.course_id IN (SELECT course_id FROM Courses c WHERE c.teacher_id = t.teacher_id)
       ) AS total_payment
FROM Teacher t
GROUP BY t.teacher_id, t.first_name, t.last_name
ORDER BY total_payment DESC;


-- 5
SELECT s.student_id, s.first_name ,s.last_name AS student_name
FROM Students s
WHERE (SELECT COUNT(*) FROM Courses) = 
(SELECT COUNT(DISTINCT c.course_id) 
FROM Courses c INNER JOIN Enrollments e 
ON c.course_id = e.course_id WHERE e.student_id = s.student_id);


-- 6
SELECT first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id
    FROM Courses
);


-- 7
SELECT AVG(CAST(DATEDIFF(YEAR, date_of_birth, GETDATE()) AS FLOAT)) AS average_age
FROM Students;


-- 8
SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM Enrollments
);


-- 9
SELECT student_id, course_id, COALESCE(SUM(amount), 0) AS total_payments
FROM Payments p
WHERE EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.student_id = p.student_id
    AND e.course_id = p.course_id
)
GROUP BY student_id, course_id;

-- 10
SELECT student_id, payment_count
FROM (
    SELECT student_id, COUNT(payment_id) AS payment_count
    FROM Payments
    GROUP BY student_id
) AS payment_counts
WHERE payment_count > 1;


-- 11
SELECT s.student_id, s.first_name, s.last_name,
    COALESCE((SELECT SUM(amount) FROM Payments p WHERE p.student_id = s.student_id), 0) AS total_payments
FROM Students s;


-- 12
SELECT c.course_id, c.course_name,
    (
        SELECT COUNT(*)
        FROM Enrollments e
        WHERE e.course_id = c.course_id
    ) AS student_count
FROM Courses c;

-- 13
SELECT s.student_id, s.first_name, s.last_name,
    COALESCE((
        SELECT AVG(amount)
        FROM Payments p
        WHERE p.student_id = s.student_id
    ), 0) AS average_payment_amount
FROM Students s;

