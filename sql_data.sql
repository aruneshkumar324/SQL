------------------------------------------------
--  SELECT STATEMENT 
------------------------------------------------

-- get all columns
-- select * from actor
SELECT * FROM actor;


-- get single column data from table
SELECT first_name FROM actor;


-- get multiple columns from table
SELECT actor_id, first_name, last_name FROM actor;


--  CHALLENGE
SELECT * FROM customer;
SELECT first_name, last_name, email FROM customer;



------------------------------------------------
--  DISTINCT
------------------------------------------------
SELECT * FROM film;

SELECT DISTINCT release_year FROM film;
SELECT DISTINCT(release_year) FROM film;

SELECT DISTINCT rating FROM film;
SELECT DISTINCT(rental_duration) FROM film;

SELECT DISTINCT(rating, release_year) FROM film;

SELECT DISTINCT rating FROM film;



------------------------------------------------
--  COUNT
------------------------------------------------
SELECT * FROM payment;

SELECT COUNT(*) FROM payment;
SELECT COUNT(amount) FROM payment;

SELECT DISTINCT amount FROM payment;
SELECT COUNT(DISTINCT amount) FROM payment;

SELECT * FROM film;
SELECT COUNT(DISTINCT rental_duration) FROM film;



------------------------------------------------
--  WHERE
------------------------------------------------

SELECT * FROM film;

-- comparison operators 
SELECT * FROM film WHERE title = 'African Egg';

SELECT * FROM film WHERE rental_rate > 4;

-- comparison and logical operators
SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 20 AND rating = 'PG';

SELECT title FROM film WHERE rental_rate > 4 AND replacement_cost >= 20 AND rating = 'PG';

SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 20 AND rating = 'PG';

SELECT * FROM film WHERE rating = 'G' OR rating = 'PG';

SELECT * FROM film WHERE rating != 'G' AND rating != 'R' AND rating != 'PG';


--  CHALLENGE
SELECT email FROM customer WHERE first_name = 'Nancy' and last_name = 'Thomas';

SELECT description FROM film WHERE title = 'Outlaw Hanky';

SELECT phone FROM address WHERE address = '259 Ipoh Drive';




------------------------------------------------
--  ORDER BY
------------------------------------------------

SELECT store_id, first_name, last_name FROM customer ORDER BY store_id ASC;

SELECT store_id, first_name, last_name FROM customer ORDER BY store_id DESC;

SELECT store_id, first_name, last_name FROM customer ORDER BY store_id ASC, first_name DESC;




------------------------------------------------
--  LIMIT
------------------------------------------------

SELECT * FROM payment LIMIT 5;

-- get 10 recent payment
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 10;


--  CHALLENGE
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

SELECT COUNT(*) FROM film
WHERE length <= 50;



------------------------------------------------
--  BETWEEN
------------------------------------------------

SELECT * FROM payment;

SELECT DISTINCT(amount) FROM payment;

SELECT DISTINCT(amount) FROM payment WHERE amount BETWEEN 5 AND 10;
SELECT COUNT(*) FROM payment WHERE amount BETWEEN 5 AND 10;

SELECT * FROM payment WHERE amount BETWEEN 5 AND 10;

SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT * FROM payment WHERE payment_date NOT BETWEEN '2007-02-01' AND '2007-02-25';



------------------------------------------------
--  IN
------------------------------------------------

SELECT * FROM payment;

SELECT DISTINCT(amount) FROM payment ORDER BY amount;

SELECT * FROM payment WHERE amount IN (0.00, 1.99);
SELECT COUNT(*) FROM payment WHERE amount IN (0.00, 1.99);

SELECT * FROM payment WHERE amount NOT IN (0.00, 0.99, 1.98, 1.99, 2.99, 3.98, 7.99);



SELECT * FROM customer;

SELECT * FROM customer WHERE first_name IN ('Arunesh', 'Maria', 'Lisa', 'Disha');




------------------------------------------------
--  LIKE	ILIKE
------------------------------------------------

SELECT * FROM customer;

SELECT * FROM customer WHERE first_name LIKE 'A%';

-- how many customer are there name starts with 'A' ?
SELECT COUNT(*) FROM customer WHERE first_name LIKE 'A%';

-- NOTE : - LIKE IS CASE SENTATIVE AND ILIKE IS NOT CASE SENTATIVE

SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name LIKE 'S%';

SELECT * FROM customer WHERE first_name ILIKE 'a%' AND last_name ILIKE 's%';

-- get row where 'so' there in first_name
SELECT * FROM customer WHERE first_name LIKE '%so%';

-- get row where '__so' there in first_name ( __ means starting any 2 character )
SELECT * FROM customer WHERE first_name LIKE '__so%';

SELECT * FROM customer WHERE first_name NOT LIKE '__so%';


SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'S%'
ORDER BY first_name LIMIT 10;






------------------------------------------------
--  GENERAL CHALLENGE
------------------------------------------------

-- 1) how many payment transactions were greater than $5.00 ?

SELECT COUNT(*) FROM payment WHERE amount > 5.00;


-- 2) how many actors have a first name that starts with the letter 'P' ?

SELECT COUNT(*) FROM actor WHERE first_name LIKE 'P%';


-- 3) how many unique districts are our customers from?
SELECT COUNT(*) FROM address;
SELECT DISTINCT(district) FROM address;

SELECT COUNT(DISTINCT(district)) FROM address;


-- 4) how many films have a rating of R and a replacement cost between $5 and $15 ?

SELECT * FROM film WHERE rating = 'R';
SELECT COUNT(*) FROM film WHERE rating = 'R';


SELECT * FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;



-- 5) how many films have the word 'Truman' somewhere in the title ?

SELECT * FROM film;

SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';

















