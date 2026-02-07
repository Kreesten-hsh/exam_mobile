
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

async function createDatabase() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: parseInt(process.env.DB_PORT || "3306"),
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
  });

  await connection.query(`CREATE DATABASE IF NOT EXISTS \`${process.env.DB_NAME}\`;`);
  console.log(`Database ${process.env.DB_NAME} created or already exists.`);
  await connection.end();
}

createDatabase().catch((err) => {
  console.error('Error creating database:', err);
  process.exit(1);
});
