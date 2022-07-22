import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  static String lastSaveGUID = 'null';

  static Future saveClocks() async {
    final docClock =
        FirebaseFirestore.instance.collection('clocks').doc('test');

    await docClock.set(ClocksRepositories.toJson());
  }

  static Future loadClocks() async {
    final docClock =
        FirebaseFirestore.instance.collection('clocks').doc('test');
    final snapshot = await docClock.get();

    if (snapshot.exists) {
      ClocksRepositories.fromJson(snapshot.data()!);
    }
  }

  static Map<String, dynamic> toJson() => {
        '0 clock': clocks[0].toJson(),
        '1 clock': clocks[1].toJson(),
        '2 clock': clocks[2].toJson(),
        '3 clock': clocks[3].toJson(),
        'OS': Platform.operatingSystem,
      };

  static void fromJson(Map<String, dynamic> json) {
    clocks = [
      clocks[0] = Clock.fromJson(json['0 clock']),
      clocks[1] = Clock.fromJson(json['1 clock']),
      clocks[2] = Clock.fromJson(json['2 clock']),
      clocks[3] = Clock.fromJson(json['3 clock']),
    ];

    lastSaveGUID = json['OS'] ?? 'null';
  }
}
