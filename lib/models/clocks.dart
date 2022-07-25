import 'dart:io';

import 'package:hogwarts_clock/models/clock.dart';

class Clocks {
  final List<Clock> clocks;
  final String guid;

  Clocks({
    required this.clocks,
    required this.guid,
  });

  Map<String, dynamic> toJson() => {
        '0 clock': clocks[0].toJson(),
        '1 clock': clocks[1].toJson(),
        '2 clock': clocks[2].toJson(),
        '3 clock': clocks[3].toJson(),
        'GUID': guid,
        'OS': Platform.operatingSystem,
      };

  Clocks fromJson(Map<String, dynamic> json) {
    return Clocks(
      clocks: [
        Clock.fromJson(json['0 clock']),
        Clock.fromJson(json['1 clock']),
        Clock.fromJson(json['2 clock']),
        Clock.fromJson(json['3 clock']),
      ],
      guid: guid,
    );
  }
}
