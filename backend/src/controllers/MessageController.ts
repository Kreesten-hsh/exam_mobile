import { Request, Response } from "express";
import { MessageService } from "../services/MessageService";

const messageService = new MessageService();

export class MessageController {
  static async create(req: Request, res: Response) {
    try {
      const { content, type, receiverId, audioBase64 } = req.body;
      const senderId = (req as any).user.id;
      const eventId = req.params.id as string;

      let audioUrl;

      if (type === 'audio' && audioBase64) {
        // Decode base64 and save file
        const buffer = Buffer.from(audioBase64, 'base64');
        const filename = `audio_${Date.now()}_${Math.random().toString(36).substring(7)}.m4a`;
        // Ensure uploads/audio exists
        const fs = require('fs');
        const path = require('path');
        const uploadDir = path.join(__dirname, '../../uploads/audio');
        if (!fs.existsSync(uploadDir)){
            fs.mkdirSync(uploadDir, { recursive: true });
        }
        
        fs.writeFileSync(path.join(uploadDir, filename), buffer);
        audioUrl = `/uploads/audio/${filename}`;
      }

      if (!receiverId) {
        return res.status(400).json({ message: "receiverId is required" });
      }

      const message = await messageService.saveMessage(senderId, receiverId, eventId, content, audioUrl);
      
      // Fetch fresh relation to get sender details for DTO
      // Or construct DTO manually if we have sender info (we need to fetch sender info anyway to be safe, or return basic info)
      // Ideally MessageService returns the full entity.
      
      // Quick fix: user is in req.user, but we need gender/avatar.
      // Let's rely on saveMessage returning the entity. It might not have relations loaded fully.
      // Better to return the same structure. 
      // For now, let's map what we have, assuming saveMessage returns loaded entity or we reload it. 
      // Actually, saveMessage in MessageService uses repository.create + save. TypeORM save returns the entity but relations might be partial.
      // Let's reload the message to be sure we have sender details.
      
      const fullMessage = await messageService.getMessageById(message.id);

      if (!fullMessage) throw new Error("Message creation failed");

      const mappedMessage = {
        id: fullMessage.id,
        sender_id: fullMessage.sender.id,
        sender_name: fullMessage.sender.first_name,
        sender_gender: fullMessage.sender.gender,
        sender_avatar: fullMessage.sender.profile_photo_url || '',
        content: fullMessage.content_text || fullMessage.content_audio_url || '',
        type: fullMessage.content_audio_url ? 'audio' : 'text',
        created_at: fullMessage.created_at
      };

      res.status(201).json(mappedMessage);
    } catch (error: any) {
      res.status(500).json({ message: error.message });
    }
  }

  static async getHistory(req: Request, res: Response) {
    try {
      const userId = (req as any).user.id;
      const { otherId, eventId } = req.query; // otherId via Query for history

      if (!otherId || !eventId) {
        return res.status(400).json({ message: "Missing otherId or eventId" });
      }

      const history = await messageService.getHistory(userId, otherId as string, eventId as string);
      
      const mappedHistory = history.map(msg => ({
        id: msg.id,
        sender_id: msg.sender.id,
        sender_name: msg.sender.first_name,
        sender_gender: msg.sender.gender,
        sender_avatar: msg.sender.profile_photo_url || '',
        content: msg.content_text || msg.content_audio_url || '', // Fallback for safety
        type: msg.content_audio_url ? 'audio' : 'text',
        created_at: msg.created_at
      }));

      res.json(mappedHistory);
    } catch (error: any) {
      res.status(500).json({ message: error.message });
    }
  }
}
