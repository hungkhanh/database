-- CREATE
INSERT INTO `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`,`role`) VALUES
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President',NULL);

-- READ
SELECT *
FROM `employees`
WHERE `employeeNumber` = 1002;

-- UPDATE
UPDATE `employees`
SET `role` = 4
WHERE `jobTitle` IN ('Sales Rep','VP Sales','VP Marketing');

-- DELETE
DELETE FROM `employees`
WHERE `employeeNumber` = 1002;