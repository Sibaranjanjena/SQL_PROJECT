--1.Do we have actors in the actor table that share the full name and if yes display those shared names.--
--counting the number of actors that share their full names.--
SELECT COUNT(distinct(first_name||last_name)) from actor;
--The result shows that we have 199 distinct actor’s full names out of 200 actors, which means that 2 actors share the same full name.
--the name of that actor that is shared.--
SELECT DISTINCT actor1.first_name,actor1.last_name from actor actor1
join actor actor2
on actor1.actor_id<>actor2.actor_id and actor1.first_name=actor2.first_name and actor1.last_name=actor2.last_name;
--If we didn’t use DISTINCT in the above query, we would see Susan Davis twice, because it appeared twice for two different actors.
--2.Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT customer_id,staff_id,sum(amount) from payment
group by customer_id,staff_id having sum(amount)>=110 and staff_id=2
order by sum(amount) desc;
--3.How many films begin with the letter J?
SELECT count(*) from film where title LIKE 'J%';
--4.What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name, last_name, customer_id,address_id
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 5;
--5.How many films have the word Truman somewhere in the title?
SELECT COUNT(*) from film where title LIKE '%Truman%';
--6.Display the total amount paid by all customers in the payment table.
SELECT round(sum(amount),0) from payment;
--7.Display the total amount paid by each customer in the payment table.
SELECT customer_id as customer,sum(amount) as paid_amount from payment
group by customer_id order by customer_id ;
--8.What is the highest total_payment done.
SELECT customer_id,round(sum(amount),0) from payment
group by customer_id order by sum(amount) desc limit 1;
--9.Which customers have not rented any movies so far.
select first_name,last_name from  customer
left join rental
on customer.customer_id=rental.customer_id

--10.How many payment transactions were greater than $5.00?
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;