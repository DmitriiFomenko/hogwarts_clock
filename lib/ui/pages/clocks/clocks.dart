import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clock_button/clock_button.dart';

// ignore: must_be_immutable
class ClocksPage extends StatelessWidget {
  const ClocksPage({Key? key}) : super(key: key);

  void _showDialogSettingClock({
    required BuildContext context,
    required int index,
    required VoidCallback onPressedInc,
    required VoidCallback onPressedDec,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Change value clock #$index',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onPressedDec,
                child: const Text(
                  'Dec',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: onPressedInc,
                child: const Text(
                  'Inc',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClocksCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 310,
            child: BlocBuilder<ClocksCubit, bool>(
              builder: (context, _) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ClocksRepositories.clocks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClockButton(
                        fillingDegree: ClocksRepositories.clocks[index].value,
                        color: ClocksRepositories.clocks[index].colorSubstance,
                        onPressed: () {
                          _showDialogSettingClock(
                            context: context,
                            index: index,
                            onPressedInc: () {
                              context
                                  .read<ClocksCubit>()
                                  .incValue(index: index);
                            },
                            onPressedDec: () {
                              context
                                  .read<ClocksCubit>()
                                  .decValue(index: index);
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
