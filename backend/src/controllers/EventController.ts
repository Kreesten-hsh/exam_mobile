import { Request, Response } from "express";
import { EventService } from "../services/EventService";

const eventService = new EventService();

export class EventController {
  static async list(req: Request, res: Response) {
    try {
      const events = await eventService.getAllEvents();
      res.json(events);
    } catch (error: any) {
      res.status(500).json({ message: error.message });
    }
  }

  static async get(req: Request, res: Response) {
    try {
      const event = await eventService.getEventById(req.params.id as string);
      res.json(event);
    } catch (error: any) {
      res.status(404).json({ message: error.message });
    }
  }

  static async register(req: Request, res: Response) {
    try {
      const userId = (req as any).user.id;
      const eventId = req.params.id as string;
      const participant = await eventService.registerParticipant(userId, eventId);
      res.status(201).json(participant);
    } catch (error: any) {
      res.status(400).json({ message: error.message });
    }
  }

  static async create(req: Request, res: Response) {
    try {
      // TODO: Check admin role
      const event = await eventService.createEvent(req.body);
      res.status(201).json(event);
    } catch (error: any) {
      res.status(400).json({ message: error.message });
    }
  }
}
