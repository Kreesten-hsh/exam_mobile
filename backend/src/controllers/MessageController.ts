import { Request, Response } from "express";
import { MessageService } from "../services/MessageService";

const messageService = new MessageService();

export class MessageController {
  static async getHistory(req: Request, res: Response) {
    try {
      const userId = (req as any).user.id;
      const { otherId, eventId } = req.query;

      if (!otherId || !eventId) {
        return res.status(400).json({ message: "Missing otherId or eventId" });
      }

      const history = await messageService.getHistory(userId, otherId as string, eventId as string);
      res.json(history);
    } catch (error: any) {
      res.status(500).json({ message: error.message });
    }
  }
}
