import '../repositories/participant_repository.dart';

class CancelParticipationUseCase {
  final ParticipantRepository repository;

  CancelParticipationUseCase(this.repository);

  Future<void> call(String participantId) {
    return repository.cancelParticipation(participantId);
  }
}
