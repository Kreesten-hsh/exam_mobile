import '../../domain/entities/event_entity.dart';
import '../../domain/entities/participant_entity.dart';

abstract class EventRepository {
  Future<List<EventEntity>> getEvents();
  Future<void> joinEvent(String eventId);
  Future<List<ParticipantEntity>> getParticipants(String eventId);
}
