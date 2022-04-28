-------------------------------------------------------------------
--	AS statement
-------------------------------------------------------------------
SELECT COUNT(*) as total_payment FROM payment;

SELECT customer_id, SUM(amount) AS total_customer_amount FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY total_customer_amount;





-------------------------------------------------------------------
--	INNER JOIN
-------------------------------------------------------------------

SELECT * FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id;


SELECT payment_id, payment.customer_id, first_name FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;


-- get film language
SELECT film_id, title, name AS film_language  FROM film
INNER JOIN language
ON film.language_id = language.language_id;


-- get customter address
SELECT customer_id, customer.address_id, first_name, last_name, email, phone, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;






-------------------------------------------------------------------
--	FULL OUTER JOIN
-------------------------------------------------------------------

SELECT * FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.customer_id IS null OR customer.customer_id IS null;


SELECT COUNT(DISTINCT customer_id) FROM customer;




-------------------------------------------------------------------
--	LEFT OUTER JOIN
-------------------------------------------------------------------

SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null;


SELECT COUNT(*)
FROM film
LEFT JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NOT null;




-------------------------------------------------------------------
--	RIGHT OUTER JOIN
-------------------------------------------------------------------

SELECT *
FROM inventory
RIGHT OUTER JOIN FILM
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null;






-------------------------------------------------------------------
--	CHALLENGE
-------------------------------------------------------------------

--	1)
SELECT district, email FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';


-- 2)

SELECT title, first_name, last_name FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';





















