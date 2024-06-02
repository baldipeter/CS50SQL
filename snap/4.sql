-- EXPLAIN QUERY PLAN
SELECT "username" FROM "users"
JOIN "messages" ON "messages"."to_user_id" = "users"."id"
GROUP BY "username"
ORDER BY COUNT(*) DESC, "username" ASC
LIMIT 1;
