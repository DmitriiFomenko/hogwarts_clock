import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:hogwarts_clock/models/clock.dart';
import 'package:hogwarts_clock/services/guid.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

class Clocks extends Equatable {
  final List<Clock> clocks;
  final String guid;

  const Clocks({
    required this.clocks,
    required this.guid,
  });

  @override
  List<Object> get props => [
        clocks,
        guid,
      ];

  static Future<Clocks> initializeValue() async {
    Clocks clocks = Clocks(clocks: <Clock>[
      Clock(
        colorSubstance: ClockColors.green,
        value: 0.3,
      ),
      Clock(
        colorSubstance: ClockColors.blue,
        value: 0.2,
      ),
      Clock(
        colorSubstance: ClockColors.red,
        value: 0.6,
      ),
      Clock(
        colorSubstance: ClockColors.yellow,
        value: 0.4,
      ),
    ], guid: await GUID.load());
    return clocks;
  }

  Clocks clone() {
    return Clocks(
      clocks: clocks
          .map(
            (clock) => clock.clone(),
          )
          .toList(),
      guid: guid,
    );
  }

  Map<String, dynamic> toJson() => {
        '0 clock': clocks[0].toJson(),
        '1 clock': clocks[1].toJson(),
        '2 clock': clocks[2].toJson(),
        '3 clock': clocks[3].toJson(),
        'GUID': guid,
        'OS': Platform.operatingSystem,
      };

  static Clocks fromJson(Map<String, dynamic> json) {
    return Clocks(
      clocks: [
        Clock.fromJson(json['0 clock']),
        Clock.fromJson(json['1 clock']),
        Clock.fromJson(json['2 clock']),
        Clock.fromJson(json['3 clock']),
      ],
      guid: json['GUID'],
    );
  }
}
