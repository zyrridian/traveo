import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class HeroSearchBar extends StatelessWidget {
  final bool readOnly;
  final bool autofocus;
  final bool showBackButton;
  final VoidCallback? onTap;

  const HeroSearchBar({
    super.key,
    this.readOnly = false,
    this.autofocus = false,
    this.showBackButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search_bar_hero',
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        return DefaultTextStyle(
          style: DefaultTextStyle.of(toHeroContext).style,
          child: toHeroContext.widget,
        );
      },
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(36),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppTheme.lighterGray,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: showBackButton ? () => Navigator.of(context).pop() : null,
                  child: Icon(
                    showBackButton ? PhosphorIcons.arrowLeft : PhosphorIcons.mapPinFill,
                    color: showBackButton ? AppTheme.textColor : AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Bali',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppTheme.textColor,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 1,
                  height: 24,
                  color: const Color(0xFF000000).withOpacity(.06),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    readOnly: readOnly,
                    autofocus: autofocus,
                    onTap: onTap,
                    decoration: const InputDecoration(
                      hintText: 'Where are you going?',
                      hintStyle:
                          TextStyle(color: AppTheme.textColorLight, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(PhosphorIcons.magnifyingGlass, color: Color(0xFF9CA3AF)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
