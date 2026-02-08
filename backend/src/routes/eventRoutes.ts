import { Router } from "express";
import { EventController } from "../controllers/EventController";
import { MessageController } from "../controllers/MessageController";
import { authenticate } from "../middlewares/authMiddleware";

const router = Router();

router.get("/", authenticate, EventController.list);
router.get("/:id", EventController.get);
router.get("/:id/participants", authenticate, EventController.getParticipants);
router.post("/:id/register", authenticate, EventController.register);
router.post("/:id/messages", authenticate, MessageController.create);
router.get("/:id/messages", authenticate, MessageController.getHistory); // Compatibility Route
router.post("/", authenticate, EventController.create); // Implicit Admin check needed in logic

export default router;
