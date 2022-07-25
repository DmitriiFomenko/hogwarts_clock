import 'package:hogwarts_clock/models/clock.dart';
import 'package:hogwarts_clock/models/clocks.dart';
import 'package:hogwarts_clock/services/guid.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

abstract class ClocksRepositories {
  static Clocks? clocks;

  static Future<void> initializeValue() async {
    clocks = Clocks(
      clocks: <Clock>[
        Clock(
          colorSubstance: ClockColors.green,
          value: 0.4,
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
          value: 0.3,
        ),
      ],
      guid: await GUID.load(),
    );
  }
}
