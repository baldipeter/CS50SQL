CREATE TABLE IF NOT EXISTS "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "check_ins" (
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE IF NOT EXISTS "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "A" INTEGER DEFAULT NULL,
    "B" INTEGER DEFAULT NULL,
    "C" INTEGER DEFAULT NULL,
    "D" INTEGER DEFAULT NULL,
    "E" INTEGER DEFAULT NULL,
    "F" INTEGER DEFAULT NULL,
    "T" INTEGER DEFAULT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "flights" (
    "id" INTEGER,
    "fligth_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departure_airport_id" TEXT NOT NULL,
    "arrival_airport_id" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
