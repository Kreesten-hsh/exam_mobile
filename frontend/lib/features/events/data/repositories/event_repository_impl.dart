import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/participant_entity.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_data_source.dart';

part 'event_repository_impl.g.dart';

@riverpod
EventRepository eventRepository(Ref ref) {
  return EventRepositoryImpl(ref.watch(eventRemoteDataSourceProvider));
}

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource _dataSource;

  EventRepositoryImpl(this._dataSource);

  @override
  Future<List<EventEntity>> getEvents() async {
    final dtos = await _dataSource.getEvents();
    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> joinEvent(String eventId) async {
    await _dataSource.joinEvent(eventId);
  }

  @override
  Future<List<ParticipantEntity>> getParticipants(String eventId) async {
    final dtos = await _dataSource.getParticipants(eventId);
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
