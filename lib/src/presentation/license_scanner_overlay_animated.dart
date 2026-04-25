import 'package:flutter/material.dart';
import '../domain/entities/scanner_config.dart';
import 'license_painter.dart';

/// A professional scanner overlay with animated laser scanning effect
class LicenseScannerOverlayAnimated extends StatefulWidget {
  final ScannerConfig config;

  const LicenseScannerOverlayAnimated({
    super.key,
    this.config = const ScannerConfig(),
  });

  @override
  State<LicenseScannerOverlayAnimated> createState() =>
      _LicenseScannerOverlayAnimatedState();
}

class _LicenseScannerOverlayAnimatedState
    extends State<LicenseScannerOverlayAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _laserAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.config.laserAnimationDuration,
    );

    _laserAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.config.showLaserAnimation) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(LicenseScannerOverlayAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.laserAnimationDuration !=
        widget.config.laserAnimationDuration) {
      _animationController.duration = widget.config.laserAnimationDuration;
    }
    if (oldWidget.config.showLaserAnimation !=
        widget.config.showLaserAnimation) {
      if (widget.config.showLaserAnimation) {
        _animationController.repeat(reverse: true);
      } else {
        _animationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Static overlay with frame
        CustomPaint(
          size: Size.infinite,
          painter: LicensePainter(widget.config),
        ),
        // Animated laser line
        if (widget.config.showLaserAnimation)
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _laserAnimation,
              builder: (context, child) {
                return CustomPaint(
                  size: Size.infinite,
                  painter: LaserPainter(
                    config: widget.config,
                    animationValue: _laserAnimation.value,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

/// Paints the animated laser scanning line
class LaserPainter extends CustomPainter {
  final ScannerConfig config;
  final double animationValue;

  LaserPainter({
    required this.config,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Get the scanner frame rect
    final frameRect = LicensePainter.getScannerFrameRect(size, config);

    // Calculate laser Y position within the frame
    final laserY = frameRect.top +
        (frameRect.height * animationValue);

    // Horizontal padding from frame edges
    final horizontalPadding = frameRect.width * 0.05;

    // Draw laser glow effect
    final glowPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          config.laserColor.withAlpha(0),
          config.laserColor.withAlpha((config.laserGlowIntensity * 255).round()),
          config.laserColor.withAlpha(0),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(
        frameRect.left + horizontalPadding,
        laserY - 15,
        frameRect.width - (horizontalPadding * 2),
        30,
      ));

    canvas.drawRect(
      Rect.fromLTWH(
        frameRect.left + horizontalPadding,
        laserY - 10,
        frameRect.width - (horizontalPadding * 2),
        20,
      ),
      glowPaint,
    );

    // Draw main laser line
    final laserPaint = Paint()
      ..color = config.laserColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(frameRect.left + horizontalPadding, laserY),
      Offset(frameRect.right - horizontalPadding, laserY),
      laserPaint,
    );

    // Draw center highlight dot
    final dotPaint = Paint()
      ..color = config.laserColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(frameRect.center.dx, laserY),
      4,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(LaserPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.config != config;
  }
}
