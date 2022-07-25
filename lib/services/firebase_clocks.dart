import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogwarts_clock/models/clocks.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';

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
      return ClocksRepositories.clocks!.fromJson(snapshot.data()!);
    } else {
      ClocksRepositories.initializeValue();
      return ClocksRepositories.clocks;
    }
  }
}
