--DATABASE
ALTER DATABASE sales_project SET datestyle = 'ISO, MDY';

--CUSTOMER
CREATE TABLE IF NOT EXISTS customer (
id SERIAL PRIMARY KEY,
first_name TEXT,
last_name TEXT,
age INT
);

ALTER TABLE customer 
ADD COLUMN email TEXT,
ADD COLUMN phone_number INT;

ALTER TABLE customer 
ADD COLUMN gender TEXT;

ALTER TABLE customer
ALTER COLUMN phone_number TYPE TEXT;   

SELECT * FROM customer;

--SALES PERSON
CREATE TABLE IF NOT EXISTS sales_person (
id SERIAL PRIMARY KEY,
first_name TEXT,
last_name TEXT
);

ALTER TABLE sales_person 
ADD COLUMN hire_date DATE,
ADD COLUMN region TEXT;

SELECT * FROM sales_person;

--NOTES
--ALTER TABLE REGION TO NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST

--SUPPLIER
CREATE TABLE IF NOT EXISTS supplier (
id SERIAL PRIMARY KEY,
name_contact_person TEXT,
name_company TEXT,
email TEXT,
phone_number INT,
address TEXT
);

ALTER TABLE supplier
ALTER COLUMN phone_number TYPE TEXT;  

SELECT * FROM supplier;

--PRODUCTS
CREATE TABLE IF NOT EXISTS products (
id SERIAL PRIMARY KEY,
name_product TEXT,
inventory INT,
cost INT,
supplier_id INT,
CONSTRAINT fk_supplier FOREIGN KEY (supplier_id)
REFERENCES supplier(id)
);

ALTER TABLE products
ALTER COLUMN cost TYPE FLOAT;  

SELECT * FROM products;

--TRANSACTIONS
CREATE TABLE IF NOT EXISTS transactions (
id SERIAL PRIMARY KEY,
date DATE,
quantity INT,
payment_method TEXT,
products_id INT,
customer_id INT,
sales_person_id INT,
CONSTRAINT fk_products FOREIGN KEY (products_id)
REFERENCES products(id),
CONSTRAINT fk_customer FOREIGN KEY (customer_id)
REFERENCES customer(id),
CONSTRAINT fk_sales_person FOREIGN KEY (sales_person_id)
REFERENCES sales_person(id)
);

SELECT * FROM transactions;



