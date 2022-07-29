import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_clock/utils/extension/color.dart';
import 'package:hogwarts_clock/utils/extension/string.dart';

// ignore: must_be_immutable
class Clock extends Equatable {
  Color colorSubstance;
  double value;

  Clock({
    required this.colorSubstance,
    required this.value,
  });

  @override
  List<Object> get props => [
        colorSubstance,
        value,
      ];

  Clock clone() {
    return Clock(
      colorSubstance: colorSubstance,
      value: value,
    );
  }

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
