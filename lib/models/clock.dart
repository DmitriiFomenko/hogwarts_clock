import 'package:flutter/material.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

class Clock {
  Color colorSubstance;
  double value;

  Clock({
    required this.colorSubstance,
    required this.value,
  });

  String _colorToString(Color color) {
    if (color == ClockColors.blue) {
      return 'blue';
    }
    if (color == ClockColors.yellow) {
      return 'yellow';
    }
    if (color == ClockColors.green) {
      return 'green';
    }

    return 'red';
  }

  static Color _stringToColor(String color) {
    if (color == 'blue') {
      return ClockColors.blue;
    }
    if (color == 'yellow') {
      return ClockColors.yellow;
    }
    if (color == 'green') {
      return ClockColors.green;
    }

    return ClockColors.red;
  }

  Map<String, dynamic> toJson() => {
        'color': _colorToString(colorSubstance),
        'value': value,
      };

  static Clock fromJson(Map<String, dynamic> json) {
    return Clock(
      colorSubstance: _stringToColor(json['color']),
      value: json['value'],
    );
  }
}
