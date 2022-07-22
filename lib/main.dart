import 'package:flutter/material.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/clocks.dart';
import 'package:hogwarts_clock/utils/constants/text.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:hogwarts_clock/utils/generate/guid_gen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ClocksRepositories.guid = GUIDGen.generate();

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
        '/': (_) => ClocksPage(),
      },
    );
  }
}
