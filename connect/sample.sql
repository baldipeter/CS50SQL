INSERT INTO "users"("first_name", "last_name", "username", "password")
    VALUES('Alan', 'Garber', 'alan', 'password');

INSERT INTO "users"("first_name", "last_name", "username", "password")
    VALUES('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO "schools"("name", "type", "founded", "location")
    VALUES('Harvard University', 'University', 1636, 'Cambridge, Massachusetts');

INSERT INTO "companies"("name", "industry", "location")
    VALUES('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO "following"("user_id_A", "user_id_B")
    VALUES((SELECT "id" FROM "users" WHERE "first_name" = 'Alan'), (SELECT "id" FROM "users" WHERE "first_name" = 'Reid'));

INSERT INTO "alumni"("user_id", "school_id", "from", "to", "degree")
    VALUES(
        (SELECT "id" FROM "users" WHERE "first_name" = 'Alan'),
        (SELECT "id" FROM "schools" WHERE "name" = 'Harvard University'),
        'September 1st, 1973',
        'June 1st, 1976',
        'BA'
    );

INSERT INTO "works"("user_id", "company_id", "from", "to", "title")
    VALUES(
        (SELECT "id" FROM "users" WHERE "first_name" = 'Reid'),
        (SELECT "id" FROM "companies" WHERE "name" = 'LinkedIn'),
        'January 1st, 2003',
        'February 1st, 2007',
        'Chief Executive Officer'
    );
