import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/models/clocks.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/flask.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/widgets/substance.dart';
import 'package:hogwarts_clock/utils/constants/keys_string.dart';

abstract class DialogClock {
  static void showSettingValue({
    required BuildContext context,
    required int index,
    required VoidCallback onPressedInc,
    required VoidCallback onPressedDec,
    required ClocksCubit clocksCubit,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '${KeysString.changeValueClock} #$index',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<ClocksCubit, Clocks>(
                bloc: clocksCubit,
                builder: (context, state) {
                  return Flask(
                    height: 300,
                    width: 50,
                    substance: Substance(
                      color: state.clocks[index].colorSubstance,
                      fillingDegree: state.clocks[index].value,
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
                      KeysString.dec,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onPressedInc,
                    child: const Text(
                      KeysString.inc,
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
