import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_clock/models/clocks.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/services/firebase_clocks.dart';
import 'package:hogwarts_clock/services/guid.dart';
import 'package:hogwarts_clock/ui/pages/clocks/cubit/clocks_cubit.dart';
import 'package:hogwarts_clock/ui/widgets/clocks/listview_clocks.dart';
import 'package:hogwarts_clock/utils/constants/keys_string.dart';

// ignore: must_be_immutable
class ClocksPage extends StatelessWidget {
  ClocksPage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = ClocksRepositories.clocks!.guid;
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
                          ClocksRepositories.clocks = Clocks(
                            clocks: ClocksRepositories.clocks!.clocks,
                            guid: controller.text,
                          );

                          ClocksRepositories.clocks = await FirebaseClocks.load(
                            guid: ClocksRepositories.clocks!.guid,
                          );

                          context.read<ClocksCubit>().updateState();
                        },
                        child: const Text(KeysString.load),
                      ),
                    ],
                  );
                },
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      ClocksRepositories.clocks = Clocks(
                        clocks: ClocksRepositories.clocks!.clocks,
                        guid: controller.text,
                      );

                      await FirebaseClocks.save(
                        clocks: ClocksRepositories.clocks!,
                      );
                    },
                    child: const Text(KeysString.save),
                  ),
                  Text('${KeysString.os}: ${Platform.operatingSystem}'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: KeysString.guid,
                        border: OutlineInputBorder(),
                      ),
                      controller: controller,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ClocksRepositories.clocks = Clocks(
                        clocks: ClocksRepositories.clocks!.clocks,
                        guid: GUID.generate(),
                      );
                      controller.text = ClocksRepositories.clocks!.guid;
                    },
                    child: const Text(KeysString.generate),
                  ),
                  TextButton(
                    onPressed: () {
                      GUID.save(guid: controller.text);
                    },
                    child: const Text(KeysString.saveGUID),
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
