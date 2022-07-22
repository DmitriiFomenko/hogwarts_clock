// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart' show Cubit;
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';

class ClocksCubit extends Cubit<bool> {
  ClocksCubit() : super(true);

  void incValue({required int index}) {
    ClocksRepositories.clocks[index].value += 0.2;

    if (ClocksRepositories.clocks[index].value > 1) {
      ClocksRepositories.clocks[index].value = 0;
    }

    emit(!state);
  }

  void decValue({required int index}) {
    ClocksRepositories.clocks[index].value -= 0.2;

    if (ClocksRepositories.clocks[index].value < 0) {
      ClocksRepositories.clocks[index].value = 1;
    }

    emit(!state);
  }
}
