CREATE TABLE `role` (
    `id` integer AUTO_INCREMENT,
    `role` varchar(50) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;