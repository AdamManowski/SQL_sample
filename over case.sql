SELECT
employee_name,
department,
position,
empsatisfaction,
ROUND(empsatisfaction / AVG(empsatisfaction) OVER(PARTITION BY department,position),2) AS A,
CASE
WHEN ROUND(empsatisfaction / AVG(empsatisfaction) OVER(PARTITION BY department,position),2) < 1.00 THEN 'Below avg score'
WHEN ROUND(empsatisfaction / AVG(empsatisfaction) OVER(PARTITION BY department,position),2) > 1.00 THEN 'Above avg score'
ELSE 'Average score'
END 
FROM HR

