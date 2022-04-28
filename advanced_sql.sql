------------------------------------------------------------
--	1 - TIMESTAMPS AND EXTRACT
------------------------------------------------------------

SHOW ALL;

SHOW TIMEZONE;

SELECT NOW();

SELECT TIMEOFDAY();

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;




------------------------------------------------------------
--	2 - TIMESTAMPS AND EXTRACT
------------------------------------------------------------

--   https://www.postgresql.org/docs/12/functions-formatting.html

SELECT * FROM payment;

SELECT EXTRACT(YEAR FROM payment_date) FROM payment;

SELECT EXTRACT(YEAR FROM payment_date) AS payment_year FROM payment;

SELECT EXTRACT(MONTH FROM payment_date) FROM payment;

SELECT EXTRACT(QUARTER FROM payment_date) FROM payment;

SELECT AGE(payment_date) FROM payment;

SELECT TO_CHAR(payment_date, 'MONTH-YYYY') FROM payment;
SELECT TO_CHAR(payment_date, 'MONTH        YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'dd-MM-YYYY') FROM payment;






------------------------------------------------------------
--	2 - CHALLENEGE
------------------------------------------------------------

-- 1)
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH')) FROM payment;


-- 2) how many payments occurred on a monday ?
SELECT COUNT(*) FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;





------------------------------------------------------------
--	MATHEMATICAL FUNCTIONS AND OPERATORS
------------------------------------------------------------

--	https://www.postgresql.org/docs/current/functions-math.html

SELECT ROUND(rental_rate/replacement_cost, 2) * 100 FROM film;

SELECT 0.1 * replacement_cost FROM film;







------------------------------------------------------------
--	STRING FUNCTIONS AND OPERATORS
------------------------------------------------------------

--	https://www.postgresql.org/docs/current/functions-string.html

SELECT * FROM customer;

SELECT LENGTH(first_name) FROM customer;

SELECT first_name || ' ' ||last_name FROM customer;

SELECT UPPER(first_name) || ' ' || UPPER(last_name) AS full_name
FROM customer;

SELECT LOWER(first_name) || LOWER(last_name) || '@gmail.com' FROM customer;

SELECT LOWER(LEFT(first_name, 2)) || LOWER(last_name) || '@gmail.com' FROM customer;







------------------------------------------------------------
--	SUBQUERY
------------------------------------------------------------

SELECT * FROM film;

SELECT COUNT(*) FROM film;

SELECT AVG(rental_rate) FROM film;


SELECT COUNT(*) FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);


SELECT title, rental_rate FROM film
WHERE rental_rate > 
(SELECT AVG(rental_rate) FROM film);


SELECT * FROM rental;
SELECT * FROM inventory;



SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;



SELECT first_name, last_name
FROM customer AS x
WHERE EXISTS
(SELECT * FROM payment AS y
WHERE x.customer_id = y.customer_id AND amount > 11);




------------------------------------------------------------
--	SELF JOIN
------------------------------------------------------------

SELECT * FROM film;


SELECT f1.title, f2.title, f1.length
FROM film as f1
INNER JOIN film as f2
ON f1.film_id = f2.film_id
AND f1.length = f2.length;


SELECT f1.title, f2.title, f1.length
FROM film as f1
INNER JOIN film as f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length





















