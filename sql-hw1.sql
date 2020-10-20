-- Question 1: How many actors are the with the last name 'Walhberg'?
-- Checking actors table
SELECT *
FROM actor;

SELECT COUNT(last_name) as Wahlbergs
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- Question 2: How many payments were made between $3.99 and $5.99
-- Checking payment table
SELECT *
FROM payment;

SELECT COUNT(amount) AS payments
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Question 3: What film does the store have the most of? (inventory table)
-- looking at inventory and film table
SELECT *
FROM inventory;
SELECT *
FROM film;
-- Goal: 1.find most popular film by film_id in inventory table
-- 2. used that film_id and get its name in film table
SELECT title, film.film_id
FROM film
WHERE film.film_id = (
	SELECT film_id
	FROM (
		SELECT film_id, COUNT(film_id) idCounts
		FROM inventory
		GROUP BY film_id
		ORDER BY idCounts DESC
		LIMIT 1
	) maxFilmId
);
-- works but I would like to know a better way to get film_id without
-- having that double nested select(select) with only removes the count() row

