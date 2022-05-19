SELECT offices.*, o.`number` AS `Number Customers of Office`
FROM offices
LEFT JOIN
(
	SELECT employees.officeCode AS `code`, SUM(e.`Number Customers`) AS ` number`
	FROM employees
	LEFT JOIN
	(
		SELECT `salesRepEmployeeNumber`, COUNT(`customerNumber`) AS `Number Customers`
		FROM `customers`
		WHERE `salesRepEmployeeNumber` IS NOT NULL
		GROUP BY `salesRepEmployeeNumber`
	) AS e
	ON employees.employeeNumber = e.salesRepEmployeeNumber
	WHERE e.`Number Customers` IS NOT NULL
	GROUP BY employees.officeCode 
) AS o
ON offices.officeCode = o.code
WHERE o.`number` IS NOT NULL
ORDER BY o.`number` DESC;