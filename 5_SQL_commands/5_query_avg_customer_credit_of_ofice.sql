SELECT offices.*,  (o.totalCreditOfOffice/o.totalCustomersOfOffice) AS `AVG credit`
FROM offices
LEFT JOIN
(
	SELECT employees.officeCode AS `code`, SUM(e.`totalCustomers`) AS `totalCustomersOfOffice`, SUM(e.`totalCredit`) AS `totalCreditOfOffice`
	FROM employees
	LEFT JOIN
	(
		SELECT `salesRepEmployeeNumber`, COUNT(customers.customerNumber) AS `totalCustomers`, SUM(customers.creditLimit) AS `totalCredit`
		FROM customers
		WHERE `salesRepEmployeeNumber` IS NOT NULL
		GROUP BY `salesRepEmployeeNumber`
	) AS e
	ON employees.employeeNumber = e.salesRepEmployeeNumber
	WHERE e.`totalCustomers` IS NOT NULL
	GROUP BY employees.officeCode 
) AS o
ON offices.officeCode = o.code
WHERE o.`totalCustomersOfOffice` IS NOT NULL
ORDER BY `AVG credit` DESC;