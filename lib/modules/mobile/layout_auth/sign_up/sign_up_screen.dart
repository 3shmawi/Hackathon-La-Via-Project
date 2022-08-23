import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie_hackathon_project/layout/mobile/layout_mobile/layout_mobile_screen.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_in/sign_in_states.dart';
import 'package:la_vie_hackathon_project/shared/cubit/auth_cubit/sign_up/sign_up_states.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/cubit/auth_cubit/sign_up/sign_up_cubit.dart';
import '../../../../shared/shared_preferences/cache_helper.dart';

class SignUpMobileScreen extends StatelessWidget {
  const SignUpMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return BlocConsumer<SignUpCubit, SingUpStates>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
        }
      },
      builder: (context, state) {
        var cubit = SignUpCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DefaultFormField(
                          maxLines: 1,
                          textInputType: TextInputType.emailAddress,
                          header: 'First Name',
                          controller: firstNameController,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DefaultFormField(
                          maxLines: 1,
                          textInputType: TextInputType.emailAddress,
                          header: 'Last Name',
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    maxLines: 1,
                    textInputType: TextInputType.emailAddress,
                    header: 'E-mail',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    maxLines: 1,
                    textInputType: TextInputType.emailAddress,
                    header: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFormField(
                    maxLines: 1,
                    textInputType: TextInputType.emailAddress,
                    header: 'Confirm password',
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  (state is SignUpLoadingState)
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )
                      : DefaultElevatedButton(
                          header: 'Sign up',
                          onPressed: () {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              cubit.signUp(
                                context,
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                              );
                            }
                          },
                        ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            color: HexColor('FF#6F6F6F'),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const DefaultOrLoginWith(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
