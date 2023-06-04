import { pgTable, serial, text, varchar, integer, timestamp } from "drizzle-orm/pg-core"

export const Users= pgTable("person", {
  id: serial("id").primaryKey(),
  firstName: text("name"),
  lastName: text("name"),
  displayName: text("name"),

})

export const Households = pgTable("households", {
  id: serial("id").primaryKey(),

  name: varchar("name", {length: 20}),
  owner: integer("owner").references(()=>Users.id),
})

export const Folders = pgTable("folders", {
  id: serial("id").primaryKey(),
  name: varchar("name", {length: 150}),
  createdAt: timestamp("createdAt").defaultNow(),
  location: varchar("location", {length: 50}),

  household: integer("households").references(()=>Households.id),
  owner: integer("owner").references(()=>Users.id),
})

export const Files = pgTable("files", {
  id: serial("id").primaryKey(),
  name: varchar("name", {length: 150}),
  createdAt: timestamp("createdAt").defaultNow(),
  location: varchar("location", {length: 50}),
  description: varchar("description", {length: 50}),

  folder: integer("files").references(()=>Folders.id),
  owner: integer("owner").references(()=>Users.id),
})


