import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class RecentSearchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const RecentSearchTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppTheme.lighterGray,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                PhosphorIcons.house,
                color: AppTheme.textColorLight,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColor,
                      height: 1.24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColorLight,
                      height: 1.24,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              PhosphorIcons.arrowUpRight,
              color: AppTheme.textColorLight,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
