import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/theme/app_theme.dart';
import '../providers/events_provider.dart';
import 'package:frontend/features/auth/presentation/providers/auth_provider.dart';
import '../widgets/event_card_premium.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements à venir'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(eventsProvider.notifier).refresh(),
        child: eventsAsync.when(
          data: (events) {
            if (events.isEmpty) {
              return _buildEmptyState(context);
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return EventCardPremium(event: events[index]);
              },
            );
          },
          loading: () => const Center(
              child: CircularProgressIndicator(color: AppTheme.accentTeal)),
          error: (err, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    size: 48, color: AppTheme.errorRed),
                const SizedBox(height: 16),
                Text(
                  'Une erreur est survenue',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () => ref.refresh(eventsProvider),
                  child: const Text('Réessayer',
                      style: TextStyle(color: AppTheme.accentTeal)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_busy,
              size: 64, color: AppTheme.textGrey.withValues(alpha: 0.5)),
          const SizedBox(height: 16),
          Text(
            'Aucun événement pour le moment',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppTheme.textGrey),
          ),
        ],
      ),
    );
  }
}
