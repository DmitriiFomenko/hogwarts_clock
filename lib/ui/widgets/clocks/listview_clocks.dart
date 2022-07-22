import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/clock_button/clock_button.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/dialog_clock.dart';

class ListViewClocks extends StatelessWidget {
  const ListViewClocks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 310,
        width: 324,
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
                  DialogClock.showSettingValue(
                    context: context,
                    index: index,
                    onPressedInc: () {
                      context.read<ClocksCubit>().incValue(index: index);
                    },
                    onPressedDec: () {
                      context.read<ClocksCubit>().decValue(index: index);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
