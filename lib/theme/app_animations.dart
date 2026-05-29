import 'package:flutter/material.dart';

// Custom easing curves — Emil: "The built-in CSS easings are too weak."
// These are Flutter equivalents of the custom cubic-bezier curves recommended.
class AppEasing {
  AppEasing._();

  /// Strong ease-out for UI interactions (Emil: cubic-bezier(0.23, 1, 0.32, 1))
  static const easeOut = Cubic(0.23, 1.0, 0.32, 1.0);

  /// Strong ease-in-out for on-screen movement (Emil: cubic-bezier(0.77, 0, 0.175, 1))
  static const easeInOut = Cubic(0.77, 0.0, 0.175, 1.0);

  /// iOS-like drawer curve (Emil: cubic-bezier(0.32, 0.72, 0, 1))
  static const easeDrawer = Cubic(0.32, 0.72, 0.0, 1.0);

  /// Snappy spring-like ease-out for press feedback
  static const snappy = Cubic(0.18, 0.89, 0.32, 1.22);

  /// Emphasized deceleration (Material 3)
  static const emphasized = Cubic(0.05, 0.7, 0.1, 1.0);
}

/// Common animation durations — Emil: "UI animations should stay under 300ms"
class AppDurations {
  AppDurations._();

  /// Button press feedback: 100-160ms
  static const press = Duration(milliseconds: 120);

  /// Tooltips, small popovers: 125-200ms
  static const micro = Duration(milliseconds: 150);

  /// Dropdowns, selects: 150-250ms
  static const fast = Duration(milliseconds: 200);

  /// Standard UI transitions: 250-300ms
  static const normal = Duration(milliseconds: 280);

  /// Modals, drawers: 200-500ms
  static const slow = Duration(milliseconds: 350);

  /// Stagger delay between items: 30-80ms
  static const stagger = Duration(milliseconds: 50);

  /// Carousel auto-scroll
  static const carousel = Duration(milliseconds: 400);
}

/// Emil: "Stagger animations — Each element animates in with a small delay"
class StaggerController {
  StaggerController({
    required this.controller,
    required this.itemCount,
    this.baseDelay = 0,
    this.staggerDelay = 50,
  });

  final AnimationController controller;
  final int itemCount;
  final int baseDelay;
  final int staggerDelay;

  Animation<double> animation(int index) {
    final start = (baseDelay + index * staggerDelay) / controller.duration!.inMilliseconds;
    final end = start + 0.5;
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          start.clamp(0.0, 1.0),
          end.clamp(0.0, 1.0),
          curve: AppEasing.easeOut,
        ),
      ),
    );
  }

  static List<Animation<double>> createAll({
    required AnimationController controller,
    required int count,
    int staggerMs = 50,
  }) {
    return List.generate(
      count,
      (i) => Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            (i * staggerMs) / controller.duration!.inMilliseconds,
            ((i * staggerMs) + 200) / controller.duration!.inMilliseconds,
            curve: AppEasing.easeOut,
          ),
        ),
      ),
    );
  }
}
