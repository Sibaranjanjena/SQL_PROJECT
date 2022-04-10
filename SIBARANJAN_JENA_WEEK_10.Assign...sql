--1.The managers’ names at each store, with the full address of each property (street address, district, city, and country).--
select first_name as manager_first_name,last_name as manager_last_name,address.address,address.district,city.city,country.country
from staff
join store on staff.staff_id=store.manager_staff_id
join address on address.address_id=staff.address_id
join city on address.city_id=city.city_id
join country on city.country_id=country.country_id;
--2. A list of each inventory item we have stocked, including the store_id number, the inventory_id , the name of the film, the film’s rating, its rental rate and replacement cost.--
SELECT store_id,inventory.inventory_id,film.title,film.rating,film.rental_rate,film.replacement_cost from inventory
join film on inventory.film_id=film.film_id  
 limit 10;
 --3.how many inventory items you have with each rating at each store.--
 select store_id,film.rating,count(inventory_id) as inventory_items from inventory 
 join film on film.film_id=inventory.film_id
 group by store_id,film.rating
 order by count(inventory_id) desc ;
 --4.The number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.--
select store_id,category.name as category,film.length as films,avg(replacement_cost) as avg_replacement_cost,sum(replacement_cost) as total_replacement_cost from inventory
join film on film.film_id=inventory.film_id
join category on film.film_id=category.category_id
group by store_id,category.name,film.length
order by film.length desc,avg(replacement_cost),sum(replacement_cost) desc limit 10;
 -- 5. A list of all customer names, which store they go to, whether or not they are currently active, and their full addresses street address, city, and country.--
 select first_name,last_name,store_id,active,address.address,city.city,country.country from customer
 join address on address.address_id=customer.address_id
 join city on city.city_id=address.city_id
 join country on country.country_id=city.country_id;
 --6. A list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.
select first_name,last_name,rental.rental_id  as total_rental,sum(amount) from customer
join rental on customer.customer_id=rental.rental_id
join payment on customer.customer_id=payment.customer_id
group by first_name,last_name,rental.rental_id
order by sum(amount) desc limit 10;


 

