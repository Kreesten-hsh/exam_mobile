import { DataSource } from "typeorm";
import dotenv from "dotenv";

import path from "path";

dotenv.config();

console.log("DB Config:", {
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  db: process.env.DB_NAME,
  // Force forward slashes for glob compatibility on Windows
  entitiesPath: path.join(__dirname, "../entities/**/*.{js,ts}").replace(/\\/g, "/")
});

export const AppDataSource = new DataSource({
  type: "mysql",
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT || "3306"),
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  synchronize: false, // Production ready: No auto-schema sync
  logging: true, // Enable logging to see SQL queries
  entities: [path.join(__dirname, "../entities/**/*.{js,ts}").replace(/\\/g, "/")],
  subscribers: [],
  migrations: [],
});
