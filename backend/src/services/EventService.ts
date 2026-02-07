import { AppDataSource } from "../config/data-source";
import { Event } from "../entities/Event";
import { Participant, ParticipantStatus } from "../entities/Participant";
import { User } from "../entities/User";

export class EventService {
  private eventRepository = AppDataSource.getRepository(Event);
  private participantRepository = AppDataSource.getRepository(Participant);
  private userRepository = AppDataSource.getRepository(User);

  async getAllEvents() {
    return this.eventRepository.find({
      order: { event_date: "ASC" }
    });
  }

  async getEventById(id: string) {
    const event = await this.eventRepository.findOne({
      where: { id },
      relations: ["participants"] // Be careful with large data, maybe count instead
    });
    if (!event) throw new Error("Event not found");
    
    // Add computed counts if needed, or rely on separate query for performance
    return event;
  }

  async registerParticipant(userId: string, eventId: string) {
    const user = await this.userRepository.findOneBy({ id: userId });
    const event = await this.eventRepository.findOneBy({ id: eventId });

    if (!user || !event) throw new Error("User or Event not found");

    // Check existing participation
    const existing = await this.participantRepository.findOneBy({
      user: { id: userId },
      event: { id: eventId }
    });

    if (existing) throw new Error("Already registered");

    // Check quotas
    const participants = await this.participantRepository.find({
      where: { event: { id: eventId } },
      relations: ["user"]
    });

    const menCount = participants.filter(p => p.user.gender === "M").length;
    const womenCount = participants.filter(p => p.user.gender === "F").length;

    if (user.gender === "M" && menCount >= event.max_men) {
      throw new Error("Quota for men reached");
    }
    if (user.gender === "F" && womenCount >= event.max_women) {
      throw new Error("Quota for women reached");
    }

    const participant = this.participantRepository.create({
      user,
      event,
      status: ParticipantStatus.REGISTERED
    });

    return this.participantRepository.save(participant);
  }

  async createEvent(data: Partial<Event>) {
    // Admin only typically
    const event = this.eventRepository.create(data);
    return this.eventRepository.save(event);
  }
}
