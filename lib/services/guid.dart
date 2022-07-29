import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GUID {
  static String generate() {
    Random random = Random(DateTime.now().millisecond);

    const String hexDigits = "0123456789abcdef";
    final List<String> uuid = List<String>.filled(36, '');

    for (int i = 0; i < 36; i++) {
      final int hexPos = random.nextInt(16);
      uuid[i] = (hexDigits.substring(hexPos, hexPos + 1));
    }

    int pos = (int.parse(uuid[19], radix: 16) & 0x3) |
        0x8; // bits 6-7 of the clock_seq_hi_and_reserved to 01

    uuid[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    uuid[19] = hexDigits.substring(pos, pos + 1);

    uuid[8] = uuid[13] = uuid[18] = uuid[23] = "-";

    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }

  static Future<void> save({required String guid}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('GUID', guid);
  }

  static Future<String> load() async {
    final prefs = await SharedPreferences.getInstance();
    final String guid = prefs.getString('GUID') ?? generate();
    return guid;
  }
}
