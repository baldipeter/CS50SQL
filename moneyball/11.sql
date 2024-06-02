SELECT "players"."first_name", "players"."last_name", "salaries"."salary"/"performances"."H" AS 'dollars per hit' FROM "players"
JOIN "salaries"
    ON "players"."id" = "salaries"."player_id"
JOIN "performances"
    ON "salaries"."player_id" = "performances"."player_id"
WHERE "performances"."H" > 0
AND "salaries"."year" = "performances"."year"
AND "salaries"."year" = 2001
ORDER BY "salaries"."salary"/"performances"."H" ASC, "players"."first_name" ASC, "players"."last_name" ASC
LIMIT 10;
