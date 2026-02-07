import { Request, Response } from "express";
import { PaymentService } from "../services/PaymentService";

const paymentService = new PaymentService();

export class PaymentController {
  static async simulate(req: Request, res: Response) {
    try {
      const { participantId, type } = req.body;
      const result = await paymentService.simulatePayment(participantId, type);
      res.status(201).json(result);
    } catch (error: any) {
      res.status(400).json({ message: error.message });
    }
  }
}
