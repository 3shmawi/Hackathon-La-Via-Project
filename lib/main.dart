import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/layout/mobile/layout_mobile/layout_mobile_screen.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_in/sign_in_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/home_cubit/home_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/logic_cubit/logic_cubit.dart';
import 'package:la_vie_hackathon_project/shared/network/remote/dio/dio_helper.dart';
import 'package:la_vie_hackathon_project/shared/shared_preferences/cache_helper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'modules/mobile/layout_auth/layout_auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    String? token = CacheHelper.getData(key: SharedKeys.accessToken);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogicCubit>(
          create: (context) => LogicCubit(),
        ), BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()
            ..getFetchTools()
            ..getFetchSeeds()
            ..getFetchPlants()
            ..getGetFiltersModel()
            ..getFetchPlantsModel()
            ..getFetchAllBlogsModel()
            ..getFetchProductsModel()
            ..getGetCurrentUserModel()
            ..getFetchProductBlogsModel(),
        ),
      ],
      child: MaterialApp(
        home: (token == null)
            ? const LayoutAuthScreen()
            : const LayoutMobileScreen(),
      ),
    );
  }
}
