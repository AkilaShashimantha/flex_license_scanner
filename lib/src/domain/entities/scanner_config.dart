import 'package:flutter/material.dart';

/// Defines the configuration for the license scanner overlay.
class ScannerConfig {
  /// The aspect ratio of a standard ID-1 card (License/ID).
  /// Approximately 1.585.
  final double aspectRatio;
  final Color borderColor;
  final double overlayOpacity;

  ScannerConfig({
    this.aspectRatio = 1.585,
    this.borderColor = Colors.green,
    this.overlayOpacity = 0.7,
  });
}