SELECT employees.*, e.total AS `Total credit`
FROM employees
LEFT JOIN
(
	SELECT `salesRepEmployeeNumber`, SUM(creditLimit) AS `total`
	FROM `customers`
	WHERE `salesRepEmployeeNumber` IS NOT NULL
	GROUP BY `salesRepEmployeeNumber`
) AS e
ON employees.employeeNumber = e.salesRepEmployeeNumber
WHERE e.total IS NOT NULL
ORDER BY e.total DESC 