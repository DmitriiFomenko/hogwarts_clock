import 'package:flutter/material.dart';
import 'package:hogwarts_clock/ui/pages/clocks/clocks.dart';
import 'package:hogwarts_clock/utils/constants/text.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsText.titleApp,
      routes: {
        '/': (_) => const ClocksPage(),
      },
    );
  }
}
