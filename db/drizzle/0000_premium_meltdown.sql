CREATE TABLE IF NOT EXISTS "files" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(150),
	"createdAt" timestamp DEFAULT now(),
	"location" varchar(50),
	"description" varchar(50),
	"files" integer,
	"owner" integer
);

CREATE TABLE IF NOT EXISTS "folders" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(150),
	"createdAt" timestamp DEFAULT now(),
	"location" varchar(50),
	"households" integer,
	"owner" integer
);

CREATE TABLE IF NOT EXISTS "households" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(20),
	"owner" integer
);

CREATE TABLE IF NOT EXISTS "person" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text
);

DO $$ BEGIN
 ALTER TABLE "files" ADD CONSTRAINT "files_files_folders_id_fk" FOREIGN KEY ("files") REFERENCES "folders"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "files" ADD CONSTRAINT "files_owner_person_id_fk" FOREIGN KEY ("owner") REFERENCES "person"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "folders" ADD CONSTRAINT "folders_households_households_id_fk" FOREIGN KEY ("households") REFERENCES "households"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "folders" ADD CONSTRAINT "folders_owner_person_id_fk" FOREIGN KEY ("owner") REFERENCES "person"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
 ALTER TABLE "households" ADD CONSTRAINT "households_owner_person_id_fk" FOREIGN KEY ("owner") REFERENCES "person"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
