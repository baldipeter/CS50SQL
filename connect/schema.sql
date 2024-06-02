CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL CHECK("type" IN ('Elementary School', 'Middle School', 'High School', 'Lower School', 'Upper School', 'College', 'University')),
    "founded" INTEGER,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "following" (
    "user_id_A" INTEGER,
    "user_id_B" INTEGER,
    FOREIGN KEY("user_id_A") REFERENCES "users"("id"),
    FOREIGN KEY("user_id_B") REFERENCES "users"("id")
);

CREATE TABLE IF NOT EXISTS "alumni" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "from" NUMERIC NOT NULL,
    "to" NUMERIC NOT NULL,
    "degree" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE IF NOT EXISTS "works" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "from" NUMERIC NOT NULL,
    "to" NUMERIC NOT NULL,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
