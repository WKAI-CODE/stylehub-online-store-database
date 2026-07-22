-- ============================================================
-- STYLEHUB ONLINE STORE DATABASE
-- SQL QUERY COLLECTION
-- ============================================================
-- Database System: PostgreSQL
-- Tool Used: pgAdmin 4
--
-- This file contains SQL queries developed for the StyleHub
-- Online Clothes Shopping Platform academic database project.
--
-- The queries demonstrate:
-- 1. Basic SELECT statements
-- 2. Sorting and filtering
-- 3. INNER JOIN and LEFT JOIN
-- 4. Aggregate functions
-- 5. GROUP BY
-- 6. Updating records
-- 7. Altering a table structure
-- ============================================================


-- ============================================================
-- Q1: DISPLAY ALL REGISTERED CUSTOMERS
-- ============================================================
-- Purpose:
-- Display the full names and email addresses of all customers
-- registered in the system.

SELECT
    name,
    emailaddress
FROM customer;


-- ============================================================
-- Q2: LIST PRODUCTS FROM LOWEST TO HIGHEST PRICE
-- ============================================================
-- Purpose:
-- Display every product with its product name and price.
-- ORDER BY price ASC arranges the products from the lowest
-- price to the highest price.

SELECT
    productname,
    price
FROM product
ORDER BY price ASC;


-- ============================================================
-- Q3: DISPLAY ALL ORDERS
-- ============================================================
-- Purpose:
-- Display the order ID and order date for every order placed
-- in the online shopping system.

SELECT
    orderid,
    orderdate
FROM orders;


-- ============================================================
-- Q4: DISPLAY PRODUCTS WITH THEIR CATEGORIES
-- ============================================================
-- Purpose:
-- Display the product name together with its category name.
--
-- The Product table is connected to the Category table using
-- categoryID.

SELECT
    product.productname,
    category.categoryname
FROM product
JOIN category
    ON product.categoryid = category.categoryid;


-- ============================================================
-- Q5: DISPLAY ORDERS PLACED BY AISHA
-- ============================================================
-- Purpose:
-- Display the customer name and order date for all orders
-- placed by the customer named Aisha.
--
-- The Customer table is connected to the Orders table using
-- customerID.

SELECT
    customer.name,
    orders.orderdate
FROM customer
JOIN orders
    ON customer.customerid = orders.customerid
WHERE customer.name = 'Aisha';


-- ============================================================
-- Q6: COUNT PRODUCTS IN EACH CATEGORY
-- ============================================================
-- Purpose:
-- Display every category and the total number of products
-- available in that category.
--
-- LEFT JOIN is used so categories with no products can still
-- appear in the result with a count of zero.
--
-- COUNT(product.productID) counts the number of products
-- connected to each category.

SELECT
    category.categoryname,
    COUNT(product.productid) AS product_count
FROM category
LEFT JOIN product
    ON category.categoryid = product.categoryid
GROUP BY category.categoryid, category.categoryname
ORDER BY category.categoryname;


-- ============================================================
-- Q7: COUNT ORDERS PLACED BY EACH CUSTOMER
-- ============================================================
-- Purpose:
-- Display every customer and the total number of orders placed
-- by that customer.
--
-- LEFT JOIN allows customers with no orders to appear with
-- an order count of zero.

SELECT
    customer.name,
    COUNT(orders.orderid) AS total_orders
FROM customer
LEFT JOIN orders
    ON customer.customerid = orders.customerid
GROUP BY customer.customerid, customer.name
ORDER BY customer.name;


-- ============================================================
-- Q8: DISPLAY ORDERS WITH CUSTOMER AND PAYMENT DETAILS
-- ============================================================
-- Purpose:
-- Display the order ID, customer name and payment amount for
-- every order.
--
-- The query joins:
-- 1. Orders to Customer using customerID
-- 2. Payment to Orders using orderID

SELECT
    orders.orderid,
    customer.name,
    payment.paymentamount
FROM orders
JOIN customer
    ON orders.customerid = customer.customerid
JOIN payment
    ON orders.orderid = payment.orderid
ORDER BY orders.orderid;


-- ============================================================
-- Q9: CALCULATE TOTAL QUANTITY SOLD FOR EACH PRODUCT
-- ============================================================
-- Purpose:
-- Display each product name and the total quantity sold.
--
-- The query joins:
-- 1. Product to Product_Variant
-- 2. Product_Variant to Order_Product
--
-- SUM calculates the total quantity ordered for each product.

SELECT
    product.productname,
    SUM(order_product.quantity) AS total_quantity_sold
FROM product
JOIN product_variant
    ON product.productid = product_variant.productid
JOIN order_product
    ON product_variant.productvariantid =
       order_product.productvariantid
