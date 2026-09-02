import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/models/stay_model.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/features/home/presentation/screens/stay_detail_screen.dart';

class CompactStayCard extends StatelessWidget {
  final StayModel stay;

  const CompactStayCard({super.key, required this.stay});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                StayDetailScreen(stay: stay),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: '${stay.id}_image',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      stay.imageUrl,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          stay.locationTag.split(',')[0],
                          style: const TextStyle(
                            color: AppTheme.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          ', ${stay.locationTag.split(',')[1].trim()}',
                          style: const TextStyle(
                            color: AppTheme.textColorLight,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 16,
                    child: const Icon(
                      PhosphorIcons.arrowUpRight,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              stay.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppTheme.textColor,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  PhosphorIcons.mapPin,
                  color: AppTheme.textColorLight,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    stay.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.textColorLight,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Icon(
                  PhosphorIcons.arrowUpRight,
                  color: AppTheme.textColorLight,
                  size: 12,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < stay.rating.floor()
                            ? PhosphorIcons.starFill
                            : PhosphorIcons.starHalfFill,
                        color: Colors.amber,
                        size: 12,
                      );
                    }),
                    const SizedBox(width: 4),
                    Text(
                      stay.rating.toString(),
                      style: const TextStyle(
                        color: AppTheme.textColorLight,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      'From ',
                      style: TextStyle(
                        color: AppTheme.textColorLight,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$${stay.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      ' Only',
                      style: TextStyle(
                        color: AppTheme.textColorLight,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
