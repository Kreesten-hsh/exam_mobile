import { Router } from "express";
import { PaymentController } from "../controllers/PaymentController";
import { authenticate } from "../middlewares/authMiddleware";

const router = Router();

// Secure this endpoint? Yes, usually user initiates it.
router.post("/simulate", authenticate, PaymentController.simulate);

export default router;
