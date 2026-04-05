-- Phase 5: The Final Boss (Advanced Window Functions)

WITH MonthlyRevenue AS 
(SELECT
 DATE_TRUNC('month', order_purchase_timestamp) AS order_month,
 SUM(price) AS current_revenue
FROM orders AS o
INNER JOIN order_items AS oi
ON o.order_id = oi.order_id
WHERE order_status = 'delivered'
GROUP BY order_month)

SELECT
 order_month,
 current_revenue,
 LAG(current_revenue) OVER (ORDER BY order_month) AS previous_month_revenue,
 ROUND(
 	((current_revenue - LAG(current_revenue) OVER (ORDER BY order_month)) /
 	LAG(current_revenue) OVER (ORDER BY order_month)) * 100, 2) AS mom_growth_percentage
FROM MonthlyRevenue;

