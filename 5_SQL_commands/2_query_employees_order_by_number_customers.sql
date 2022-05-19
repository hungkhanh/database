SELECT employees.*, c.`Number Customers`
FROM `employees`
LEFT JOIN (
    SELECT `salesRepEmployeeNumber`, COUNT(`customerNumber`) AS `Number Customers`
    FROM `customers`
    WHERE `salesRepEmployeeNumber` IS NOT NULL
    GROUP BY `salesRepEmployeeNumber`
    ORDER BY COUNT(`customerNumber`) DESC
) AS c
ON `employeeNumber` = c.salesRepEmployeeNumber
WHERE c.`Number Customers` IS NOT NULL;