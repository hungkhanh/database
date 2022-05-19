UPDATE `employees`
SET `role` = 2 -- role: Manager
WHERE `jobTitle` IN ('Sales Manager (APAC)','Sale Manager (EMEA)','Sales Manager (NA)');