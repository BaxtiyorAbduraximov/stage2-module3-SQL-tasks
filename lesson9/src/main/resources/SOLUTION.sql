-- 1) Select students who have the highest mark
SELECT s.* FROM Student s INNER JOIN Mark m ON s.id = m.student_id WHERE m.mark = (SELECT MAX(mark) FROM Mark);

-- 2) Select students who have marks for all subjects
SELECT s.* FROM Student s WHERE (SELECT COUNT(DISTINCT m.subject_id) FROM Mark m WHERE m.student_id = s.id) = (SELECT COUNT(*) FROM Subject);

-- 3) Select students who have the highest average mark
SELECT s.*, AVG(m.mark) as avg_mark FROM Student s INNER JOIN Mark m ON s.id = m.student_id GROUP BY s.id, s.name, s.birthday, s."group" HAVING AVG(m.mark) = (SELECT MAX(avg_marks.avg_mark) FROM (SELECT AVG(mark) as avg_mark FROM Mark GROUP BY student_id) avg_marks);

-- 4) Select students whose amount of payments is more than average
SELECT DISTINCT s.* FROM Student s INNER JOIN Payment p ON s.id = p.student_id WHERE p.amount > (SELECT AVG(amount) FROM Payment);

-- 5) Select students from the group which has the most students
SELECT s.* FROM Student s WHERE s."group" = (SELECT "group" FROM Student GROUP BY "group" ORDER BY COUNT(*) DESC LIMIT 1);

-- 6) Select subjects with the lowest average mark
SELECT subj.* FROM Subject subj WHERE subj.id IN (SELECT m.subject_id FROM Mark m GROUP BY m.subject_id HAVING AVG(m.mark) = (SELECT MIN(avg_marks.avg_mark) FROM (SELECT AVG(mark) as avg_mark FROM Mark GROUP BY subject_id) avg_marks));

-- 7) Select students and their rank based on average mark (use window function)
SELECT s.*, AVG(m.mark) as avg_mark, RANK() OVER (ORDER BY AVG(m.mark) DESC) as rank FROM Student s LEFT JOIN Mark m ON s.id = m.student_id GROUP BY s.id, s.name, s.birthday, s."group";