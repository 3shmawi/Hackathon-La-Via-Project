import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextButton(
                  text: 'SignUp',
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 240,
                ),
                DefaultTextButton(
                  text: 'Login',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              endIndent: 120,
              indent: 120,
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/default_image.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 330),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',
                            style: TextStyle(
                              color: HexColor('FF#6F6F6F'),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email must not be empty!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Password',
                            style: TextStyle(
                              color: HexColor('FF#6F6F6F'),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty!';
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 459,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return HexColor('FF#1ABC00');
                                  }
                                  return Colors.grey;
                                }),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Forget password ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: HexColor('FF#1ABC00'),
                            fixedSize: const Size(1000, 50),
                          ),
                          onPressed: () {},
                          child: const Text('Login'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont have an account?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return HexColor('FF#1ABC00');
                                  }
                                  return Colors.grey;
                                }),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          const Expanded(
                            child: Divider(
                              indent: 60,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return HexColor('FF#1ABC00');
                                  }
                                  return Colors.grey;
                                }),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'or continue with',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              endIndent: 40,
                              color: Colors.grey,
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          fit: StackFit.passthrough,
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                    'assets/images/default_image.png',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
