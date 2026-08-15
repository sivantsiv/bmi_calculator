import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'app_theme.dart';

class FluidBackground extends StatefulWidget {
  final Widget child;
  const FluidBackground({super.key, required this.child});

  @override
  State<FluidBackground> createState() => _FluidBackgroundState();
}

class _FluidBackgroundState extends State<FluidBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base Background
        Container(color: AppTheme.background),
        // Animated Blobs
        Positioned.fill(
          child: RepaintBoundary(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _FluidPainter(animationValue: _controller.value),
                );
              },
            ),
          ),
        ),
        // Content
        widget.child,
      ],
    );
  }
}

class _FluidPainter extends CustomPainter {
  final double animationValue;

  static final Paint _paint1 = Paint()
    ..color = AppTheme.primary.withValues(alpha: 0.3)
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

  static final Paint _paint2 = Paint()
    ..color = AppTheme.accent.withValues(alpha: 0.2)
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

  static final Paint _paint3 = Paint()
    ..color = const Color(0xFF9C27B0).withValues(alpha: 0.2)
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

  _FluidPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Dynamic positions
    final angle = animationValue * 2 * math.pi;

    canvas.drawCircle(
      Offset(
        size.width * 0.3 + math.cos(angle) * 50,
        size.height * 0.2 + math.sin(angle) * 80,
      ),
      size.width * 0.5,
      _paint1,
    );

    canvas.drawCircle(
      Offset(
        size.width * 0.8 + math.sin(angle * 0.7) * 60,
        size.height * 0.5 + math.cos(angle * 0.7) * 100,
      ),
      size.width * 0.4,
      _paint2,
    );

    canvas.drawCircle(
      Offset(
        size.width * 0.4 + math.cos(angle * 1.3) * 70,
        size.height * 0.8 + math.sin(angle * 1.3) * 60,
      ),
      size.width * 0.45,
      _paint3,
    );
  }

  @override
  bool shouldRepaint(covariant _FluidPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
