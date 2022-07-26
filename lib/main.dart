import 'package:flutter/material.dart';
import 'package:hogwarts_clock/models/clocks.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/clocks.dart';
import 'package:hogwarts_clock/utils/constants/keys_string.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart' show Firebase;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ClocksRepositories.clocks = await Clocks.initializeValue();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KeysString.titleApp,
      routes: {
        '/': (_) => ClocksPage(),
      },
    );
  }
}
