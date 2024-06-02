CREATE TABLE "cipher" (
    "sentence_id" INTEGER NOT NULL,
    "character_No" INTEGER NOT NULL,
    "length" INTEGER NOT NULL
);

INSERT INTO "cipher"("sentence_id", "character_No", "length")
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

CREATE VIEW "to_cipher" AS
SELECT "sentences"."sentence", "cipher"."character_No", "cipher"."length" FROM "sentences"
JOIN "cipher" ON "cipher"."sentence_id" = "sentences"."id";

CREATE VIEW "message" AS
SELECT substr("sentence", "character_No", "length") AS 'phrase'
FROM "to_cipher";
