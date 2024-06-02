SELECT * FROM "ingredients"
WHERE "name" = 'Cocoa';

SELECT * FROM "ingredients"
WHERE "name" = 'Sugar';

SELECT "donuts"."name", "gluten_free", "price", "ingredients"."name" FROM "donuts"
JOIN "recipes" ON "recipes"."donut_id" = "donuts"."id"
JOIN "ingredients" ON "recipes"."ingredient_id" = "ingredients"."id"
WHERE "donuts"."name" = 'Belgian Dark Chocolate';

SELECT "donuts"."name", "gluten_free", "price", "ingredients"."name" FROM "donuts"
JOIN "recipes" ON "recipes"."donut_id" = "donuts"."id"
JOIN "ingredients" ON "recipes"."ingredient_id" = "ingredients"."id"
WHERE "donuts"."name" = 'Back-To-School Sprinkles';

SELECT "orders"."id", "first_name", "last_name", "amount", "donuts"."name" FROM "orders"
JOIN "customers" ON "orders"."customer_id" = "customers"."id"
JOIN "cart" ON "cart"."order_id" = "orders"."id"
JOIN "donuts" ON "donuts"."id" = "cart"."donut_id"
WHERE "orders"."id" = 1;
