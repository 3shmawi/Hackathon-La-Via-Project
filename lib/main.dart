import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_in/sign_in_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_in/sign_in_states.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_states.dart';
import 'package:la_vie_hackathon_project/shared/cubit/home_cubit/home_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/home_cubit/home_states.dart';
import 'package:la_vie_hackathon_project/shared/image_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()
            ..getFetchTools()..getToolsBuIdModel(1),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: Center(
            child: SizedBox(
              height: 100,
              width: 300,
              child: ElevatedButton(
                onPressed: () {

                  cubit.insertTools(
                    name: "test",
                    description: 'test description',
                    imageBase64: imageTest,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.deepOrange,
                  ),
                ),
                child: Text(
                  'test',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
