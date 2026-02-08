import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/core/theme/app_theme.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/event_participants_provider.dart';
import '../providers/events_provider.dart';
import '../widgets/participant_card.dart';

class EventParticipantsPage extends ConsumerWidget {
  final String eventId;

  const EventParticipantsPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participantsAsync = ref.watch(eventParticipantsProvider(eventId));
    final currentUser = ref.watch(authProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Participants', style: TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.midnightBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: participantsAsync.when(
        data: (participants) {
          if (participants.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.group_off, size: 64, color: AppTheme.textGrey),
                  SizedBox(height: 16),
                  Text(
                    'Aucun participant pour le moment.',
                    style: TextStyle(color: AppTheme.textGrey),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: participants.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              final participant = participants[index];
              final isMe = currentUser?.id == participant.id;

              return ParticipantCard(
                participant: participant,
                onTap: isMe
                    ? null
                    : () {
                        // Navigate to Chat
                        // Retrieve event name from provider or use default
                        final events = ref.read(eventsProvider).valueOrNull;
                        final event = events?.firstWhere((e) => e.id == eventId,
                            orElse: () => events.first); // Fallback
                        final eventName = event?.name ?? 'Discussion';

                        context.push('/events/$eventId/chat', extra: {
                          'eventName': eventName,
                          'otherId': participant.id,
                        });
                      },
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppTheme.primaryOrange),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline,
                  size: 48, color: Colors.redAccent),
              const SizedBox(height: 16),
              Text(
                error.toString().replaceAll('Exception: ', ''),
                style: const TextStyle(color: Colors.redAccent),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.refresh(eventParticipantsProvider(eventId)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                ),
                child: const Text('Réessayer',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
