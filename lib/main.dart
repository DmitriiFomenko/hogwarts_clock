import 'package:flutter/material.dart';
import 'package:hogwarts_clock/ui/pages/clocks.dart';
import 'package:hogwarts_clock/utils/constants/text.dart';

void main() => runApp(
      const App(),
    );

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
