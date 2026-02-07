import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../riverpod/events_provider.dart';
import '../riverpod/auth_provider.dart';
import '../../../domain/entities/event_entity.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements'),
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
              return const Center(child: Text('Aucun événement disponible'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final event = events[index];
                return EventCard(event: event);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
            child: Text(
              'Erreur: $err',
              style: const TextStyle(color: AppTheme.errorRed),
            ),
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final EventEntity event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Détails de l\'événement à venir...')),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: AppTheme.midnightBlueLight,
              child: event.mediaUrl != null && event.mediaUrl!.isNotEmpty
                  ? Image.network(
                      event.mediaUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const Center(
                        child: Icon(Icons.broken_image, color: Colors.white),
                      ),
                    )
                  : const Center(
                      child: Icon(Icons.event, size: 48, color: Colors.white),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppTheme.textGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(event.date),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppTheme.textGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        event.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQuotaBadge(
                        context,
                        'Hommes',
                        event.maxMen,
                        Colors.blue,
                      ),
                      _buildQuotaBadge(
                        context,
                        'Femmes',
                        event.maxWomen,
                        Colors.pink,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuotaBadge(
    BuildContext context,
    String label,
    int count,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        '$label: $count max',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
