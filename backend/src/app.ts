import "reflect-metadata";
import express from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import dotenv from "dotenv";
import { AppDataSource } from "./config/data-source";
import { createServer } from "http";
import { Server } from "socket.io";

dotenv.config();

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: "*", // A configurer pour la prod/mobile
    methods: ["GET", "POST"]
  }
});

app.use(cors());
app.use(helmet());
app.use(morgan("dev"));
app.use(express.json());

import routes from "./routes";

// ... middleware ...

app.use("/api", routes);

app.get("/", (req, res) => {
  res.json({ message: "Speed Dating API is running" });
});

import { setupSocketIO } from "./sockets/chatSocket";

// ...

// WebSocket Setup
setupSocketIO(io);

const PORT = process.env.PORT || 3000;

console.log("Starting server initialization...");

AppDataSource.initialize()
  .then(() => {
    console.log("Database connected successfully.");
    httpServer.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  })
  .catch((error) => {
    console.error("Database connection failed", error);
    process.exit(1); // Exit on DB failure
  });
