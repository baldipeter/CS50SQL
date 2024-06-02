INSERT INTO `users`(`first_name`, `last_name`, `username`, `password`)
    VALUES('Claudine', 'Gay', 'claudine', 'password');

INSERT INTO `users`(`first_name`, `last_name`, `username`, `password`)
    VALUES('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO `schools`(`name`, `type`, `founded`, `location`)
    VALUES('Harvard University', 'Higher Education', 1636, 'Cambridge, Massachusetts');

INSERT INTO `companies`(`name`, `industry`, `location`)
    VALUES('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO `following`(`user_id_A`, `user_id_B`)
    VALUES((SELECT `id` FROM `users` WHERE `first_name` = 'Claudine'), (SELECT `id` FROM `users` WHERE `first_name` = 'Reid'));

INSERT INTO `alumni`(`user_id`, `school_id`, `from`, `to`, `degree`)
    VALUES(
        (SELECT `id` FROM `users` WHERE `first_name` = 'Claudine'),
        (SELECT `id` FROM `schools` WHERE `name` = 'Harvard University'),
        '1993-01-01',
        '1998-12-31',
        'PhD'
    );

INSERT INTO `works`(`user_id`, `company_id`, `from`, `to`, `title`)
    VALUES(
        (SELECT `id` FROM `users` WHERE `first_name` = 'Reid'),
        (SELECT `id` FROM `companies` WHERE `name` = 'LinkedIn'),
        '2003-01-01',
        '2007-02-01',
        'Chief Executive Officer'
    );
