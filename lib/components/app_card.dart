import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_animations.dart';

/// Emil: "Never animate from scale(0) — start from scale(0.95) with opacity."
/// Standard card wrapper with glow effect and subtle border.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.glowColor,
    this.glowIntensity = 1.0,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Gradient? gradient;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Color? glowColor;
  final double glowIntensity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        color: color ?? AppColors.surfaceCardAlt,
        gradient: gradient,
        border: Border.all(
          color: borderColor ?? AppColors.borderSubtle,
          width: borderWidth ?? 1,
        ),
        boxShadow: glowColor != null
            ? [
                BoxShadow(
                  color: glowColor!.withValues(alpha: 0.15 * glowIntensity),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      padding: padding ?? const EdgeInsets.all(16),
      child: child,
    );

    if (onTap != null) {
      return _PressableCard(
        onTap: onTap!,
        borderRadius: borderRadius ?? 16,
        child: card,
      );
    }

    return card;
  }
}

class _PressableCard extends StatefulWidget {
  const _PressableCard({
    required this.child,
    required this.onTap,
    required this.borderRadius,
  });

  final Widget child;
  final VoidCallback onTap;
  final double borderRadius;

  @override
  State<_PressableCard> createState() => _PressableCardState();
}

class _PressableCardState extends State<_PressableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.press,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: AppEasing.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnim.value,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}

/// Staggered entrance animation wrapper
/// Emil: "When multiple elements enter together, stagger their appearance."
class AnimatedEntry extends StatefulWidget {
  const AnimatedEntry({
    super.key,
    required this.child,
    this.delay = 0,
    this.duration = AppDurations.normal,
    this.translateY = 20.0,
    this.opacity = true,
  });

  final Widget child;
  final int delay;
  final Duration duration;
  final double translateY;
  final bool opacity;

  @override
  State<AnimatedEntry> createState() => _AnimatedEntryState();
}

class _AnimatedEntryState extends State<AnimatedEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: AppEasing.easeOut),
    );
    _slideAnim = Tween<Offset>(
      begin: Offset(0, widget.translateY / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: AppEasing.easeOut));
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => ClipRect(
        child: Opacity(
          opacity: widget.opacity ? _fadeAnim.value : 1.0,
          child: FractionalTranslation(
            translation: _slideAnim.value,
            child: child,
          ),
        ),
      ),
      child: widget.child,
    );
  }
}

/// Emil: "Elements animating from scale(0) look like they come out of nowhere."
/// Starts from scale(0.95) with opacity(0).
class AnimatedScaleIn extends StatefulWidget {
  const AnimatedScaleIn({
    super.key,
    required this.child,
    this.delay = 0,
    this.duration = AppDurations.normal,
  });

  final Widget child;
  final int delay;
  final Duration duration;

  @override
  State<AnimatedScaleIn> createState() => _AnimatedScaleInState();
}

class _AnimatedScaleInState extends State<AnimatedScaleIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _anim = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: AppEasing.easeOut),
    );
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) => Opacity(
        opacity: _anim.value,
        child: Transform.scale(scale: _anim.value, child: child),
      ),
      child: widget.child,
    );
  }
}
