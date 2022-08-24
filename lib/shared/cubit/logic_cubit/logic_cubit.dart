import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic_states.dart';

class LogicCubit extends Cubit<LogicStates> {
  LogicCubit() : super(LogicInitialState());

  static LogicCubit get(context) => BlocProvider.of(context);

  int index = 0;

  void changeIndexTapBar(int newIndex) {
    index = newIndex;
    emit(ChangeTapBarState());
  }

  List<int> numberOfProducts = [];

  void changeNumberOfProductsIncrement(index) {
    numberOfProducts[index]++;
    emit(ChangeNumberOfIncrementState());
  }

  void changeNumberOfProductsDecrement(index) {
    if (numberOfProducts[index] > 0) {
      numberOfProducts[index]--;
    }

    emit(ChangeNumberOfDecrementState());
  }
}
