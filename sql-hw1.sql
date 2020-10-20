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
-- also the store has many films with 8 copies so this is not reall the best
-- answer

-- Question 4: How many customers have the last name 'William'?
SELECT *
FROM customer;

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';


-- Question 5: What store employee (get the id) sold the most rentals?
SELECT *
FROM staff;
SELECT *
FROM rental;
-- need to get staff_id of max count staff_id in rental table then find that
-- employees name in the staff table
SELECT fromInv.staff_id, staff.staff_ID, staff.first_name, fromInv.countSold
FROM staff, (
	SELECT rental.staff_id, COUNT(staff_id) countSold
	FROM rental
	GROUP BY rental.staff_id
	ORDER BY countSold DESC
	LIMIT 1) fromInv
WHERE staff.staff_Id = fromInv.staff_id;


--  Question 6: How many different distinct names are there?
SELECT COUNT(DISTINCT full_name)
FROM (
	SELECT CONCAT(first_name, ' ', last_name)
	FROM actor
) full_name;


-- Question 7: What film has the most actors in it
SELECT *
FROM film_actor;
SELECT *
FROM film;
-- got tired of using nested selects to trying out inner joins
SELECT COUNT(film_actor.actor_id) actorsPerFilm, film.title 
FROM film_actor
INNER JOIN film ON film_actor.film_id = film.film_id
GROUP BY film_actor.film_id, film.title
ORDER BY actorsPerFilm DESC
LIMIT 1;


-- Question 8: From store_id 1, how many customers have a last name ending
-- ending with 'es'? (using customer table)
SELECT *
FROM customer;

SELECT COUNT(last_name) inglastnames
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


-- Question 9: How many payment amounts (4.99, 5.99, etc.) had a number 
-- of rentals above 250 for customers with ids between 380 and 430?
-- (use group by and having > 250)
SELECT *
FROM payment;

SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;


-- Question 10: Within the film table, how many rating category are there?
-- And what  rating has the most movies total
SELECT *
FROM film;

-- Number of rating categories
SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC
LIMIT 1;