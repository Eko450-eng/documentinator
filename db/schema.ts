import { pgTable, serial, text } from "drizzle-orm/pg-core"
export const Person = pgTable("person", {
  id: serial("id").primaryKey(),
  firstName: text("name"),
  lastName: text("name"),
  displayName: text("name"),

  household
})
