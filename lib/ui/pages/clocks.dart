import 'package:flutter/material.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/widgets/clock_button/clock_button.dart';

// ignore: must_be_immutable
class ClocksPage extends StatelessWidget {
  const ClocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 310,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ClocksRepositories.clocks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClockButton(
                  fillingDegree: ClocksRepositories.clocks[index].value,
                  color: ClocksRepositories.clocks[index].colorSubstance,
                  onPressed: () {
                    debugPrint(
                      ClocksRepositories.clocks[index].value.toString(),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
