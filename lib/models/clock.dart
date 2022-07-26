import 'package:flutter/material.dart';
import 'package:hogwarts_clock/utils/extension/color.dart';
import 'package:hogwarts_clock/utils/extension/string.dart';

class Clock {
  Color colorSubstance;
  double value;

  Clock({
    required this.colorSubstance,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        'color': colorSubstance.toDescription(),
        'value': value,
      };

  static Clock fromJson(Map<String, dynamic> json) {
    return Clock(
      colorSubstance: json['color'].toString().tryingToColor(),
      value: json['value'],
    );
  }
}
