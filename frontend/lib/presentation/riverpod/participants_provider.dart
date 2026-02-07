import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/participant_entity.dart';
import '../../data/repositories/participant_repository_impl.dart';

part 'participants_provider.g.dart';

@riverpod
Future<List<ParticipantEntity>> participants(Ref ref, String eventId) async {
  final repo = ref.read(participantRepositoryProvider);
  return repo.getParticipants(eventId);
}
