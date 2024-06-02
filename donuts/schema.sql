CREATE TABLE IF NOT EXISTS "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL,
    "unit" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "recipes" (
    "ingredient_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE IF NOT EXISTS "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" TEXT NOT NULL CHECK("gluten_free" IN ('yes', 'no')),
    "price" REAL NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "cart" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "amount" INTEGER NOT NULL CHECK("amount" > 0),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE IF NOT EXISTS "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    "bill" REAL,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

