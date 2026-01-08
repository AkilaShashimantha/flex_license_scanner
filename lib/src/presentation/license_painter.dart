import 'package:flutter/material.dart';
import '../domain/entities/scanner_config.dart';

class LicensePainter extends CustomPainter {
  final ScannerConfig config;

  LicensePainter(this.config);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(
        (Colors.black.r * 255.0).round().clamp(0, 255),
        (Colors.black.g * 255.0).round().clamp(0, 255),
        (Colors.black.b * 255.0).round().clamp(0, 255),
        config.overlayOpacity,
      );

    /// 1. Calculate the horizontal rectangle dimensions
    double width = size.width * 0.9; /// 90% of screen width
    double height = width / config.aspectRatio;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: width,
      height: height,
    );

    /// 2. Draw overlay with a hole
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()
          ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(16))),
      ),
      paint,
    );

    /// 3. Draw the "Margin" Guide borders
    final borderPaint = Paint()
      ..color = config.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(16)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
