-- 1) Select all students with payment information
SELECT s.*, p.* FROM Student s LEFT JOIN Payment p ON s.id = p.student_id;

-- 2) Select students who have payments
SELECT DISTINCT s.* FROM Student s INNER JOIN Payment p ON s.id = p.student_id;

-- 3) Select students with the average mark more than 8
SELECT s.*, AVG(m.mark) FROM Student s INNER JOIN Mark m ON s.id = m.student_id GROUP BY s.id, s.name, s.birthday, s."group" HAVING AVG(m.mark) > 8;

-- 4) Select students with marks
SELECT s.*, m.mark FROM Student s INNER JOIN Mark m ON s.id = m.student_id;

-- 5) Select students who has marks only for the given subject
SELECT s.* FROM Student s INNER JOIN Mark m ON s.id = m.student_id WHERE m.subject_id = 1;

-- 6) Select students with payments dates
SELECT s.name, p.payment_date FROM Student s INNER JOIN Payment p ON s.id = p.student_id;

-- 7) Select all students names with payments name type
SELECT s.name, pt.name FROM Student s INNER JOIN Payment p ON s.id = p.student_id INNER JOIN PaymentType pt ON p.type_id = pt.id;

-- 8) Select students that have maximum mark by certain subject (use subquery)
SELECT s.* FROM Student s INNER JOIN Mark m ON s.id = m.student_id WHERE m.mark = (SELECT MAX(mark) FROM Mark WHERE subject_id = m.subject_id) AND m.subject_id = 1;

-- 9) Select students who have no marks
SELECT s.* FROM Student s LEFT JOIN Mark m ON s.id = m.student_id WHERE m.student_id IS NULL;