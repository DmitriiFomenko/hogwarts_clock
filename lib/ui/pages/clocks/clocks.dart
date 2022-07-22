import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
          child: Column(
            children: [
              BlocBuilder<ClocksCubit, bool>(
                builder: (context, _) {
                  return Column(
                    children: [
                      Center(
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
                                  fillingDegree:
                                      ClocksRepositories.clocks[index].value,
                                  color: ClocksRepositories
                                      .clocks[index].colorSubstance,
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
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await loadClocks();
                          context.read<ClocksCubit>().updateState();
                        },
                        child: const Text('Load'),
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  saveClocks();
                },
                child: const Text('Save'),
              ),
              Text('OS: ${Platform.operatingSystem}'),
            ],
          ),
        ),
      ),
    );
  }

  Future saveClocks() async {
    final docClock =
        FirebaseFirestore.instance.collection('clocks').doc('test');

    await docClock.set(ClocksRepositories.toJson());
  }

  Future loadClocks() async {
    final docClock =
        FirebaseFirestore.instance.collection('clocks').doc('test');
    final snapshot = await docClock.get();

    if (snapshot.exists) {
      ClocksRepositories.fromJson(snapshot.data()!);
    }
  }
}
