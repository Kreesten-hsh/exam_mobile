import '../entities/participant_entity.dart';

abstract class ParticipantRepository {
  Future<List<ParticipantEntity>> getParticipants(String eventId);
  Future<void> cancelParticipation(String participantId);
}
