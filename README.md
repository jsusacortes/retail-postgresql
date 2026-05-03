# Retail PostgreSQL analysis - personal project

## Source
Data source: Mockaroo (synthetic data generator)

## Dataset Overview
5 tables: customers, sales_persons, products, suppliers, transactions
customers — 1,000 rows
sales_persons — 20 rows
suppliers — 50 rows
products — 200 rows
transactions — 10,000 rows (generated across 10 Mockaroo exports of 1,000 each)

## How to run it C
Create a PostgreSQL database, run the table creation scripts in order, generate data with Mockaroo using the schema described, then run the analysis queries.

## Tools Used 
PostgreSQL, pgAdmin, GitHub

## SQL concepts used 
GROUP BY, CASE WHEN, Window Functions, CTEs, NTILE, INNER JOIN, Subqueries

## Key Insights

- The highest spending customer is **Bartlet Klehn at $18,850** in total purchases
- Top 3 salespeople by revenue: **Flo Melloi** ($403,655), **Estevan Ethridge** ($401,513), and **Burk Jime** ($388,337)
- Northwest is the most profitable region at **$1,866,995**, followed closely by Northeast at **$1,862,242**
- Top products vary by region — Sweet Potato Mash leads in both Northeast and Southeast, while Waterproof Hiking Boots top the Northwest
- **JCB** is the dominant payment method with **4,176** transactions, far ahead of Mastercard (916) and Maestro (660)
-**479** customers spend above the average transaction value of $779
