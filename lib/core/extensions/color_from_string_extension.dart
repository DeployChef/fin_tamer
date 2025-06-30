import 'package:flutter/material.dart';

extension ColorFromStringExtension on String {
  Color get colorFromString {
    int sum = 0;
    for (var codeUnit in codeUnits) {
      sum += codeUnit;
    }
    final hue = (sum % 360).toDouble();
    const sat = 0.6;
    const light = 0.55;
    return HSLColor.fromAHSL(1.0, hue, sat, light).toColor();
  }
}
