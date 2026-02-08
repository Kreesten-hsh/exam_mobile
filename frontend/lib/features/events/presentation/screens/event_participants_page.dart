import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/core/theme/app_theme.dart';
import '../providers/event_participants_provider.dart';
import '../widgets/participant_card.dart';

class EventParticipantsPage extends ConsumerWidget {
  final String eventId;

  const EventParticipantsPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participantsAsync = ref.watch(eventParticipantsProvider(eventId));

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
              return ParticipantCard(
                participant: participant,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Chat: Phase 4')),
                  );
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
