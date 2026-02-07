import { Router } from "express";
import { MessageController } from "../controllers/MessageController";
import { authenticate } from "../middlewares/authMiddleware";

const router = Router();

router.get("/history", authenticate, MessageController.getHistory);

export default router;
