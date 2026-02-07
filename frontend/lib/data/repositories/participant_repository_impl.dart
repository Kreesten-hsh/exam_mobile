import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/participant_entity.dart';
import '../../domain/repositories/participant_repository.dart';
import '../datasources/participant_remote_data_source.dart';

part 'participant_repository_impl.g.dart';

@riverpod
ParticipantRepository participantRepository(Ref ref) {
  return ParticipantRepositoryImpl(
    ref.watch(participantRemoteDataSourceProvider),
  );
}

class ParticipantRepositoryImpl implements ParticipantRepository {
  final ParticipantRemoteDataSource _dataSource;

  ParticipantRepositoryImpl(this._dataSource);

  @override
  Future<List<ParticipantEntity>> getParticipants(String eventId) async {
    final dtos = await _dataSource.getParticipants(eventId);
    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> cancelParticipation(String participantId) async {
    await _dataSource.cancelParticipation(participantId);
  }
}
