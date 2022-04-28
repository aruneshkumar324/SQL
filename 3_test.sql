-- CREATE TABLE students(
-- 	student_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(100) NOT NULL,
-- 	last_name VARCHAR(100) NOT NULL,
-- 	homeroom_number INTEGER NOT NULL,
-- 	phone VARCHAR(20) UNIQUE NOT NULL,
-- 	email VARCHAR(200) UNIQUE NOT NULL,
-- 	graduation_year DATE
-- );



-- CREATE TABLE teachers(
-- 	teacher_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(100) NOT NULL,
-- 	last_name VARCHAR(100) NOT NULL,
-- 	phone VARCHAR(100) UNIQUE NOT NULL,
-- 	email VARCHAR(100) UNIQUE NOT NULL,
-- 	homeroom_number INTEGER NOT NULL,
-- 	department VARCHAR(100) NOT NULL
-- )



SELECT * FROM students;

-- ALTER TABLE students
-- ALTER COLUMN email DROP NOT NULL;

-- INSERT INTO students(first_name, last_name, phone, graduation_year, homeroom_number)
-- VALUES('Mark', 'Watney', '777-555-1234', '2035-01-01', 5);


-- ALTER TABLE students
-- ALTER COLUMN graduation_year TYPE YEAR;




SELECT * FROM teachers;

-- INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
-- VALUES('Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '777-555-4321')












