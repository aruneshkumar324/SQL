-------------------------------------------------------------------
--	DATABASE
-------------------------------------------------------------------

-- create new database
CREATE DATABASE new_db_name;


-- delete database
DROP DATABASE db_name;


-------------------------------------------------------------------
--   TABLE
-------------------------------------------------------------------

-- create new table

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
 	username VARCHAR(100) UNIQUE NOT NULL,
 	password VARCHAR(100) NOT NULL,
 	email VARCHAR(300) UNIQUE NOT NULL,
 	created_date TIMESTAMP NOT NULL,
 	last_login TIMESTAMP
);


CREATE TABLE job(
 	job_id SERIAL PRIMARY KEY,
 	job_name VARCHAR(100) UNIQUE NOT NULL
 );


CREATE TABLE account_job(
 	user_id INTEGER REFERENCES account(user_id),
 	job_id INTEGER REFERENCES job(job_id),
 	hire_date TIMESTAMP
 );



-- delete table

DROP TABLE table_name;




-------------------------------------------------------------------
--	INSERT VALUES
-------------------------------------------------------------------

INSERT INTO account(username, password, email, created_date)
VALUES('arunesh', 'password', 'arunesh@gmail.com', CURRENT_TIMESTAMP);


INSERT INTO job(job_name)
VALUES('Full Stack Developer');


INSERT INTO job(job_name) VALUES('BlockChain Debveloper')


INSERT INTO account_job(user_id, job_id, hire_date)
VALUES(1, 1, CURRENT_TIMESTAMP);


SELECT * FROM account_job;






-------------------------------------------------------------------
--	UPDATE
-------------------------------------------------------------------

UPDATE account SET last_login = CURRENT_TIMESTAMP;


UPDATE account SET last_login = created_date;


UPDATE account_job 
SET hire_date = account.created_date
FROM account
WHERE account_job.user_id = account.user_id;


UPDATE account SET last_login = CURRENT_TIMESTAMP
RETURNING username, email, last_login;





-------------------------------------------------------------------
--	DELETE
-------------------------------------------------------------------

SELECT * FROM job;

DELETE FROM job WHERE job_name = 'Type Writter' RETURNING job_id, job_name;







-------------------------------------------------------------------
--	ALTER
-------------------------------------------------------------------

CREATE TABLE information(
 	info_if SERIAL PRIMARY KEY,
 	title VARCHAR(100) NOT NULL,
 	person VARCHAR(100) NOT NULL UNIQUE
 );


rename table name
ALTER TABLE information RENAME TO new_info;


rename column name
ALTER TABLE new_info RENAME COLUMN person TO people;


ALTER TABLE new_info ALTER COLUMN people DROP NOT NULL;


INSERT INTO new_info(title) VALUES('First Title');

ALTER TABLE new_info ALTER COLUMN people SET NOT NULL;

INSERT INTO new_info(title) VALUES('Second Title')

SELECT * FROM new_info;




-------------------------------------------------------------------
--	DROP COLUMN
-------------------------------------------------------------------

ALTER TABLE new_info 
DROP COLUMN IF EXISTS people;


SELECT * FROM new_info;






-------------------------------------------------------------------
--	CHECK CONSTRAINT
-------------------------------------------------------------------

CREATE TABLE employess(
 	emp_id SERIAL PRIMARY KEY,
 	first_name VARCHAR(100) NOT NULL,
 	last_name VARCHAR(100) NOT NULL,
 	birthdate DATE CHECK(birthdate > '1980-01-01'),
 	hire_date DATE CHECK(hire_date > birthdate),
 	salary INTEGER CHECK(salary > 0)
 );


INSERT INTO employess(first_name, last_name, birthdate, hire_date, salary)
VALUES('Sohan', 'Das', '1995-07-20', '2001-01-02', 1000);


SELECT * FROM employess;



