------------------------------------------------------------------
--		AGGREGATION FUNCTION
------------------------------------------------------------------

SELECT * FROM film;

SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;

SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;

SELECT COUNT(*) FROM film;

SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost)) FROM film;
SELECT ROUND(AVG(replacement_cost), 2) FROM film;

SELECT SUM(replacement_cost) FROM film;



------------------------------------------------------------------
--		GROUP BY 
------------------------------------------------------------------
SELECT * FROM payment;
SELECT COUNT(DISTINCT(customer_id)) FROM payment;

SELECT customer_id FROM payment
GROUP BY customer_id;

-- get total tranctsion of each customer
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount);

-- get top 10 customer with high trancsion
SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;


-- count each customer trancsion
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY customer_id;


-- GET TOP 10 CUSTOMER WITH high TRANCTION NUMBER
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC
LIMIT 10;


-- get customer by staff id
SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id, customer_id;


-- get staff_id who have most sell
SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;


SELECT DATE(payment_date) FROM payment;


-- which date have moset sell ( top 10 )
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC
LIMIT 10;



--	31  VIDEO challenge

--  1 challenge
SELECT staff_id, COUNT(customer_id) FROM payment
GROUP BY staff_id;


--	2 challenge
SELECT * FROM film;

SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film
GROUP BY rating;


--	3 challenge
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;




------------------------------------------------------------------
--		HAVING 
------------------------------------------------------------------

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;



SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id;
-- HAVING COUNT(*) > 300;


------------------------------------------------------------------
--		CHALLENGE 
------------------------------------------------------------------

-- 1
SELECT customer_id, COUNT(customer_id) FROM payment
GROUP BY customer_id
HAVING COUNT(customer_id) >= 40;


-- 2 
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100














