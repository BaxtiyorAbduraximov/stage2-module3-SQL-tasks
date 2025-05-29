-- 1) Count number of students
SELECT COUNT(*) FROM Student;

-- 2) Count number of students from the group 10
SELECT COUNT(*) FROM Student WHERE "group" = 10;

-- 3) Count number of payments from students of the group 5
SELECT COUNT(*) FROM Payment p JOIN Student s ON p.student_id = s.id WHERE s."group" = 5;

-- 4) Get maximum amount of payments
SELECT MAX(amount) FROM Payment;

-- 5) Get minimum amount of payments per payment type
SELECT type_id, MIN(amount) FROM Payment GROUP BY type_id;

-- 6) Get student with maximum mark and count of marks for the students
SELECT student_id, MAX(mark), COUNT(*) FROM Mark GROUP BY student_id;

-- 7) Get all payment types number of payments in each type order by name
SELECT pt.name, COUNT(p.id) FROM PaymentType pt LEFT JOIN Payment p ON pt.id = p.type_id GROUP BY pt.id, pt.name ORDER BY pt.name;

-- 8) Get the groups which contain more than 10 students
SELECT "group", COUNT(*) FROM Student GROUP BY "group" HAVING COUNT(*) > 10;

-- 9) Get the groups which average mark is more than 8
SELECT s."group", AVG(m.mark) FROM Student s JOIN Mark m ON s.id = m.student_id GROUP BY s."group" HAVING AVG(m.mark) > 8;