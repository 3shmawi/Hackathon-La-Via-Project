import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/layout/mobile/layout_mobile/layout_mobile_screen.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_states.dart';
import 'package:la_vie_hackathon_project/shared/shared_preferences/cache_helper.dart';

import '../../../../models/auth/sign_up.dart';
import '../../../network/remote/dio/dio_helper.dart';
import '../../../url_end_point/end_points.dart';

class SignUpCubit extends Cubit<SingUpStates> {
  SignUpCubit() : super(SingUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  late SignUp signUpModel;

  //sign up
  void signUp(
    context, {
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: EndPoint.signUp,
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      },
    ).then((value) {
      print('getting sing up data ${SignUp.fromJson(value.data).type}');

      signUpModel = SignUp.fromJson(value.data);
      print('sign up model data ${signUpModel.type}');
      CacheHelper.saveData(
        key: SharedKeys.accessToken,
        value: signUpModel.data.accessToken,
      ).then((value) {
        defaultNavigateAndFinish(context, const LayoutMobileScreen());
      });

      emit(SignUpSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'error when getting sign up data ${error.response!.data['message']}');
      }
      emit(SignUpErrorState());
    });
  }
}
