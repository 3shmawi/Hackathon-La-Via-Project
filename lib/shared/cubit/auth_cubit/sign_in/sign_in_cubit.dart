import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/models/auth/sign_in.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_in/sign_in_states.dart';
import 'package:la_vie_hackathon_project/shared/network/remote/dio/dio_helper.dart';

import '../../../../layout/mobile/layout_mobile/layout_mobile_screen.dart';
import '../../../components/components.dart';
import '../../../shared_preferences/cache_helper.dart';
import '../../../url_end_point/end_points.dart';

class SignInCubit extends Cubit<SingInStates> {
  SignInCubit() : super(SingInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  late SignIn signInModel;

  void signIn(context, {required String email, required String password}) {
    emit(SignInLoadingState());
    DioHelper.postData(
      url: EndPoint.loginWithEmail,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print('getting sing in data ${SignIn.fromJson(value.data).type}');

      signInModel = SignIn.fromJson(value.data);
      print('sign in model data ${signInModel.type}');
      CacheHelper.saveData(
        key: SharedKeys.accessToken,
        value: signInModel.data.accessToken,
      ).then((value) {
        defaultNavigateAndFinish(context, const LayoutMobileScreen());
      });

      emit(SignInSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'error when getting sign in data ${error.response!.data['message']}');
      }
      emit(SignInErrorState());
    });
  }
}
