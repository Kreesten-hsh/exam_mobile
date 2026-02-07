import { Router } from "express";
import authRoutes from "./authRoutes";
import eventRoutes from "./eventRoutes";
import paymentRoutes from "./paymentRoutes";
import messageRoutes from "./messageRoutes";

const router = Router();

router.use("/auth", authRoutes);
router.use("/events", eventRoutes);
router.use("/payments", paymentRoutes);
router.use("/messages", messageRoutes);

export default router;
