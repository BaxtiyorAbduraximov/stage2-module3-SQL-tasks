-- 1) Create view with students and their average marks
CREATE VIEW student_avg_marks AS SELECT s.id, s.name, s.birthday, s."group", AVG(m.mark) as avg_mark FROM Student s LEFT JOIN Mark m ON s.id = m.student_id GROUP BY s.id, s.name, s.birthday, s."group";

-- 2) Create view with payment statistics per student
CREATE VIEW student_payment_stats AS SELECT s.id, s.name, COUNT(p.id) as payment_count, COALESCE(SUM(p.amount), 0) as total_amount, COALESCE(AVG(p.amount), 0) as avg_amount FROM Student s LEFT JOIN Payment p ON s.id = p.student_id GROUP BY s.id, s.name;

-- 3) Select students with their payment and mark statistics
SELECT s.name, sps.payment_count, sps.total_amount, sam.avg_mark FROM Student s LEFT JOIN student_payment_stats sps ON s.id = sps.id LEFT JOIN student_avg_marks sam ON s.id = sam.id;

-- 4) Select subjects with number of students who have marks in each subject
SELECT subj.name, COUNT(DISTINCT m.student_id) as student_count FROM Subject subj LEFT JOIN Mark m ON subj.id = m.subject_id GROUP BY subj.id, subj.name;

-- 5) Select payment types with total amount and number of payments
SELECT pt.name, COUNT(p.id) as payment_count, COALESCE(SUM(p.amount), 0) as total_amount FROM PaymentType pt LEFT JOIN Payment p ON pt.id = p.type_id GROUP BY pt.id, pt.name;