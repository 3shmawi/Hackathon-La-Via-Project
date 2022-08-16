import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/models/auth/sign_in.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_in/sign_in_states.dart';
import 'package:la_vie_hackathon_project/shared/network/remote/dio/dio_helper.dart';
import 'package:la_vie_hackathon_project/shared/network/remote/repository/repository_helper.dart';

class SignInCubit extends Cubit<SingInStates> {
  SignInCubit() : super(SingInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  late SignIn signInModel;

  void signIn({required String email, required String password}) {
    emit(SignInLoadingState());
    RepositoryHelper(DioHelper())
        .signIn(email: email, password: password)
        .then((value) {
      signInModel = value;
      print(signInModel.type);
      emit(SignInSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignInErrorState());
    });
  }
}
