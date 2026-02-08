import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/event_entity.dart';
import '../../data/repositories/event_repository_impl.dart';
part 'events_provider.g.dart';

@riverpod
class Events extends _$Events {
  @override
  FutureOr<List<EventEntity>> build() async {
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
