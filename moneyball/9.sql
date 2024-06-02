SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS 'average salary' FROM "teams"
JOIN "salaries" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
GROUP BY "salaries"."team_id"
ORDER BY ROUND(AVG("salaries"."salary"), 2) ASC
LIMIT 5;
