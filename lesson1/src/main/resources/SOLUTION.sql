CREATE TABLE Student (id BIGINT PRIMARY KEY, name VARCHAR, birthday DATE, group INT);
CREATE TABLE Subject (id BIGINT PRIMARY KEY, name VARCHAR, description VARCHAR, grade INT);
CREATE TABLE PaymentType (id BIGINT PRIMARY KEY, name VARCHAR);
CREATE TABLE Payment (id BIGINT PRIMARY KEY, type_id BIGINT, amount DECIMAL, student_id BIGINT, payment_date DATETIME, FOREIGN KEY (type_id) REFERENCES PaymentType(id), FOREIGN KEY (student_id) REFERENCES Student(id));
CREATE TABLE Mark (id BIGINT PRIMARY KEY, student_id BIGINT, subject_id BIGINT, mark INT, FOREIGN KEY (student_id) REFERENCES Student(id), FOREIGN KEY (subject_id) REFERENCES Subject(id));