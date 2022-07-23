import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/listview_clocks.dart';
import 'package:hogwarts_clock/utils/constants/string_text.dart';

// ignore: must_be_immutable
class ClocksPage extends StatelessWidget {
  ClocksPage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = ClocksRepositories.guid;
    return BlocProvider(
      create: (_) => ClocksCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              BlocBuilder<ClocksCubit, bool>(
                builder: (context, _) {
                  return Column(
                    children: [
                      // ignore: prefer_const_constructors
                      ListViewClocks(),
                      TextButton(
                        onPressed: () async {
                          await ClocksRepositories.loadClocks(
                            guid: controller.text,
                          );
                          context.read<ClocksCubit>().updateState();
                        },
                        child: const Text(StringsText.load),
                      ),
                    ],
                  );
                },
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      await ClocksRepositories.saveClocks(
                        guid: controller.text,
                      );
                    },
                    child: const Text(StringsText.save),
                  ),
                  Text('${StringsText.os}: ${Platform.operatingSystem}'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: StringsText.guid,
                        border: OutlineInputBorder(),
                      ),
                      controller: controller,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.text = ClocksRepositories.newGUID();
                    },
                    child: const Text(StringsText.generate),
                  ),
                  TextButton(
                    onPressed: () {
                      ClocksRepositories.saveGUID(guid: controller.text);
                    },
                    child: const Text(StringsText.saveGUID),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
