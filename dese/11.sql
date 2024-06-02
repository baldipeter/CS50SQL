SELECT "schools"."name", "graduation_rates"."graduated", "expenditures"."per_pupil_expenditure"
FROM "graduation_rates" JOIN "schools" ON "graduation_rates"."school_id" = "schools"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name" ASC;
