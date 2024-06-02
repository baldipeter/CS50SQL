SELECT "teams"."name", SUM("performances"."H") AS 'total hits' FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
AND "performances"."year" = "teams"."year"
GROUP BY "performances"."team_id"
ORDER BY "total hits" DESC
LIMIT 5;
