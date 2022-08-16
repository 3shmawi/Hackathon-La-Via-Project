import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_states.dart';

import '../../../../models/auth/sign_up.dart';
import '../../../network/remote/dio/dio_helper.dart';
import '../../../network/remote/repository/repository_helper.dart';

class SignUpCubit extends Cubit<SingUpStates> {
  SignUpCubit() : super(SingUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  late SignUp signUpModel;

  void signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    emit(SignUpLoadingState());
    RepositoryHelper(DioHelper())
        .signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    )
        .then((value) {
      signUpModel = value;
      print(signUpModel.type);
      emit(SignUpSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState());
    });
  }
}
