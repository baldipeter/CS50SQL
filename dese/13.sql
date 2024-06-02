SELECT "districts"."name" AS 'District Name',
COUNT("schools"."name") AS 'No. of Schools',
"staff_evaluations"."needs_improvement" + "staff_evaluations"."unsatisfactory" AS 'Problematic Teacher Rate',
"graduation_rates"."dropped" AS 'Drop-out rate'
FROM "staff_evaluations"
    JOIN "districts" ON "staff_evaluations"."district_id" = "districts"."id"
    JOIN "schools" ON "schools"."district_id" = "districts"."id"
    JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
WHERE "staff_evaluations"."needs_improvement" + "staff_evaluations"."unsatisfactory" IS NOT NULL
GROUP BY "districts"."city"
HAVING "graduation_rates"."dropped" > 20
ORDER BY "graduation_rates"."dropped" DESC;
