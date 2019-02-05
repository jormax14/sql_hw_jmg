USE sakila;

#1a
SELECT first_name, last_name FROM actor;

#1b
SELECT upper(concat(first_name, ' ', last_name)) AS actor_name FROM actor;

#2a
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe';

#2b
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%GEN%';

#2c
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name ASC, first_name ASC;

#2d
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#3a
ALTER TABLE actor ADD COLUMN description BLOB AFTER last_name;
SELECT * FROM actor;

#3b
ALTER TABLE actor DROP COLUMN description;
SELECT * FROM actor;

#4a
SELECT last_name, COUNT(last_name) AS 'last_name_count' FROM actor GROUP BY last_name;

#4b
SELECT last_name, COUNT(last_name) AS 'last_name_count' FROM actor GROUP BY last_name HAVING last_name_count > 1;

#4c
UPDATE actor SET first_name = 'HARPO' WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';
SELECT * FROM actor WHERE last_name = 'WILLIAMS';

#4d
UPDATE actor SET first_name = 'GROUCHO' WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';
SELECT * FROM actor WHERE last_name = 'WILLIAMS';

#5a
SHOW CREATE TABLE sakila.address;

#6a
SELECT first_name, last_name, address FROM staff s JOIN address a ON s.address_id = a.address_id;

#6b
SELECT first_name, last_name, SUM(amount) FROM staff s JOIN payment p ON s.staff_id = p.staff_id WHERE p.payment_date LIKE '2005-08%' GROUP BY p.staff_id;

#6c
SELECT title, COUNT(actor_id) FROM film f INNER JOIN film_actor fa ON f.film_id = fa.film_id GROUP BY title;

#6d
SELECT title, COUNT(inventory_id) FROM film f INNER JOIN inventory i ON f.film_id = i.film_id WHERE title = 'Hunchback Impossible';

#6e
SELECT first_name, last_name, SUM(amount) AS 'total amount paid' FROM customer c INNER JOIN payment p ON c.customer_id = p.customer_id GROUP BY p.customer_id ORDER BY last_name ASC;





