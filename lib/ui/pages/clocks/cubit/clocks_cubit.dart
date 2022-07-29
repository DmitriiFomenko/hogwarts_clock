// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart' show Cubit;
import 'package:hogwarts_clock/models/clocks.dart';
import 'package:hogwarts_clock/repositories/clocks_repositories.dart';
import 'package:hogwarts_clock/services/firebase_clocks.dart';

class ClocksCubit extends Cubit<Clocks> {
  ClocksCubit() : super(ClocksRepositories.clocks!);

  void incValue({required int index}) {
    Clocks newState = state.clone();

    newState.clocks[index].value += 0.2;
    if (newState.clocks[index].value > 1) {
      newState.clocks[index].value = 0;
    }

    ClocksRepositories.clocks = newState;
    emit(newState);
  }

  void decValue({required int index}) {
    Clocks newState = state.clone();

    newState.clocks[index].value -= 0.2;

    if (newState.clocks[index].value < 0) {
      newState.clocks[index].value = 1;
    }

    ClocksRepositories.clocks = newState;
    emit(newState);
  }

  Future<void> saveClocks({required String guid}) async {
    ClocksRepositories.clocks = Clocks(
      clocks: state.clocks,
      guid: guid,
    );

    await FirebaseClocks.save(
      clocks: ClocksRepositories.clocks!,
    );
  }

  Future<void> loadClocks({required String guid}) async {
    Clocks? newClocks = await FirebaseClocks.load(
      guid: guid,
    );

    ClocksRepositories.clocks = newClocks;
    emit(newClocks!);
  }
}
