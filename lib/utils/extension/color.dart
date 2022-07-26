// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

extension Converter on Color {
  String toDescription() {
    if (this == ClockColors.blue) {
      return 'blue';
    }
    if (this == ClockColors.yellow) {
      return 'yellow';
    }
    if (this == ClockColors.green) {
      return 'green';
    }

    return 'red';
  }
}
