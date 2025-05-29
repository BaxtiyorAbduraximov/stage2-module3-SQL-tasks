-- 1) Update student name from 'Roxi' to 'Roxana'
UPDATE Student SET name = 'Roxana' WHERE name = 'Roxi';

-- 2) Update all students from group 4 to group 8
UPDATE Student SET "group" = 8 WHERE "group" = 4;

-- 3) Update payment amount to amount * 2 where payment date is more recent than 2 days
UPDATE Payment SET amount = amount * 2 WHERE payment_date > DATEADD('DAY', -2, CURRENT_DATE);

-- 4) Update mark to mark + 1 for all students from the group 4 subject 'Math'
UPDATE Mark SET mark = mark + 1 WHERE student_id IN (SELECT id FROM Student WHERE "group" = 4) AND subject_id = (SELECT id FROM Subject WHERE name = 'Math');

-- 5) Update subject name from 'PE' to 'Physical Education'
UPDATE Subject SET name = 'Physical Education' WHERE name = 'PE';