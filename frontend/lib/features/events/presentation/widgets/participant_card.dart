import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_theme.dart';
import '../../domain/entities/participant_entity.dart';

class ParticipantCard extends StatelessWidget {
  final ParticipantEntity participant;
  final VoidCallback? onTap;

  const ParticipantCard({
    super.key,
    required this.participant,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.midnightBlueLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          // AVATAR
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: participant.gender == 'M'
                  ? AppTheme.accentTeal.withValues(alpha: 0.2)
                  : AppTheme.accentViolet.withValues(alpha: 0.2),
              border: Border.all(
                color: participant.gender == 'M'
                    ? AppTheme.accentTeal
                    : AppTheme.accentViolet,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                participant.gender == 'M' ? Icons.male : Icons.female,
                color: participant.gender == 'M'
                    ? AppTheme.accentTeal
                    : AppTheme.accentViolet,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  participant.firstName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Participant',
                    style: TextStyle(
                      color: AppTheme.textGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ACTION
          if (onTap != null)
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.chat_bubble_outline),
              color: AppTheme.primaryOrange,
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.primaryOrange.withValues(alpha: 0.1),
              ),
            ),
        ],
      ),
    );
  }
}
