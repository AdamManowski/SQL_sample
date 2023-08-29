SELECT position,ROUND(AVG(salary),0) AS Avg_salary, ROUND(AVG(empsatisfaction),1) AS Avg_satisfaction, 
CASE
	WHEN ROUND(AVG(salary),0) >=150000 AND ROUND(AVG(empsatisfaction),1) < 4 THEN 'Stress'
	WHEN ROUND(AVG(salary),0) <150000 AND ROUND(AVG(salary),0) >(SELECT AVG(salary)FROM HR) 
			AND ROUND(AVG(empsatisfaction),1) < 4.00 THEN 'Responsibility_overload'
	WHEN ROUND(AVG(salary),0) < (SELECT AVG(salary)FROM HR) AND ROUND(AVG(empsatisfaction),1) < 4 THEN 'Low_salary'
	ELSE 'OK'
END AS Possible_satisfaction_cause
FROM hr
GROUP BY position
ORDER BY ROUND(AVG(salary),0) DESC;
	