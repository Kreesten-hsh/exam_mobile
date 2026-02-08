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
        backgroundColor: AppTheme.midnightBlueDark,
        elevation: 0,
        title: const Text(
          'Événements',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
      backgroundColor: AppTheme.midnightBlueDark,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppTheme.accentTeal,
          backgroundColor: AppTheme.midnightBlue,
          onRefresh: () => ref.read(eventsProvider.notifier).refresh(),
          child: eventsAsync.when(
            data: (events) {
              if (events.isEmpty) {
                return _buildEmptyState(context);
              }
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                itemCount: events.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 400 + (index * 100)),
                    curve: Curves.easeOutQuart,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 50 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      );
                    },
                    child: EventCardPremium(event: events[index]),
                  );
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
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => ref.refresh(eventsProvider),
                    child: const Text('Réessayer',
                        style: TextStyle(
                            color: AppTheme.accentTeal,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
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
          Icon(Icons.event_note,
              size: 80, color: AppTheme.textGrey.withValues(alpha: 0.3)),
          const SizedBox(height: 24),
          const Text(
            'Aucun événement',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Revenez plus tard pour découvrir\nde nouvelles opportunités.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppTheme.textGrey),
          ),
        ],
      ),
    );
  }
}
