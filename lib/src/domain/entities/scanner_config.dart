import 'package:flutter/material.dart';

/// Defines the configuration for the license scanner overlay.
class ScannerConfig {
  /// The aspect ratio of a standard ID-1 card (License/ID).
  /// Approximately 1.585.
  final double aspectRatio;
  
  /// Border color of the scanning frame
  final Color borderColor;
  
  /// Opacity of the dark overlay (0.0 - 1.0)
  final double overlayOpacity;
  
  /// Corner radius of the scanning frame
  final double cornerRadius;
  
  /// Border width/thickness of the scanning frame
  final double borderWidth;
  
  /// Width ratio of the frame relative to screen width (0.0 - 1.0)
  final double frameWidthRatio;
  
  /// Whether to show the laser animation effect
  final bool showLaserAnimation;
  
  /// Color of the laser scanning line
  final Color laserColor;
  
  /// Duration for one complete laser animation cycle
  final Duration laserAnimationDuration;
  
  /// Glow intensity of the laser effect (0.0 - 1.0)
  final double laserGlowIntensity;

  const ScannerConfig({
    this.aspectRatio = 1.585,
    this.borderColor = Colors.green,
    this.overlayOpacity = 0.7,
    this.cornerRadius = 16.0,
    this.borderWidth = 3.0,
    this.frameWidthRatio = 0.9,
    this.showLaserAnimation = true,
    this.laserColor = Colors.green,
    this.laserAnimationDuration = const Duration(seconds: 2),
    this.laserGlowIntensity = 0.5,
  });
  
  /// Creates a copy of this config with the given fields replaced
  ScannerConfig copyWith({
    double? aspectRatio,
    Color? borderColor,
    double? overlayOpacity,
    double? cornerRadius,
    double? borderWidth,
    double? frameWidthRatio,
    bool? showLaserAnimation,
    Color? laserColor,
    Duration? laserAnimationDuration,
    double? laserGlowIntensity,
  }) {
    return ScannerConfig(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      borderColor: borderColor ?? this.borderColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      cornerRadius: cornerRadius ?? this.cornerRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      frameWidthRatio: frameWidthRatio ?? this.frameWidthRatio,
      showLaserAnimation: showLaserAnimation ?? this.showLaserAnimation,
      laserColor: laserColor ?? this.laserColor,
      laserAnimationDuration: laserAnimationDuration ?? this.laserAnimationDuration,
      laserGlowIntensity: laserGlowIntensity ?? this.laserGlowIntensity,
    );
  }
}
