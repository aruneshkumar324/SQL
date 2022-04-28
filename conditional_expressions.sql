------------------------------------------------------------------------
--	CASE
------------------------------------------------------------------------

--	1) exmaple
SELECT *,
	CASE
		WHEN (customer_id <= 100) THEN 'Premium'
		WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
		ELSE 'Normal'
	END AS customer_class
FROM customer;


--	2) example
SELECT *,
	CASE customer_id
		WHEN 1 THEN '1st'
		WHEN 2 THEN '2nd'
		WHEN 3 THEN '3rd'
		ELSE 'Normal'
	END AS Winner_List
FROM customer;



--	3) example

SELECT rental_rate,
	CASE rental_rate
		WHEN 0.99 THEN 1
		ELSE 0
	END
FROM film;



SELECT 
	SUM(
		CASE rental_rate
			WHEN 0.99 THEN 1
			ELSE 0
		END
		) AS number_of_bargins,
	SUM(
		CASE rental_rate
			WHEN 2.99 THEN 1
			ELSE 0
		END
		) AS regular,
	SUM(
		CASE rental_rate
			WHEN 4.99 THEN 1
			ELSE 0
		END
		) AS premium
FROM film;







------------------------------------------------------------------------
--	CASE CHALLENGE
------------------------------------------------------------------------

SELECT
	SUM(
		CASE rating
			WHEN 'R' THEN 1
			ELSE 0
		END
	) AS r,
	
	SUM(
		CASE rating
			WHEN 'PG' THEN 1
			ELSE 0
		END
	) AS pg,
	
	SUM(
		CASE rating
			WHEN 'PG-13' THEN 1
			ELSE 0
		END
	) AS pg13
FROM film;







------------------------------------------------------------------------
--	COALESCE
------------------------------------------------------------------------

-- CREATE TABLE product_price(
-- 	product_id SERIAL PRIMARY KEY,
-- 	title VARCHAR(100) UNIQUE NOT NULL,
-- 	price INTEGER,
-- 	discount INTEGER
-- )

-- INSERT INTO product_price(title, price, discount) VALUES('Sony Camera', 149, 19);

SELECT title, (price - discount) FROM product_price;

SELECT title, (price - COALESCE(discount, 0)) AS final_price FROM product_price;


-- SELECT * FROM product_price;






------------------------------------------------------------------------
--	CAST
------------------------------------------------------------------------

SELECT CAST('5' AS INTEGER);

SELECT CAST(5 AS VARCHAR);


-- WORK IN POSTGRESQL ONLY
SELECT '5'::INTEGER;
SELECT 5::VARCHAR;


SELECT char_length(CAST(inventory_id AS VARCHAR)) FROM rental;







------------------------------------------------------------------------
--	NULLIF
------------------------------------------------------------------------

-- CREATE TABLE dept(
-- 	first_name VARCHAR(50),
-- 	department VARCHAR(50)
-- );


-- INSERT INTO dept(first_name, department)
-- VALUES ('Rohan', 'A'), ('Sohan', 'A'), ('Neha', 'B');


SELECT * FROM dept;

-- -- ratio
-- SELECT (
-- 	SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) / 
-- 	SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
-- ) AS department_ratio
-- FROM dept;


-- DELETE FROM dept WHERE department = 'B';

SELECT * FROM dept;


-- ratio
SELECT (
	SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) / 
	NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0)
) AS department_ratio
FROM dept;






------------------------------------------------------------------------
--	VIEWS
------------------------------------------------------------------------

-- CREATE VIEW customer_info AS
-- SELECT first_name, last_name, address
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id;


-- -- add new column
-- CREATE OR REPLACE VIEW customer_info AS
-- SELECT first_name, last_name, address, district
-- FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id;

-- SELECT * FROM customer_info;


-- rename view
-- ALTER VIEW customer_info RENAME TO c_info;


-- SELECT * FROM c_info;

-- DROP VIEW IF EXISTS c_info;














