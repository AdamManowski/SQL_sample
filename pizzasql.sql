SELECT EXTRACT(month FROM date) AS month,SUM(quantity*price) AS Income,
ROUND(SUM(quantity*price)/(
		SELECT SUM(quantity*price) FROM order_details
		INNER JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
),4) AS percentage_income
FROM order_details
	INNER JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
	INNER JOIN orders ON order_details.order_id = orders.order_id
GROUP BY EXTRACT(Month FROM date)
ORDER BY SUM(quantity*price) DESC;
