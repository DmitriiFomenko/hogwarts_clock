import 'package:hogwarts_clock/models/clock.dart';
import 'package:hogwarts_clock/utils/constants/clock_colors.dart';

abstract class ClocksRepositories {
  static List<Clock> clocks = [
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
  ];
}
