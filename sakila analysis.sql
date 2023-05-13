-- How many copies of the film "Hunback Impossible" exist in the inventory
-- how many copies of movies exist in the inventory

select * from film;

select * from inventory;

select title, count(i.film_id) as 'no of film'
from film as f
inner join inventory as i on f.film_id = i.film_id
group by f.title;




-- Using Payment and Customer, find the total
-- amount payed by each customer 


select * from payment; 

select * from customer;

select c.first_name, c.last_name, sum(p.amount)
from customer as c
inner join payment as p on c.customer_id = p.customer_id
group by c.first_name, c.last_name
order by sum(p.amount) desc
limit 5;

-- Display the most frequently rented movies in descending table 

select * from film;
select * from rental;

select * from inventory;

select title, count(r.rental_id) as "No of Rent"
from film as f
inner join inventory as i on f.film_id = i.inventory_id
inner join rental as r on r.inventory_id = i.inventory_id
group by f.title
order by count(r.rental_id) desc;

-- which actor appeared in the film most

select * from actor;

select * from film;

select first_name, last_name, count(film_id) as "no of films"
from actor as a
inner join film_actor as fa on a.actor_id = fa.actor_id
group by a.actor_id
order by count(film_id) desc;
/*
select title
from actor as a 
inner join film_actor as fa on a.actor_id = fa.actor_id
inner join film as f on fa.actor_id = f.film_id
where a.first_name = "Walter" and last_name = "Torn"
group by title;
*/

select *
from film as f 
inner join inventory as i on f.film_id = i.film_id
where i.store_id = 1 and f.title = "Academy Dinosaur";

select round(avg(length))
from film;

select category.name, avg(length)
from film
inner join film_category using (film_id)
inner join category using (category_id)
group by category.name
order by avg(length) desc;
