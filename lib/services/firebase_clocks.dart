import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogwarts_clock/models/clocks.dart';

abstract class FirebaseClocks {
  static Future<void> save({required Clocks clocks}) async {
    final docClock =
        FirebaseFirestore.instance.collection('clocks').doc(clocks.guid);

    await docClock.set(clocks.toJson());
  }

  static Future<Clocks?> load({required String guid}) async {
    final docClock = FirebaseFirestore.instance.collection('clocks').doc(guid);
    final snapshot = await docClock.get();

    if (snapshot.exists) {
      return Clocks.fromJson(snapshot.data()!);
    } else {
      return Clocks.initializeValue();
    }
  }
}
