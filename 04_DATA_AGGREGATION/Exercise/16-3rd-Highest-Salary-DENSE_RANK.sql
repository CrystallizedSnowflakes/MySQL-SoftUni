SELECT r.department_id,
       r.salary AS `third_highest_salary`
  FROM ( SELECT department_id, 
                 salary,
		 DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)
	      AS 'Rank'
            FROM employees
	GROUP BY department_id,
	         salary) AS r
 WHERE r.`Rank` = 3;