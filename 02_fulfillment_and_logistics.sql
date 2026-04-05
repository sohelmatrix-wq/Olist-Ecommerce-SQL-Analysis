-- Phase 1, Challenge 1: Establishing the Timeline

--1. Total number of orders in the database.

SELECT
 COUNT(*) AS number_of_orders
FROM orders;

--2. The date and time of the very first order ever placed.

SELECT 
 MIN(order_purchase_timestamp) AS first_order
FROM orders;

--3. The date and time of the most recent order ever placed.

SELECT 
 MAX(order_purchase_timestamp) AS last_order
FROM orders;

-- Phase 1, Challenge 2: The Fulfillment Check

--1. Every unique order_status (e.g., delivered, canceled, shipped).

SELECT DISTINCT(order_status) 
FROM orders;

--2. The total count of orders for each of those statuses. 

SELECT
 order_status,
 COUNT(*) AS order_count
FROM orders
GROUP BY order_status;

--3. Sort the results so the status with the highest number of orders is at the very top.

SELECT
 order_status,
 COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;
