UPDATE employees AS e1
INNER JOIN
(
	SELECT DISTINCT employees.reportsTo AS `reports`
	FROM employees
	WHERE employees.reportsTo IS NOT NULL
) AS e2
ON e1.employeeNumber = e2.reports
SET e1.`role` = 3