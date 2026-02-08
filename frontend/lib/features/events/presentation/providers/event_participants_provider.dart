import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/participant_entity.dart';
import '../../data/repositories/event_repository_impl.dart';

part 'event_participants_provider.g.dart';

@riverpod
Future<List<ParticipantEntity>> eventParticipants(
    EventParticipantsRef ref, String eventId) async {
  final repository = ref.watch(eventRepositoryProvider);
  return repository.getParticipants(eventId);
}
