import { AppDataSource } from "../config/data-source";
import { Message } from "../entities/Message";
import { User } from "../entities/User";
import { Event } from "../entities/Event";

export class MessageService {
  private messageRepository = AppDataSource.getRepository(Message);
  private userRepository = AppDataSource.getRepository(User);
  private eventRepository = AppDataSource.getRepository(Event);

  // Regex for phone numbers (France + Intl) and text obfuscation
  private phoneRegexes = [
    /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/, // 06 12 34 56 78
    /\d{10}/, // 0612345678
    /zero\s+six/i, // "zero six"
    /zéro\s+six/i,
    /plus\s+de\s+229/i // "+229" text
  ];

  isContentAllowed(content: string): boolean {
    // Normalize content (remove spaces for digit check?)
    // Simple check first
    for (const regex of this.phoneRegexes) {
      if (regex.test(content)) return false;
    }
    return true;
  }

  async saveMessage(senderId: string, receiverId: string, eventId: string, content: string, audioUrl?: string) {
    const sender = await this.userRepository.findOneBy({ id: senderId });
    const receiver = await this.userRepository.findOneBy({ id: receiverId });
    const event = await this.eventRepository.findOneBy({ id: eventId });

    if (!sender || !receiver || !event) throw new Error("User or Event not found");

    const isAllowed = this.isContentAllowed(content || "");

    const message = this.messageRepository.create({
      sender,
      receiver,
      event,
      content_text: content,
      content_audio_url: audioUrl,
      is_blocked: !isAllowed,
      read_at: undefined // Logic change: Use undefined instead of null for TypeORM optional
    });

    return this.messageRepository.save(message);
  }

  async getHistory(userId: string, otherId: string, eventId: string) {
    return this.messageRepository.find({
      where: [
        { sender: { id: userId }, receiver: { id: otherId }, event: { id: eventId }, is_blocked: false },
        { sender: { id: otherId }, receiver: { id: userId }, event: { id: eventId }, is_blocked: false }
      ],
      relations: ["sender", "receiver", "event"],
      order: { created_at: "ASC" }
    });
  }

  async getMessageById(id: string) {
    return this.messageRepository.findOne({
      where: { id },
      relations: ["sender", "receiver", "event"]
    });
  }
}
