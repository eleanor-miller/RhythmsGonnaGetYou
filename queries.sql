  CREATE TABLE "Band" (
  "Id" SERIAL PRIMARY KEY, 
  "Name" TEXT,
  "CountryOfOrigin" TEXT,
  "NumberOfMembers" TEXT,
  "Website" TEXT,
  "Style" TEXT,
  "IsSigned" BOOL,
  "ContactName" TEXT,
  "ContactPhoneNumber" TEXT
  );
  
  CREATE TABLE "Album" (
  "Id" SERIAL PRIMARY KEY, 
  "Title" TEXT,
  "IsExplicit" BOOL,
  "ReleaseDate" DATE,
  "BandId" INT NULL REFERENCES "Band" ("Id")
  );

  CREATE TABLE "Song" (
  "Id" SERIAL PRIMARY KEY, 
  "TrackNumber" INT,
  "Title" TEXT,
  "Duration" INT,
  "AlbumId" INT NULL REFERENCES "Album" ("Id")
  );

-------------------------------------------------

--Create SQL statements that:

-- Add a new band
INSERT INTO "Band" (
  "Name", "CountryOfOrigin", "NumberOfMembers", "Website", "Style", "IsSigned", "ContactName", "ContactPhoneNumber")
	VALUES ('Radiohead', 'England', 5, 'www.radiohead.com', 'art-rock', true, 'Thom Yorke', '555-555-5555');
         
-- View all the bands
SELECT * FROM "Band";

-- Add an album for a band
INSERT INTO "Album" ("Title", "IsExplicit", "ReleaseDate", "BandId")
	VALUES ('Amensiac', false, '2001-05-30', 1);
INSERT INTO "Album" ("Title", "IsExplicit", "ReleaseDate", "BandId")
	VALUES ('Kid A', false, '2001-05-30', 1);
    
-- Add a song to an album
INSERT INTO "Song" ("TrackNumber", "Title", "Duration", "AlbumId")
	VALUES (1,'Packt Like Sardines In a Crushd Tin Box', (4*60), 1);
INSERT INTO "Song" ("TrackNumber", "Title", "Duration", "AlbumId")
	VALUES (9,'Morning Bell', (4*60 + 36), 2);
    
-- Let a band go (update isSigned to false)
UPDATE "Band" SET "IsSigned" = false WHERE "Name" = 'Radiohead';
-- Resign a band (update isSigned to true)
UPDATE "Band" SET "IsSigned" = true WHERE "Name" = 'Radiohead';
-- Given a band name, view all their albums
SELECT "Title", "ReleaseDate" From "Album"
	JOIN "Band" ON "Band"."Id" = "Album"."BandId";
-- View all albums (and their associated songs) ordered by ReleaseDate
SELECT * FROM "Song"
	JOIN "Album" ON "Album"."Id" = "Song"."AlbumId"
    ORDER BY "ReleaseDate" DESC;
-- View all bands that are signed
SELECT * FROM "Band" WHERE "IsSigned" = true;
-- View all bands that are not signed
SELECT * FROM "Band" WHERE "IsSigned" = false;