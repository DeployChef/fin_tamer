import 'package:flutter/material.dart';

extension ColorFromStringExtension on String {
  Color get colorFromString {
    final hash = hashCode.abs();
    const goldenRatio = 0.618033988749895;
    final hue = ((hash * goldenRatio) % 1.0) * 360;
    const saturation = 0.8;
    const value = 0.9;

    return HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
  }
}
