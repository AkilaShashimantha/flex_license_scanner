import 'package:flutter/material.dart';
import 'src/domain/entities/scanner_config.dart';
import 'src/presentation/license_painter.dart';

export 'src/domain/entities/scanner_config.dart';
export 'src/data/datasources/license_ocr_service.dart';
/// A professional overlay for Driving License OCR scanning.
class LicenseScannerOverlay extends StatelessWidget {
  final ScannerConfig? config;

  const LicenseScannerOverlay({super.key, this.config});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: LicensePainter(config ?? ScannerConfig()),
    );
  }
}
