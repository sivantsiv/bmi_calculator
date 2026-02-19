import 'dart:ui';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<Color>? gradientColors;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 15.0,
    this.opacity = 0.15,
    this.borderRadius = 24.0,
    this.padding,
    this.margin,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: AppTheme.glassBorder, width: 1.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:
                    gradientColors ??
                    [
                      Colors.white.withValues(alpha: opacity),
                      Colors.white.withValues(alpha: opacity * 0.5),
                    ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
