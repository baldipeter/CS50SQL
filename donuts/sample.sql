INSERT INTO "ingredients"("name", "price_per_unit", "unit")
    VALUES
    ('Cocoa', 5.00, 'pound'),
    ('Sugar', 2.00, 'pound'),
    ('Flour', 1.00, 'kilogram'),
    ('Buttermilk', 4.00, 'pound'),
    ('Sprinkles', 3.00, 'pound');

INSERT INTO "donuts"("name", "gluten_free", "price")
    VALUES
    ('Belgian Dark Chocolate', 'no', 4.00),
    ('Back-To-School Sprinkles', 'no', 4.00);

INSERT INTO "recipes"("ingredient_id", "donut_id")
    VALUES
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Cocoa'), (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate')),
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Flour'), (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate')),
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk'), (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate')),
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar'), (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate')),

    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Flour'), (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles')),
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk'), (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles')),
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar'), (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles')),
    ((SELECT "id" FROM "ingredients" WHERE "name" = 'Sprinkles'), (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'));

INSERT INTO "customers"("first_name", "last_name")
    VALUES('Luis', 'Singh');

INSERT INTO "orders"("customer_id", "bill")
    VALUES((SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh'), 20);

INSERT INTO "cart"(
    "order_id",
    "donut_id",
    "amount")
    VALUES
    ((SELECT "id" FROM "orders" WHERE "customer_id" = (SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh')),
    (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
    3),

    ((SELECT "id" FROM "orders" WHERE "customer_id" = (SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh')),
    (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
    2);
