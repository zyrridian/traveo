import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/models/stay_model.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/features/home/presentation/screens/stay_detail_screen.dart';

class StayCard extends StatefulWidget {
  final StayModel stay;

  const StayCard({super.key, required this.stay});

  @override
  State<StayCard> createState() => _StayCardState();
}

class _StayCardState extends State<StayCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final stay = widget.stay;
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
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppTheme.lighterGray,
          borderRadius: BorderRadius.circular(32),
        ),
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
                      height: 254,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
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
                            height: 1.24,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          ', ${stay.locationTag.split(',')[1].trim()}',
                          style: const TextStyle(
                            color: AppTheme.textColorLight,
                            fontWeight: FontWeight.w400,
                            height: 1.24,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            _isFavorite
                                ? PhosphorIcons.heartFill
                                : PhosphorIcons.heart,
                            color: _isFavorite
                                ? Colors.red
                                : AppTheme.textColorLight,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: Icon(
                          PhosphorIcons.arrowUpRight,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
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
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0
                              ? Colors.white
                              : Colors.white, //.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                stay.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: AppTheme.textColor,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  Icon(
                    PhosphorIcons.mapPin,
                    color: AppTheme.textColorLight,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    stay.location,
                    style: const TextStyle(
                      color: AppTheme.textColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.24,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    PhosphorIcons.arrowUpRight,
                    color: AppTheme.textColorLight,
                    size: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
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
                          size: 15,
                        );
                      }),
                      const SizedBox(width: 8),
                      Text(
                        stay.rating.toString(),
                        style: const TextStyle(
                          color: AppTheme.textColorLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.24,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'From ',
                        style: TextStyle(
                          color: AppTheme.textColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.24,
                        ),
                      ),
                      Text(
                        '\$${stay.price}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.24,
                        ),
                      ),
                      const Text(
                        ' Only',
                        style: TextStyle(
                          color: AppTheme.textColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (stay.tags.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: stay.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Color(0xFF8998B2),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.24,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
