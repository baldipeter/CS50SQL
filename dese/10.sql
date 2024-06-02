SELECT "districts"."name", "expenditures"."per_pupil_expenditure" FROM "schools"
JOIN "districts" ON "schools"."district_id" = "districts"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "schools"."type" = 'Public School'
GROUP BY "districts"."name"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name" ASC
LIMIT 10;
