CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `founded` SMALLINT,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `following` (
    `user_id_A` INT UNSIGNED,
    `user_id_B` INT UNSIGNED,
    FOREIGN KEY(`user_id_A`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_id_B`) REFERENCES `users`(`id`)
);

CREATE TABLE `alumni` (
    `user_id` INT UNSIGNED,
    `school_id` INT UNSIGNED,
    `from` DATE NOT NULL,
    `to` DATE,
    `degree` VARCHAR(8) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `works` (
    `user_id` INT UNSIGNED,
    `company_id` INT UNSIGNED,
    `from` DATE NOT NULL,
    `to` DATE,
    `title` VARCHAR(32) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);

