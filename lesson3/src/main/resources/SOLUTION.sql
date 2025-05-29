-- 1) Change table 'Student' - 'birthday' field cannot be null
ALTER TABLE Student ALTER COLUMN birthday SET NOT NULL;

-- 2) Change table 'Mark' - 'mark' should be in range from 1 to 10, 'student_id' and 'subject_id' cannot be null
ALTER TABLE Mark ADD CONSTRAINT mark_range CHECK (mark >= 1 AND mark <= 10);
ALTER TABLE Mark ALTER COLUMN student_id SET NOT NULL;
ALTER TABLE Mark ALTER COLUMN subject_id SET NOT NULL;

-- 3) Change table 'Subject' - 'grade' should be in range from 1 to 5
ALTER TABLE Subject ADD CONSTRAINT grade_range CHECK (grade >= 1 AND grade <= 5);

-- 4) Change table 'PaymentType' - 'name' should be a unique value
ALTER TABLE PaymentType ADD CONSTRAINT unique_payment_type_name UNIQUE (name);

-- 5) Change table 'Payment' - 'type_id', 'amount' and 'date' cannot be null
ALTER TABLE Payment ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE Payment ALTER COLUMN amount SET NOT NULL;
ALTER TABLE Payment ALTER COLUMN payment_date SET NOT NULL;