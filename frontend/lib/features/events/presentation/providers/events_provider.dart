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

  Future<void> joinEvent(String eventId) async {
    final repo = ref.read(eventRepositoryProvider);
    // 1. Appel API
    await repo.joinEvent(eventId);

    // 2. Mise à jour Optimiste / Locale de l'état
    final previousState = await future;
    state = AsyncValue.data(
      previousState.map((event) {
        if (event.id == eventId) {
          return event.copyWith(
            isRegistered: true,
            participantsCount: event.participantsCount + 1,
            // On pourrait aussi incrémenter menCount ou womenCount si on avait le genre du user courant
            // Mais pour l'instant, participantsCount suffit pour le feedback visuel immédiat
          );
        }
        return event;
      }).toList(),
    );
  }
}
