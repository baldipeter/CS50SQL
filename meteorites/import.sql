CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);


.import --csv --skip 1 meteorites.csv meteorites_temp

CREATE TABLE "meteorites"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" NUMERIC,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

INSERT INTO "meteorites"("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", ROUND("mass", 2), "discovery", "year", ROUND("lat", 2), ROUND("long", 2) FROM "meteorites_temp"
WHERE "nametype" != 'Relict'
ORDER BY "year" ASC, "name" ASC;

DROP TABLE "meteorites_temp";
