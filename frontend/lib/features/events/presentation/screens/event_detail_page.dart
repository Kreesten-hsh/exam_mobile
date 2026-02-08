import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/events/domain/entities/event_entity.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../providers/events_provider.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  final EventEntity event;

  const EventDetailPage({super.key, required this.event});

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 1. Watch la liste globale des events
    final eventsAsync = ref.watch(eventsProvider);

    // 2. Trouver l'event courrant dans la liste (State Source Unique)
    // Si la liste charge ou erreur, on utilise widget.event (Fallback)
    final currentEvent = eventsAsync.valueOrNull?.firstWhere(
          (e) => e.id == widget.event.id,
          orElse: () => widget.event,
        ) ??
        widget.event;

    // Media handling sur l'event courant
    final mediaList = currentEvent.mediaUrls.isNotEmpty
        ? currentEvent.mediaUrls
        : (currentEvent.mediaUrl != null ? [currentEvent.mediaUrl!] : []);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. APP BAR & CAROUSEL
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  mediaList.isNotEmpty
                      ? PageView.builder(
                          controller: _pageController,
                          itemCount: mediaList.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: mediaList[index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: AppTheme.midnightBlueLight,
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: AppTheme.midnightBlueLight,
                                child: const Icon(Icons.broken_image,
                                    color: AppTheme.textGrey),
                              ),
                            );
                          },
                        )
                      : Container(
                          color: AppTheme.midnightBlueLight,
                          child: const Icon(Icons.event,
                              size: 80, color: AppTheme.textGrey),
                        ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.4),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                  // Page Indicator
                  if (mediaList.length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: mediaList.length,
                          effect: const WormEffect(
                            dotColor: Colors.white54,
                            activeDotColor: AppTheme.accentTeal,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 2. CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text(
                    currentEvent.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),

                  // INFO GRID
                  _buildInfoRow(
                    context,
                    Icons.calendar_today,
                    DateFormat('EEEE d MMMM yyyy • HH:mm', 'fr_FR')
                        .format(currentEvent.date),
                    AppTheme.accentTeal,
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    context,
                    Icons.location_on,
                    currentEvent.location ?? 'Lieu à confirmer',
                    AppTheme.accentViolet,
                  ),

                  const SizedBox(height: 24),
                  const Divider(color: AppTheme.midnightBlueLight),
                  const SizedBox(height: 24),

                  // DESCRIPTION
                  Text(
                    'À propos',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    currentEvent.description ?? 'Description à venir.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textGrey,
                          height: 1.5,
                        ),
                  ),

                  const SizedBox(height: 24),
                  const Divider(color: AppTheme.midnightBlueLight),
                  const SizedBox(height: 24),

                  // PARTICIPANTS
                  Text(
                    'Participants',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  _buildParticipantsStats(context, currentEvent),

                  const SizedBox(height: 24),
                  const Divider(color: AppTheme.midnightBlueLight),
                  const SizedBox(height: 24),

                  // PRICING
                  Text(
                    'Tarifs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPriceCard(
                          context,
                          'Total',
                          '${currentEvent.priceFull.toStringAsFixed(0)}€',
                          AppTheme.accentTeal,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildPriceCard(
                          context,
                          'Acompte',
                          '${currentEvent.priceDeposit.toStringAsFixed(0)}€',
                          AppTheme.accentViolet,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ACTION BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentEvent.isRegistered) {
                          context
                              .push('/events/${currentEvent.id}/participants');
                        } else {
                          _showRegistrationConfirmation(context, currentEvent);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentEvent.isRegistered
                            ? AppTheme.midnightBlueLight
                            : AppTheme.accentTeal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        currentEvent.isRegistered
                            ? 'Voir les participants'
                            : 'S\'inscrire à l\'événement',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String text, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textGrey,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildParticipantsStats(BuildContext context, EventEntity event) {
    final totalCapacity = event.maxMen + event.maxWomen;
    final totalRegistered = event.participantsCount;
    final menRegistered = event.menCount;
    final womenRegistered = event.womenCount;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Places occupées',
                style: TextStyle(color: AppTheme.textGrey)),
            Text(
              '$totalRegistered / $totalCapacity',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 12,
            child: Row(
              children: [
                if (womenRegistered > 0)
                  Flexible(
                    flex: womenRegistered,
                    child: Container(color: AppTheme.accentViolet),
                  ),
                if (menRegistered > 0)
                  Flexible(
                    flex: menRegistered,
                    child: Container(color: AppTheme.accentTeal),
                  ),
                if ((totalCapacity - totalRegistered) > 0)
                  Flexible(
                    flex: totalCapacity - totalRegistered,
                    child: Container(color: AppTheme.midnightBlueLight),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatBadge(womenRegistered, 'Femmes', AppTheme.accentViolet),
            _buildStatBadge(menRegistered, 'Hommes', AppTheme.accentTeal),
          ],
        )
      ],
    );
  }

  Widget _buildStatBadge(int count, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          '$count $label',
          style: const TextStyle(
              color: AppTheme.textGrey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildPriceCard(
      BuildContext context, String label, String price, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.midnightBlueLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(label,
              style: const TextStyle(color: AppTheme.textGrey, fontSize: 13)),
          const SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showRegistrationConfirmation(BuildContext context, EventEntity event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.midnightBlueDark,
        title: const Text('Confirmer l\'inscription',
            style: TextStyle(color: Colors.white)),
        content: Text('Voulez-vous vous inscrire à "${event.name}" ?',
            style: const TextStyle(color: AppTheme.textGrey)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler',
                style: TextStyle(color: AppTheme.textGrey)),
          ),
          ElevatedButton(
            onPressed: () async {
              // 1. Fermer la modale AVANT l'appel async (UX Optimiste)
              Navigator.pop(context);

              try {
                // 2. Appel au provider (qui mettra à jour l'état localement)
                await ref.read(eventsProvider.notifier).joinEvent(event.id);

                // 3. Feedback succès
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inscription réussie !')),
                  );
                }
              } catch (e) {
                // 4. Feedback erreur
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Erreur lors de l\'inscription : $e')),
                  );
                }
              }
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: AppTheme.accentTeal),
            child:
                const Text('Confirmer', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
