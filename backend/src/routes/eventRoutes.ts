import { Router } from "express";
import { EventController } from "../controllers/EventController";
import { authenticate } from "../middlewares/authMiddleware";

const router = Router();

router.get("/", EventController.list);
router.get("/:id", EventController.get);
router.post("/:id/register", authenticate, EventController.register);
router.post("/", authenticate, EventController.create); // Implicit Admin check needed in logic

export default router;
