-- Write your PostgreSQL query statement below
SELECT customer_id, COUNT(order_id) total_orders, 
ROUND(COUNT(CASE WHEN order_timestamp :: TIME BETWEEN '11:00' AND '14:00' OR order_timestamp :: TIME BETWEEN '18:00' AND '21:00' THEN 1 ELSE NULL END) / ( COUNT(order_id) :: DECIMAL(10,2)) * 100 , 0) peak_hour_percentage ,
ROUND(AVG(order_rating),2) average_rating 
FROM restaurant_orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2 AND COUNT(CASE WHEN order_timestamp :: TIME BETWEEN '11:00' AND '14:00' OR order_timestamp :: TIME BETWEEN '18:00' AND '21:00' THEN 1 ELSE NULL END) / COUNT(order_id) :: FLOAT >= 0.6
AND round(AVG(order_rating),2) >= 4.0 AND COUNT(order_rating) / COUNT(COALESCE(order_rating,1)) :: FLOAT >= 0.5
ORDER BY average_rating DESC, customer_id DESC;