-- 1) Delete all students from group 10
DELETE FROM Student WHERE "group" = 10;

-- 2) Delete all marks for students from the group 8
DELETE FROM Mark WHERE student_id IN (SELECT id FROM Student WHERE "group" = 8);

-- 3) Delete all payments for students from group 5
DELETE FROM Payment WHERE student_id IN (SELECT id FROM Student WHERE "group" = 5);

-- 4) Delete all students who have no payments
DELETE FROM Student WHERE id NOT IN (SELECT DISTINCT student_id FROM Payment WHERE student_id IS NOT NULL);

-- 5) Delete all subjects with grade = 5
DELETE FROM Subject WHERE grade = 5;

-- 6) Delete all marks that reference deleted subjects
DELETE FROM Mark WHERE subject_id NOT IN (SELECT id FROM Subject);