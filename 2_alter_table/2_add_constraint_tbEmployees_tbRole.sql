ALTER TABLE `employees`
ADD CONSTRAINT `employees_ibfk_3`
FOREIGN KEY (`role`) REFERENCES `role`(id);