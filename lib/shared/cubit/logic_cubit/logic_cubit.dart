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
}
