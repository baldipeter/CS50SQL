
-- *** The Lost Letter ***
-- Find the letter
SELECT * FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
);
-- Find the exact letter
SELECT * FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
    AND "contents" LIKE '%congratulatory%'
);
-- Find out if the to address is correct:
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
        AND "contents" LIKE '%congratulatory%'
    )
);
-- The address is not correct: '2 Finnigan Street' instead of '2 Finnegan Street'!


-- *** The Devious Delivery ***
-- Look for packages that have no from address
SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;
-- Found the Duck debugger, where did it head?
SELECT * FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" IS NULL
);
-- As there was no from address the driver mistook it, but where was it dropped off?
SELECT * FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop'
    AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);
-- The Police Station

-- *** The Forgotten Gift ***
-- Find the gift, if the addresses are correct:
SELECT * FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);
-- The contets are flowers, but where is it?
SELECT * FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);
-- After the pickup where was it delivered to?
SELECT * FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
    )
    AND "action" = 'Drop'
);
-- Let's find out the drivers name!
SELECT "drivers"."name", "addresses"."address", "scans"."action", "scans"."timestamp" FROM "drivers"
JOIN "scans" ON "drivers"."id" = "scans"."driver_id"
JOIN "addresses" ON "addresses"."id" = "scans"."address_id"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);
-- It is currenty at one of our drivers, Mikel.
