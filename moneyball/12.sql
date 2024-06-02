SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE  "performances"."H" > 0
        AND "salaries"."year" = "performances"."year"
        AND "salaries"."year" = 2001
    ORDER BY "salaries"."salary"/"performances"."H" ASC
    LIMIT 10
)
INTERSECT
SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "salaries"."player_id" FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE  "performances"."RBI" > 0
        AND "salaries"."year" = "performances"."year"
        AND "salaries"."year" = 2001
    ORDER BY "salaries"."salary"/"performances"."RBI" ASC
    LIMIT 10
)
ORDER BY "last_name";
