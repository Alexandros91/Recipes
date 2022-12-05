DROP TABLE IF EXISTS "public"."recipes";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes" (
    "id" SERIAL PRIMARY KEY,
    "name" text,
    "cooking_time" int,
    "rating" int
);

INSERT INTO "public"."recipes" ("name", "cooking_time", "rating") VALUES
('Kotopoulo me patates sto fourno', 70, 5),
('Revythia lemonata', 90, 4),
('Giouvarlakia', 80, 5),
('Fasolakia kokkinista', 60, 4),
('Patatosalata', 50, 5),
('Kouneli stifado', 100, 5);