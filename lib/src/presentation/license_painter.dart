import 'package:flutter/material.dart';
import '../domain/entities/scanner_config.dart';

class LicensePainter extends CustomPainter {
  final ScannerConfig config;

  LicensePainter(this.config);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withAlpha((config.overlayOpacity * 255).round());

    /// 1. Calculate the horizontal rectangle dimensions using config
    double width = size.width * config.frameWidthRatio;
    double height = width / config.aspectRatio;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: width,
      height: height,
    );

    final cornerRadius = Radius.circular(config.cornerRadius);

    /// 2. Draw overlay with a hole
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()..addRRect(RRect.fromRectAndRadius(rect, cornerRadius)),
      ),
      paint,
    );

    /// 3. Draw the guide frame border
    final borderPaint = Paint()
      ..color = config.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = config.borderWidth;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, cornerRadius),
      borderPaint,
    );
  }

  /// Get the scanner frame rectangle for a given size
  static Rect getScannerFrameRect(Size size, ScannerConfig config) {
    double width = size.width * config.frameWidthRatio;
    double height = width / config.aspectRatio;
    return Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: width,
      height: height,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
