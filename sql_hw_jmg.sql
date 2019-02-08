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
SELECT first_name, last_name, address FROM staff s INNER JOIN address a ON s.address_id = a.address_id;

#6b
SELECT first_name, last_name, SUM(amount) FROM staff s INNER JOIN payment p ON s.staff_id = p.staff_id WHERE p.payment_date LIKE '2005-08%' GROUP BY p.staff_id;

#6c
SELECT title, COUNT(actor_id) FROM film f INNER JOIN film_actor fa ON f.film_id = fa.film_id GROUP BY title;

#6d
SELECT title, COUNT(inventory_id) FROM film f INNER JOIN inventory i ON f.film_id = i.film_id WHERE title = 'Hunchback Impossible';

#6e
SELECT first_name, last_name, SUM(amount) AS 'total amount paid' FROM customer c INNER JOIN payment p ON c.customer_id = p.customer_id GROUP BY p.customer_id ORDER BY last_name ASC;

#7a
SELECT title From film WHERE language_id IN (SELECT language_id FROM language WHERE name = 'English') AND (title LIKE 'K%') OR (title like 'Q%');

#7b
SELECT first_name, last_name FROM actor WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id IN (SELECT film_id FROM film WHERE title = 'Alone Trip'));

#7c
SELECT first_name, last_name, email, country FROM customer cus JOIN address ad ON cus.address_id = ad.address_id JOIN city ON city.city_id = ad.city_id JOIN country c ON c.country_id = city.country_id WHERE c.country = 'CANADA';

#7d
SELECT title FROM film_list WHERE category = 'Family';

#7e
SELECT title, COUNT(r.inventory_id) AS 'rental count' FROM inventory i JOIN rental r ON i.inventory_id = r.inventory_id JOIN film f ON (i.film_id = f.film_id) GROUP BY f.title ORDER BY COUNT(r.inventory_id) DESC;

#7f
SELECT s.store_id, SUM(amount) AS 'sales' FROM payment p JOIN rental r ON p.rental_id = r.rental_id JOIN inventory i ON r.inventory_id = i.inventory_id JOIN store s ON i.store_id = s.store_id GROUP BY store_id;

#7g
SELECT store_id, city, country FROM store s JOIN address ad ON s.address_id = ad.address_id JOIN city ON city.city_id = ad.city_id JOIN country c ON c.country_id = city.country_id;

#7h
SELECT name, SUM(p.amount) FROM category c JOIN film_category fc ON c.category_id = fc.category_id JOIN inventory i ON fc.film_id = i.film_id JOIN rental r  ON i.inventory_id = r.inventory_id JOIN payment p ON r.rental_id=p.rental_id GROUP BY name ORDER BY SUM(p.amount) DESC LIMIT 5;

#8a
CREATE VIEW top_five_revenue_genres AS SELECT name, SUM(p.amount) FROM category c JOIN film_category fc ON c.category_id = fc.category_id JOIN inventory i ON fc.film_id = i.film_id JOIN rental r  ON i.inventory_id = r.inventory_id JOIN payment p ON r.rental_id=p.rental_id GROUP BY name ORDER BY SUM(p.amount) DESC LIMIT 5;

#8b
SELECT * FROM top_five_revenue_genres;

#8c
DROP VIEW top_five_revenue_genres;




