--1. Query to find how many actors with last name Wahlberg.
select COUNT (*) as Numberofpeople
from actor 
where last_name = 'Wahlberg'

--2. Query to return number of payments between $3.99 and $5.99
select count (*) as numberofpayments
from payment
where amount between 3.99 and 5.99

--3. Query to return name of the film the store has the most of.
select title
from film 
join inventory  on film.film_id =inventory.film_id 
group by title 
order by count(inventory.inventory_id)
desc 
limit 1;


--4. Query to return the number of customers that have the last name William.
select count (*) as numberofcustomers
from customers 
where last_name = 'William'

--5. Query to return the id of the employee that sold the most rentals.
select staff_id
from rental 
group by staff_id 
order by count(rental_id)
desc 
limit 1;

--6. Query to return the number of unique district names.
select count(distinct district) 
as unique_district_count
from address 

--7. Query to return the film id of the film with the most actors.
select film_id, actor_count
from(select film_id, count(*) as
actor_count
from film_actor 
group by film_id
order by actor_count
desc
limit 1 ) as subquery; 

--8. Query to return how many customers there are with last names ending in "-es"
select count(*)
as customer_count
from customer 
where last_name like '%es'
and store_id = 1;

--9. Query that returns how many payment amounts had a number of rentals above 250 
--for customers with ID's between 380 and 430.
select amount, count(amount) as num_payments
from payment 
where customer_id  between 380 and 430
group by amount
having count (amount)> 250;

--10. Query that returns how many rating categories are within the film table
-- and what rating has the most movies total.
SELECT 
(SELECT COUNT(DISTINCT rating) FROM film) AS num_rating_categories,
rating_with_most_movies,
num_movies
FROM (
SELECT 
COUNT(DISTINCT rating) AS num_rating_categories,
rating AS rating_with_most_movies,
COUNT(*) AS num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC
LIMIT 1
) AS subquery;
