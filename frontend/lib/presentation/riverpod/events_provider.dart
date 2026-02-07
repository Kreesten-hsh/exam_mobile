import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/event_entity.dart';
import '../../data/repositories/event_repository_impl.dart';

part 'events_provider.g.dart';

@riverpod
class Events extends _$Events {
  @override
  Future<List<EventEntity>> build() async {
    return _fetchEvents();
  }

  Future<List<EventEntity>> _fetchEvents() async {
    final repo = ref.read(eventRepositoryProvider);
    return await repo.getEvents();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchEvents());
  }
}

@riverpod
Future<EventEntity> eventDetails(Ref ref, String id) async {
  final repo = ref.read(eventRepositoryProvider);
  return repo.getEvent(id);
}
