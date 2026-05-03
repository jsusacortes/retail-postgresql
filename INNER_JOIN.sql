--FIRST INNER JOIN
SELECT first_name, last_name, quantity, payment_method FROM customer
INNER JOIN transactions
ON customer.id = customer_id
ORDER BY quantity ASC;

--SECOND INNER JOIN
SELECT first_name, last_name, name_product, quantity, cost, payment_method, cost * quantity AS total_amount
FROM customer
INNER JOIN transactions
ON customer.id = customer_id
INNER JOIN products
ON products.id = products_id
WHERE quantity > 4
ORDER BY quantity ASC

--THIRD INNER JOIN
SELECT first_name, last_name, to_char(ROUND(SUM(cost*quantity)), '$999999.9') AS total_amount
FROM customer
INNER JOIN transactions
ON customer.id = customer_id
INNER JOIN products
ON products.id = products_id
GROUP BY customer.id
ORDER BY SUM(cost * quantity) DESC
;

--FOURTH INNER JOIN
SELECT first_name, last_name, to_char(ROUND(SUM(cost*quantity)), '$999999.9') AS total_amount
FROM sales_person
INNER JOIN transactions
ON sales_person.id = sales_person_id
INNER JOIN products
ON products.id = products_id
GROUP BY sales_person.id
ORDER BY SUM(cost * quantity) DESC
;

--FIFTH INNER JOIN
SELECT first_name, last_name, region, to_char(ROUND(SUM(cost*quantity)), '$999999.9') AS total_amount
FROM sales_person
INNER JOIN transactions
ON sales_person.id = sales_person_id
INNER JOIN products
ON products.id = products_id
GROUP BY sales_person.id, region
ORDER BY SUM(cost * quantity) DESC
;

--SIXTH INNER JOIN
SELECT region, to_char(ROUND(SUM(cost*quantity)), '$999999999999.9') AS total_amount
FROM sales_person
INNER JOIN transactions
ON sales_person.id = sales_person_id
INNER JOIN products
ON products.id = products_id
GROUP BY region
ORDER BY SUM(cost * quantity) DESC
;

--CTE
WITH top_3 AS(
SELECT name_product, region, to_char(ROUND(SUM(cost*quantity)), '$999999999999.9') AS total_amount,
RANK() OVER (PARTITION BY region ORDER BY SUM(cost*quantity) DESC) AS rank
FROM sales_person
INNER JOIN transactions
ON sales_person.id = sales_person_id
INNER JOIN products
ON products.id = products_id
GROUP BY region, name_product
)

SELECT * FROM top_3
WHERE rank IN (1,2,3);

--MOST POPULAR PAYMENT METHOD
SELECT payment_method, COUNT(payment_method) AS popular FROM transactions
GROUP BY payment_method
ORDER BY popular DESC;

--CUSTOMERS WHO SPEND ABOVE AVG
WITH avg_total AS(
SELECT ROUND(AVG(cost*quantity)) AS avg
FROM customer
INNER JOIN transactions
ON customer.id = customer_id
INNER JOIN products
ON products.id = products_id)

SELECT customer.id, age, ROUND(AVG(cost*quantity)) AS avg_customer
FROM customer
INNER JOIN transactions
ON customer.id = customer_id
INNER JOIN products
ON products.id = products_id
GROUP BY customer.id
HAVING ROUND(AVG(cost*quantity)) > (SELECT avg FROM avg_total)
ORDER BY avg_customer DESC
;
