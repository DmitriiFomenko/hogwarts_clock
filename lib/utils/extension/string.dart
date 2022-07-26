import 'package:flutter/material.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

extension Converter on String {
  Color tryingToColor() {
    if (this == 'blue') {
      return ClockColors.blue;
    }
    if (this == 'yellow') {
      return ClockColors.yellow;
    }
    if (this == 'green') {
      return ClockColors.green;
    }

    return ClockColors.red;
  }
}
