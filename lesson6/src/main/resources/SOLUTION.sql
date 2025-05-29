-- 1) Select all Payments with amount more or equal 500
SELECT * FROM Payment WHERE amount >= 500;

-- 2) Select students older than 20
SELECT * FROM Student WHERE birthday < DATEADD('YEAR', -20, '20001010');

-- 3) Select students from the same group (10) but younger than 20
SELECT * FROM Student WHERE "group" = 10 AND birthday > DATEADD('YEAR', -20, '20001010');

-- 4) Select Students with Name 'Mike' or from the group 4, 5, 6
SELECT * FROM Student WHERE name = 'Mike' OR "group" IN (4, 5, 6);

-- 5) Select Payments dated conducted in past 8 months
SELECT * FROM Payment WHERE payment_date >= DATEADD('MONTH', -8, '20001010');

-- 6) Select all students whose name starts with 'A'
SELECT * FROM Student WHERE name LIKE 'A%';

-- 7) Select students with name = Roxi and group= 4 or name Tallie and group = 9
SELECT * FROM Student WHERE (name = 'Roxi' AND "group" = 4) OR (name = 'Tallie' AND "group" = 9);