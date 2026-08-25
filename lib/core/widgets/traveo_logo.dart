import 'package:flutter/material.dart';

class TraveoLogo extends StatelessWidget {
  final double size;
  final Color color;

  const TraveoLogo({
    super.key,
    this.size = 100,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TraveoLogoPainter(color: color),
    );
  }
}

class _TraveoLogoPainter extends CustomPainter {
  final Color color;

  _TraveoLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final w = size.width;
    final h = size.height;

    final gapY = h * 0.05; 
    
    final ctrlX = w * 0.5;
    final ctrlY = h * 0.5;

    final topPath = Path();
    topPath.moveTo(0, 0);
    topPath.quadraticBezierTo(w * 0.5, h * 0.2, w, 0);
    topPath.quadraticBezierTo(w * 0.75, h * 0.35, w * 0.53, h * 0.5 - gapY);
    topPath.quadraticBezierTo(w * 0.5, h * 0.5 - gapY + (h * 0.02), w * 0.47, h * 0.5 - gapY);
    topPath.quadraticBezierTo(w * 0.25, h * 0.35, 0, 0);
    topPath.close();

    final bottomPath = Path();
    bottomPath.moveTo(0, h);
    bottomPath.quadraticBezierTo(w * 0.5, h * 0.8, w, h);
    bottomPath.quadraticBezierTo(w * 0.75, h * 0.65, w * 0.53, h * 0.5 + gapY);
    bottomPath.quadraticBezierTo(w * 0.5, h * 0.5 + gapY - (h * 0.02), w * 0.47, h * 0.5 + gapY);
    bottomPath.quadraticBezierTo(w * 0.25, h * 0.65, 0, h);
    bottomPath.close();

    canvas.drawPath(topPath, paint);
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
