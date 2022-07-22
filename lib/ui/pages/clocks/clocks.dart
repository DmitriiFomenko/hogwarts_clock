import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/listview_clocks.dart';

// ignore: must_be_immutable
class ClocksPage extends StatelessWidget {
  const ClocksPage({Key? key}) : super(key: key);

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
                      // ignore: prefer_const_constructors
                      ListViewClocks(),
                      TextButton(
                        onPressed: () async {
                          await ClocksRepositories.loadClocks();
                          context.read<ClocksCubit>().updateState();
                        },
                        child: const Text('Load'),
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () async {
                  await ClocksRepositories.saveClocks();
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
}
