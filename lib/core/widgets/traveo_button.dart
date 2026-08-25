import 'package:flutter/material.dart';
import 'package:traveo/core/theme/app_theme.dart';

class TraveoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isDanger;

  const TraveoButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon = Icons.arrow_outward,
    this.iconColor,
    this.backgroundColor,
    this.foregroundColor,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = backgroundColor ?? AppTheme.primaryBlue;
    Color fg = foregroundColor ?? Colors.white;

    if (isDanger) {
      bg = const Color(0xFFFF4B4B);
      fg = Colors.white;
    }

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          disabledBackgroundColor: Colors.grey.shade200,
          disabledForegroundColor: Colors.black38,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20, color: iconColor),
            ],
          ],
        ),
      ),
    );
  }
}
