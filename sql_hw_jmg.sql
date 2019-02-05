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
