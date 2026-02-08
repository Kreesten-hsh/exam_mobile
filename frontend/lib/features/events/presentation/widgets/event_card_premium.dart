import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/event_entity.dart';

class EventCardPremium extends ConsumerStatefulWidget {
  final EventEntity event;

  const EventCardPremium({super.key, required this.event});

  @override
  ConsumerState<EventCardPremium> createState() => _EventCardPremiumState();
}

class _EventCardPremiumState extends ConsumerState<EventCardPremium> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Media handling: prioritize list, fallback to single url, fallback to placeholder
    final mediaList = widget.event.mediaUrls.isNotEmpty
        ? widget.event.mediaUrls
        : (widget.event.mediaUrl != null ? [widget.event.mediaUrl!] : []);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: () {
          context.push('/event-detail', extra: widget.event);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. CAROUSEL SECTION
            Stack(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: mediaList.isNotEmpty
                      ? PageView.builder(
                          controller: _pageController,
                          itemCount: mediaList.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: mediaList[index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: AppTheme.midnightBlueLight,
                                child: const Center(
                                    child: CircularProgressIndicator(
                                        color: AppTheme.accentTeal)),
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
                              size: 64, color: AppTheme.textGrey),
                        ),
                ),
                // Gradient Overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                // Price Badge
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Text(
                      '${widget.event.priceFull.toStringAsFixed(0)}€',
                      style: const TextStyle(
                        color: AppTheme.midnightBlueDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                // Page Indicator
                if (mediaList.length > 1)
                  Positioned(
                    bottom: 12,
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

            // 2. INFO SECTION
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.event.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 12),

                  // Date & Location
                  Row(
                    children: [
                      _InfoBadge(
                        icon: Icons.calendar_today,
                        text: DateFormat('EEEE d MMMM • HH:mm', 'fr_FR')
                            .format(widget.event.date),
                        color: AppTheme.accentTeal,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _InfoBadge(
                          icon: Icons.location_on,
                          text: widget.event.location ?? 'Lieu secret 🤫',
                          color: AppTheme.accentViolet,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 3. PARTICIPANTS PROGRESS
                  _ParticipantsBlock(event: widget.event),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _InfoBadge(
      {required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              color: AppTheme.textGrey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ParticipantsBlock extends StatelessWidget {
  final EventEntity event;

  const _ParticipantsBlock({required this.event});

  @override
  Widget build(BuildContext context) {
    final totalCapacity = event.maxMen + event.maxWomen;
    final totalRegistered = event.participantsCount;
    // Safety check for counts incase backend sends nulls or zeros logic
    final menRegistered = event.menCount;
    final womenRegistered = event.womenCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Participants inscrits',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textGrey,
                  ),
            ),
            Text(
              '$totalRegistered / $totalCapacity',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Progress Bar Background
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.midnightBlueLight,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Row(
              children: [
                // Women Segment (Pink/Purple)
                if (womenRegistered > 0)
                  Flexible(
                    flex: womenRegistered,
                    fit: FlexFit.tight,
                    child: Container(
                      color: AppTheme.accentViolet,
                    ),
                  ),
                // Men Segment (Teal/Blue)
                if (menRegistered > 0)
                  Flexible(
                    flex: menRegistered,
                    fit: FlexFit.tight,
                    child: Container(
                      color: AppTheme.accentTeal,
                    ),
                  ),
                // Remaining Space
                if ((totalCapacity - totalRegistered) > 0)
                  Flexible(
                    flex: (totalCapacity - totalRegistered),
                    fit: FlexFit.tight,
                    child: Container(color: Colors.transparent),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Women Stats
            Row(children: [
              Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: AppTheme.accentViolet, shape: BoxShape.circle)),
              const SizedBox(width: 4),
              Text('$womenRegistered Femmes',
                  style:
                      const TextStyle(color: AppTheme.textGrey, fontSize: 11)),
            ]),
            // Men Stats
            Row(children: [
              Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: AppTheme.accentTeal, shape: BoxShape.circle)),
              const SizedBox(width: 4),
              Text('$menRegistered Hommes',
                  style:
                      const TextStyle(color: AppTheme.textGrey, fontSize: 11)),
            ]),
          ],
        )
      ],
    );
  }
}
