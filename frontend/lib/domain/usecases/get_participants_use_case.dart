import '../repositories/participant_repository.dart';
import '../entities/participant_entity.dart';

class GetParticipantsUseCase {
  final ParticipantRepository repository;

  GetParticipantsUseCase(this.repository);

  Future<List<ParticipantEntity>> call(String eventId) {
    return repository.getParticipants(eventId);
  }
}
