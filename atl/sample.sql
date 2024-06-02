INSERT INTO "passengers"("first_name", "last_name", "age")
VALUES ("Amelia", "Earhart", 39);

INSERT INTO "airlines" ("name", "A", "B", "C", "D", "T")
VALUES ("Delta", 1, 1, 1, 1, 1);

INSERT INTO "flights" ("flight_number", "airline_id", "departure_airport_id", "arrival_airport_id", "departure_time", "arrival_time")
VALUES(300, (SELECT "id" FROM "airlines" WHERE name = 'Delta'), 'ATL', 'BOS', 'August 3rd, 2023 at 6:46 PM', 'August 3rd, 2023 at 9:09 PM');

INSERT INTO "check_ins" ("passenger_id", "flight_id", "datetime")
VALUES(
    (SELECT "id" FROM "passengers" WHERE "first_name" = "Amelia" AND "last_name" = "Earhart" AND "age" = 39),
    (SELECT "id" FROM "flights" WHERE "flight_number" = 300
    AND "airline_id" = (
        SELECT "id" FROM "airlines" WHERE name = 'Delta'
        )
    AND "departure_airport_id" = 'ATL'
    AND "arrival_airport_id" = 'BOS'
    AND "departure_time" = 'August 3rd, 2023 at 6:46 PM'
    ),
    'August 3rd, 2023 at 3:03 PM'
);
