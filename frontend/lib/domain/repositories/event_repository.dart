import '../entities/event_entity.dart';

abstract class EventRepository {
  Future<List<EventEntity>> getEvents();
  Future<EventEntity> getEvent(String id);
  Future<void> joinEvent(String eventId);
}
