-- Hello World SQL Query; SELECT all records from actor table
SELECT * 
FROM actor;

-- Query for First_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using where clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that equals Nick using like clause
SELECT first_name, last_name
FROM  actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with a J using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name dta that stars with K and has 2 letters after the K using
-- LIKE and WHERE clause using underscore (also know as character count)
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using BOTH wildcard and underscore
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';
-- at least 2 other characters after K then any number of charcters as long as 
-- name ends with th

-- Comparing operators are:
--  Greater Than (>) -- Less Than (<)
-- Great or equal (>=) == Less or Equal(<=)
-- Not equal (<>)

-- Explore Data with SELECT ALL query (Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amout greater than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- query for data that shows customers who paid
-- amount LESS than $7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- query for data that shows customers who paid
-- an amount less than or equal to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- query for data that shows customers who paid
-- an amount greater than or equal to 2.00
-- in ascending order
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- query for data that shows customers who paid
-- an amount BETWEEN 2.00 AND 7.99
SELECT customer_id, amount
FROM payment
-- WHERE amount > 2.00 AND amount < 7.99; -- works but inefficient
WHERE amount BETWEEN 2.00 AND 7.99;

-- query or data that shows customers who paid
-- an amount NOT EQUAL to $0.00
-- ordered in DESCENDING order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL Aggregation => SUM(), AVG(), COUNT(), MIN(), MAX()
-- Querry to display sum of amounts paied taht are greater than $ 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display average of amounts paid that are greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- query to display the ocunt of DISTINCT amounts paid taht are greater than $5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- query to display min amount greater than 7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99;

-- query to display max amount greater than 7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts (quick demo of groupby)
SELECT amount
FROM payment
WHERE amount = 11.99;

-- query to display different amounts grouped together
-- and count the amounts
SELECT amount, COUNT(amount) AS count_amount
FROM payment
GROUP BY amount
-- ORDER BY amount;
ORDER BY count_amount DESC;

-- Query to display customer_ids with the summed amounts for each customer_id
-- a different way to use group by
SELECT customer_id, amount 
FROM payment
-- GROUP BY SUM(customer_id) -- gives error becasue can't group by aggreate function
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

-- query to explor the data inside of the current table
SELECT *
FROM customer;

-- query to display customer_ids that show up more than 5 times
-- grouping by the customer's email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

