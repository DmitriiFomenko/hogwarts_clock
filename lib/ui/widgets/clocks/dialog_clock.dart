import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/flask.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/substance.dart';

abstract class DialogClock {
  static void showSettingValue({
    required BuildContext context,
    required int index,
    required VoidCallback onPressedInc,
    required VoidCallback onPressedDec,
    required ClocksCubit cubit,
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<ClocksCubit, bool>(
                bloc: cubit,
                builder: (context, _) {
                  return Flask(
                    height: 300,
                    width: 50,
                    substance: Substance(
                      color: ClocksRepositories.clocks[index].colorSubstance,
                      fillingDegree: ClocksRepositories.clocks[index].value,
                      height: 300,
                    ),
                  );
                },
              ),
              Row(
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
            ],
          ),
        );
      },
    );
  }
}