GROUP BY product.productid, product.productname
ORDER BY total_quantity_sold DESC;


-- ============================================================
-- Q10: DISPLAY THE TOP 5 MOST PURCHASED PRODUCTS
-- ============================================================
-- Purpose:
-- Display the five products with the highest total quantity
-- ordered.
--
-- ORDER BY total_quantity_sold DESC sorts the results from
-- the highest quantity to the lowest quantity.
--
-- LIMIT 5 displays only the first five products.

SELECT
    product.productname,
    SUM(order_product.quantity) AS total_quantity_sold
FROM product
JOIN product_variant
    ON product.productid = product_variant.productid
JOIN order_product
    ON product_variant.productvariantid =
       order_product.productvariantid
GROUP BY product.productid, product.productname
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- ============================================================
-- Q11: DISPLAY CUSTOMER FEEDBACK
-- ============================================================
-- Purpose:
-- Display customer feedback together with:
-- 1. Customer name
-- 2. Product name
-- 3. Rating
-- 4. Comment
--
-- The query joins Feedback with Orders, Customer,
-- Product_Variant and Product.

SELECT
    customer.name AS customer_name,
    product.productname,
    feedback.rating,
    feedback.comment
FROM feedback
JOIN orders
    ON feedback.orderid = orders.orderid
JOIN customer
    ON orders.customerid = customer.customerid
JOIN product_variant
    ON feedback.productvariantid =
       product_variant.productvariantid
JOIN product
    ON product_variant.productid = product.productid
ORDER BY product.productname, customer.name;


-- ============================================================
-- Q12: CALCULATE THE AVERAGE RATING FOR EACH PRODUCT
-- ============================================================
-- Purpose:
-- Display every reviewed product and its average customer
-- rating.
--
-- AVG calculates the average rating.
-- ROUND limits the displayed average rating to two decimal
-- places.

SELECT
    product.productname,
    ROUND(AVG(feedback.rating), 2) AS average_rating
FROM product
JOIN product_variant
    ON product.productid = product_variant.productid
JOIN feedback
    ON product_variant.productvariantid =
       feedback.productvariantid
GROUP BY product.productid, product.productname
ORDER BY average_rating DESC;


-- ============================================================
-- Q13: DISPLAY ORDERS THAT HAVE NOT BEEN DELIVERED
-- ============================================================
-- Purpose:
-- Display orders whose delivery status is not Delivered.
--
-- The result includes:
-- 1. Order ID
-- 2. Customer name
-- 3. Current delivery status

SELECT
    orders.orderid,
    customer.name,
    delivery.deliverystatus
FROM orders
JOIN customer
    ON orders.customerid = customer.customerid
JOIN delivery
    ON orders.orderid = delivery.orderid
WHERE delivery.deliverystatus <> 'Delivered'
ORDER BY orders.orderid;


-- ============================================================
-- Q14: INCREASE THE PRICE OF JACKETS BY 10%
-- ============================================================
-- WARNING:
-- This query changes the data stored in the Product table.
-- Create a database backup before running it.
--
-- Purpose:
-- Increase the price of every product in the Jackets category
-- by 10%.
--
-- price * 1.10 means:
-- Original price + 10% of the original price.

UPDATE product
SET price = price * 1.10
FROM category
WHERE product.categoryid = category.categoryid
  AND category.categoryname = 'Jackets';


-- ============================================================
-- Q14 CHECKING QUERY
-- ============================================================
-- Purpose:
-- Display all Jacket products after the update so that the
-- new prices can be checked.

SELECT
    product.productname,
    category.categoryname,
    product.price
FROM product
JOIN category
    ON product.categoryid = category.categoryid
WHERE category.categoryname = 'Jackets'
ORDER BY product.productname;


-- ============================================================
-- Q15: ADD A DISCOUNT PERCENTAGE COLUMN
-- ============================================================
-- WARNING:
-- ALTER TABLE changes the structure of the Product table.
-- Create a database backup before running this statement.
--
-- Purpose:
-- Add a new column named discount_percentage to the Product
-- table.
--
-- DECIMAL(5,2) allows values with:
-- 1. A maximum of five digits in total
-- 2. Two digits after the decimal point
--
-- Examples:
-- 10.00
-- 15.50
-- 100.00

ALTER TABLE product
ADD COLUMN discount_percentage DECIMAL(5,2);


-- ============================================================
-- Q15 CHECKING QUERY
-- ============================================================
-- Purpose:
-- Display the Product table to confirm that the new
-- discount_percentage column has been added.

SELECT *
FROM product
ORDER BY productid;


-- ============================================================
-- END OF SQL QUERY COLLECTION
-- ============================================================