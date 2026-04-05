-- Phase 2: Customer Geography 


SELECT 
 c.customer_city AS customer_city,
 SUM(op.payment_value) AS total_revenue
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
INNER JOIN order_payments AS op
ON op.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 5;


-- Phase 3: Product Profitability (Complex Aggregations)

SELECT 
 p.product_category_name,
 SUM(oi.price) AS total_product_revenue,
 ROUND(AVG(freight_value),2) AS avg_freight_cost
FROM order_items AS oi
INNER JOIN products AS p
ON oi.product_id = p.product_id
--INNER JOIN orders AS o
--ON o.order_id = oi.order_id
--INNER JOIN order_payments AS op
--ON op.order_id = o.order_id
GROUP BY p.product_category_name
ORDER BY total_product_revenue DESC
LIMIT 10;


-- Phase 4: Logistics & Delivery (The Operations Crisis)

SELECT 
EXTRACT(Year FROM order_purchase_timestamp) AS order_year,
AVG(order_delivered_customer_date - order_purchase_timestamp) AS avg_delivery_time
FROM orders
WHERE order_delivered_customer_date IS NOT NULL 
	AND order_status = 'delivered'
GROUP BY order_year
ORDER BY order_year;